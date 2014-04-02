/*-
 * Copyright © 2010
 *	Waldemar Brodkorb <wbx@openadk.org>
 *	Thorsten Glaser <tg@mirbsd.org>
 *
 * Provided that these terms and disclaimer and all copyright notices
 * are retained or reproduced in an accompanying document, permission
 * is granted to deal in this work without restriction, including un‐
 * limited rights to use, publicly perform, distribute, sell, modify,
 * merge, give away, or sublicence.
 *
 * This work is provided “AS IS” and WITHOUT WARRANTY of any kind, to
 * the utmost extent permitted by applicable law, neither express nor
 * implied; without malicious intent or gross negligence. In no event
 * may a licensor, author or contributor be held liable for indirect,
 * direct, other damage, loss, or other issues arising in any way out
 * of dealing in the work, even if advised of the possibility of such
 * damage or existence of a defect, except proven that it results out
 * of said person’s immediate fault when using the work as intended.
 *
 * Alternatively, this work may be distributed under the terms of the
 * General Public License, any version, as published by the Free Soft-
 * ware Foundation.
 *-
 * Display the size of a block device (e.g. USB stick, CF/SF/MMC card
 * or hard disc) in 512-byte sectors.
 */

#define _FILE_OFFSET_BITS 64

#include <sys/param.h>
#include <sys/types.h>
#include <sys/ioctl.h>
#include <sys/mount.h>

#if defined(__APPLE__)
#include <sys/disk.h>
#endif

#if defined(DIOCGDINFO)
#include <sys/disklabel.h>
#endif

#include <err.h>
#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>

unsigned long long numsecs(int);

int
main(int argc, char *argv[]) {
	int fd;

	if (argc != 2)
		errx(255, "Syntax: dkgetsz /dev/sda");

	if ((fd = open(argv[1], O_RDONLY)) == -1)
		err(1, "open");
	printf("%llu\n", numsecs(fd));
	close(fd);
	return (0);
}

unsigned long long
numsecs(int fd)
{
#if defined(BLKGETSIZE) || defined(DKIOCGETBLOCKCOUNT)
/*
 * note: BLKGETSIZE64 returns bytes, not sectors, but the return
 * type is size_t which is 32 bits on an ILP32 platform, so it
 * fails interestingly here… thus we use BLKGETSIZE instead.
 */
#if defined(DKIOCGETBLOCKCOUNT)
	uint64_t nsecs;
#define THEIOCTL DKIOCGETBLOCKCOUNT
#define STRIOCTL "DKIOCGETBLOCKCOUNT"
#else
	unsigned long nsecs;
#define THEIOCTL BLKGETSIZE
#define STRIOCTL "BLKGETSIZE"
#endif
	if (ioctl(fd, THEIOCTL, &nsecs) == -1)
		err(1, "ioctl %s", STRIOCTL);
	return ((unsigned long long)nsecs);
#elif defined(DIOCGDINFO)
	struct disklabel dl;

	if (ioctl(fd, DIOCGDINFO, &dl) == -1)
		err(1, "ioctl DIOCGDINFO");
	return ((unsigned long long)dl.d_secperunit);
#else
#warning PLEASE DO IMPLEMENT numsecs FOR THIS PLATFORM.
#endif
}
