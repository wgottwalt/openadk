/* $MirOS: contrib/hosted/fwcf/sys_linux.c,v 1.3 2006/09/26 10:25:03 tg Exp $ */

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

#include <err.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include "defs.h"
#include "sysdeps.h"

__RCSID("$MirOS: contrib/hosted/fwcf/sys_linux.c,v 1.3 2006/09/26 10:25:03 tg Exp $");

void
pull_rndata(uint8_t *buf, size_t n)
{
	int fd;

	if ((fd = open("/dev/urandom", O_RDONLY)) < 0) {
		warn("Cannot open /dev/urandom for %sing", "read");
		return;
	}
	if ((size_t)read(fd, buf, n) != n)
		warn("Cannot read %lu bytes from /dev/urandom", (u_long)n);
	close(fd);
}

void
push_rndata(uint8_t *buf, size_t n)
{
	int fd;

	if ((fd = open("/dev/urandom", O_WRONLY)) < 0) {
		warn("Cannot open /dev/urandom for %sing", "writ");
		return;
	}
	if ((size_t)write(fd, buf, n) != n)
		warn("Cannot write %lu bytes to /dev/urandom", (u_long)n);
	close(fd);
}
