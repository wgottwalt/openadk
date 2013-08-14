/* $MirOS: contrib/hosted/fwcf/ft_creat.c,v 1.2 2006/09/23 23:21:04 tg Exp $ */

/*-
 * Copyright (c) 2006
 *	Thorsten Glaser <tg@mirbsd.de>
 *
 * Licensee is hereby permitted to deal in this work without restric-
 * tion, including unlimited rights to use, publicly perform, modify,
 * merge, distribute, sell, give away or sublicence, provided all co-
 * pyright notices above, these terms and the disclaimer are retained
 * in all redistributions or reproduced in accompanying documentation
 * or other materials provided with binary redistributions.
 *
 * Licensor offers the work "AS IS" and WITHOUT WARRANTY of any kind,
 * express, or implied, to the maximum extent permitted by applicable
 * law, without malicious intent or gross negligence; in no event may
 * licensor, an author or contributor be held liable for any indirect
 * or other damage, or direct damage except proven a consequence of a
 * direct error of said person and intended use of this work, loss or
 * other issues arising in any way out of its use, even if advised of
 * the possibility of such damage or existence of a defect.
 */

#include <sys/param.h>
#include <sys/time.h>
#include <sys/stat.h>
#include <err.h>
#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "defs.h"
#include "pack.h"

__RCSID("$MirOS: contrib/hosted/fwcf/ft_creat.c,v 1.2 2006/09/23 23:21:04 tg Exp $");

static size_t ft_creat(char *);
static void make_directory(char *, uint32_t, uint32_t, uint32_t, time_t);
static void make_file(char *, uint8_t *, size_t);
static void make_symlink(char *, uint8_t *, size_t);
static void pop_directories(void);
static void do_chown(char *, uid_t, gid_t);
static void do_chmod(char *, mode_t);
static void do_mtime(char *, time_t);
static char *pfxname(const char *);

static struct a_directory {
	struct a_directory *next;
	char *pathname;
	uid_t owner;
	gid_t group;
	mode_t perms;
	time_t mtime;
} *directories;

static char basename[PATH_MAX];
static size_t basename_len;

void
ft_creatm(char *buf, const char *pathname)
{
	directories = NULL;
	snprintf(basename, sizeof (basename), "%s/", pathname);
	basename_len = strlen(basename);
	while (*buf)
		buf += ft_creat(buf);
	if (directories != NULL)
		pop_directories();
}

static size_t
ft_creat(char *buf)
{
	uint8_t c, *p;
	char *fname;
	size_t i, type = 0, size = 0;
	uint32_t x_uid = 0, x_gid = 0, x_mode = 0;
	time_t x_mtime = 0;

	i = strlen(buf) + 1;
	p = (uint8_t *)buf + i;
	fname = pfxname(buf);
	while (*p)
		switch (c = *p++) {
		case 0x01:
			/* block special device */
			type = 1;
			break;
		case 0x02:
			/* character special device */
			type = 1;
			break;
		case 0x03:
			/* symbolic link */
			type = 2;
			break;
		case 0x04:
			/* hard link */
			type = 1;
			break;
		case 0x05:
			/* directory */
			type = 3;
			break;
		case 0x10:
			/* modification time */
			x_mtime = LOADD(p);
			p += 4;
			break;
		case 'g':
		case 'G':
			x_gid = (c == 'g') ? *p : LOADD(p);
			p += (c == 'g') ? 1 : 4;
			break;
		case 'i':
		case 'I':
			/* x_inode = (c == 'i') ? *p : LOADW(p); */
			p += (c == 'i') ? 1 : 2;
			break;
		case 'm':
		case 'M':
			x_mode = (c == 'm') ? LOADW(p) : LOADD(p);
			p += (c == 'm') ? 2 : 4;
			break;
		case 'u':
		case 'U':
			x_uid = (c == 'u') ? *p : LOADD(p);
			p += (c == 'u') ? 1 : 4;
			break;
		case 's':
		case 'S':
			size = (c == 's') ? *p : LOADT(p);
			p += (c == 's') ? 1 : 3;
			break;
		default:
			errx(1, "unknown attribute %02Xh", c);
		}
	/* skip over final NUL byte */
	++p;

	switch (type) {
	case 1:
		/* no data, not implemented */
		if (size)
			fputs("WARN: size not allowed, ignoring\n", stderr);
		size = 0;
		break;
	case 2:
		/* symbolic link */
		make_symlink(fname, p, size);
		x_mtime = 0;
		x_mode = 0;
		break;
	case 3:
		/* directory */
		if (size)
			fputs("WARN: size not allowed, ignoring\n", stderr);
		size = 0;
		make_directory(fname, x_mode, x_uid, x_gid, x_mtime);
		goto notfile;
		break;
	case 0:
		/* regular file */
		make_file(fname, p, size);
		break;
	default:
		abort();
	}

	if (x_uid || x_gid)
		do_chown(fname, x_uid, x_gid);

	if (x_mode)
		do_chmod(fname, x_mode);

	if (x_mtime)
		do_mtime(fname, x_mtime);

 notfile:
	if (type != 3)
		free(fname);

	return ((p - (uint8_t *)buf) + size);
}

