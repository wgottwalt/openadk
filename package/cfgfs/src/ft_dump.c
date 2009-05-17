/* $MirOS: contrib/hosted/fwcf/ft_dump.c,v 1.5 2006/09/23 23:21:04 tg Exp $ */

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
#include <err.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "defs.h"
#include "pack.h"

__RCSID("$MirOS: contrib/hosted/fwcf/ft_dump.c,v 1.5 2006/09/23 23:21:04 tg Exp $");

static int ft_dumpfile(char *);

void
ft_dump(char *buf)
{
	while (*buf)
		buf += ft_dumpfile(buf);
}

static int
ft_dumpfile(char *buf)
{
	uint8_t c;
	int i, type = 0, size = 0;
	uint8_t *p;
	uint32_t x;

	i = strlen(buf) + 1;
	printf("\nNAME=%s\n", buf);
	p = (uint8_t *)buf + i;
	while (*p)
		switch (c = *p++) {
		case 0x01:
			printf("BLOCK\n");
			type = 1;
			break;
		case 0x02:
			printf("CHARACTER\n");
			type = 1;
			break;
		case 0x03:
			printf("SYMLINK\n");
			type = 2;
			break;
		case 0x04:
			printf("HARDLINK\n");
			type = 1;
			break;
		case 0x05:
			printf("DIRECTORY\n");
			type = 1;
			break;
		case 0x10:
		    {
			time_t y = LOADD(p);
			p += 4;
			printf("MTIME=%d -> %s", (int)y, ctime(&y));
			break;
		    }
		case 'g':
		case 'G':
		case 'u':
		case 'U':
			x = (c & 0x20) ? *p : LOADD(p);
			p += (c & 0x20) ? 1 : 4;
			printf("%cID=%d\n", c & ~0x20, x);
			break;
		case 'i':
		case 'I':
			x = (c == 'i') ? *p : LOADW(p);
			p += (c == 'i') ? 1 : 2;
			printf("INODE=%d\n", x);
			break;
		case 'm':
		case 'M':
			x = (c == 'm') ? LOADW(p) : LOADD(p);
			p += (c == 'm') ? 2 : 4;
			printf("MODE=0%o\n", x);
			break;
		case 's':
		case 'S':
			x = (c == 's') ? *p : LOADT(p);
			p += (c == 's') ? 1 : 3;
			printf("SIZE=%d\n", size = x);
			break;
		default:
			errx(1, "unknown attribute %02Xh", c);
		}
	++p;
	if (type == 2) {
		char *target;

		if ((target = malloc(size + 1)) == NULL)
			err(1, "malloc");
		memcpy(target, p, size);
		target[size] = '\0';
		printf("LINK_TARGET=%s\n", target);
		free(target);
	} else if (type == 1) {
		if (size)
			printf("WARN: size not allowed, ignoring\n");
		size = 0;
	} else {
		printf("BEGIN DATA\n");
		fflush(stdout);
		write(STDOUT_FILENO, p, size);
		printf("\nEND DATA\n");
	}
	return ((p - (uint8_t *)buf) + size);
}
