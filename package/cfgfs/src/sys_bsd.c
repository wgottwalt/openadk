/* $MirOS: contrib/hosted/fwcf/sys_bsd.c,v 1.4 2007/03/13 18:14:30 tg Exp $ */

/*-
 * Copyright (c) 2006, 2007
 *	Thorsten Glaser <tg@mirbsd.de>
 *
 * Provided that these terms and disclaimer and all copyright notices
 * are retained or reproduced in an accompanying document, permission
 * is granted to deal in this work without restriction, including un-
 * limited rights to use, publicly perform, distribute, sell, modify,
 * merge, give away, or sublicence.
 *
 * This work is provided "AS IS" and WITHOUT WARRANTY of any kind, to
 * the utmost extent permitted by applicable law, neither express nor
 * implied; without malicious intent or gross negligence. In no event
 * may a licensor, author or contributor be held liable for indirect,
 * direct, other damage, loss, or other issues arising in any way out
 * of dealing in the work, even if advised of the possibility of such
 * damage or existence of a defect, except proven that it results out
 * of said person's immediate fault when using the work as intended.
 */

#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>

#include "defs.h"
#include "sysdeps.h"

__RCSID("$MirOS: contrib/hosted/fwcf/sys_bsd.c,v 1.4 2007/03/13 18:14:30 tg Exp $");

void
pull_rndata(uint8_t *buf, size_t n)
{
#ifdef RND_DISABLE
	while (n--)
		*buf++ = 0xF6;
	*--buf = 0xFF;
#else
#ifdef RND_DEBUG
	fprintf(stderr, "writing %ld bytes of entropy\n", n);
	while (n > 4) {
#else
	while (n >= 4) {
#endif
		*(uint32_t *)buf = arc4random();
#ifdef RND_DEBUG
		*buf = 0xF6;
#endif
		buf += 4;
		n -= 4;
	}
	while (n) {
#ifdef RND_DEBUG
		*buf++ = 0xF6;
#else
		*buf++ = arc4random() & 0xFF;
#endif
		n--;
	}
#ifdef RND_DEBUG
		*--buf = 0xFF;
#endif
#endif
}

void
push_rndata(uint8_t *buf, size_t n)
{
#ifdef RND_DEBUG
	size_t i;
#endif
#ifdef __MirBSD__
	arc4random_pushb(buf, n);
#else
	int fd;
	uint32_t x;

	arc4random_addrandom(buf, n);
	x = arc4random();
	if ((fd = open("/dev/arandom", O_WRONLY)) >= 0) {
		write(fd, &x, 4);
		close(fd);
	} else
		warn("cannot write to /dev/arandom");
#endif
#ifdef RND_DEBUG
	printf("reading %ld bytes of entropy\n", n);
	for (i = 0; i < n; ++i) {
		printf(" %02X", buf[i]);
		if ((i & 0xF) == 0xF)
			putchar('\n');
	}
	putchar('\n');
#endif
}