static void
make_directory(char *n, uint32_t m, uint32_t u, uint32_t g, time_t t)
{
	struct a_directory *newdir;

	if ((newdir = malloc(sizeof (struct a_directory))) == NULL)
		err(1, "out of memory");

	newdir->next = directories;
	directories = newdir;

	newdir->pathname = n;
	newdir->owner = u;
	newdir->group = g;
	newdir->perms = m;
	newdir->mtime = t;

	if (mkdir(n, 0700))
		if (errno != EEXIST)
			warn("mkdir %s", n);
}

static void
make_file(char *n, uint8_t *buf, size_t len)
{
	int fd;

	unlink(n);

	if ((fd = open(n, O_WRONLY | O_CREAT | O_TRUNC, 0700)) < 0) {
		warn("open %s", n);
		return;
	}

	if ((size_t)write(fd, buf, len) != len)
		warn("could not write %lu bytes", (unsigned long)len);

	if (close(fd))
		warn("close");
}

static void
make_symlink(char *n, uint8_t *buf, size_t len)
{
	char target[len + 1];

	memcpy(target, buf, len);
	target[len] = '\0';

	unlink(n);

	if (symlink(target, n))
		warn("symlink %s -> %s", n, target);
}

static void
pop_directories(void)
{
	struct a_directory *p;

	while ((p = directories) != NULL) {
		directories = p->next;

		if (p->pathname == NULL)
			warnx("pathname for a directory is NULL");
		else {
			do_chown(p->pathname, p->owner, p->group);
			do_chmod(p->pathname, p->perms);
			do_mtime(p->pathname, p->mtime);
			free(p->pathname);
		}
		free(p);
	}
}

static void
do_chown(char *n, uid_t o, gid_t g)
{
	if (lchown(n, o, g))
		warn("lchown %d:%d %s", (int)o, (int)g, n);
}

static void
do_chmod(char *n, mode_t m)
{
	if (chmod(n, m & 07777))
		warn("lchmod 0%o %s", m & 07777, n);
}

static void
do_mtime(char *n, time_t t)
{
	struct timeval tv[2] = { {0,0}, {0,0} };

	tv[1].tv_sec = t;
	if (utimes(n, tv))
		warn("utimes %d %s", (int)t, n);
}

static char *
pfxname(const char *component)
{
	char *foo;
	size_t len, x;

	len = basename_len + (x = strlen(component) + /* NUL */ 1);
	if ((foo = malloc(len)) == NULL)
		err(1, "out of memory");
	memcpy(foo, basename, basename_len);
	if ((component[0] == '.') && (component[1] == '\0'))
		foo[basename_len] = '\0';
	else
		memcpy(foo + basename_len, component, x);

	return (foo);
}
