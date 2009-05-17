/* $MirOS: contrib/hosted/fwcf/adler.h,v 1.10 2007/05/07 16:15:56 tg Exp $ */

/*-
 * Copyright (c) 2006, 2007
 *	Thorsten Glaser <tg@mirbsd.de>
 * The adler32 algorithm is
 * Copyright (C) 1995 Mark Adler
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
 *-
 * See also:
 *	contrib/hosted/fwcf/adler.h
 *	src/lib/libc/hash/adh32.c
 *	src/kern/z/adler32s.c
 *	src/kern/z/adler32_i386.S
 */

#ifndef ADLER_H
#define ADLER_H	"$MirOS: contrib/hosted/fwcf/adler.h,v 1.10 2007/05/07 16:15:56 tg Exp $"

/*
 * ADLER-32 implementation
 */

#define ADLER_BASE 65521 /* largest prime smaller than 65536 */
#define ADLER_NMAX 5552	 /* largest n: 255n(n+1)/2 + (n+1)(BASE-1) <= 2^32-1 */

/* declare everything needed by the adler32 routine */
#define ADLER_DECL		unsigned s1 = 1, s2 = 0, n

/* calculate the adler32 crc of the data pointed to
   by the 'buffer' argument, size expected in 'len'
   which is TRASHED; stores the result in s1 and s2 */
#define ADLER_CALC(buffer)	do {					\
		const uint8_t *adler_buf = (const uint8_t *)(buffer);	\
		while (len) {						\
			len -= (n = MIN(len, ADLER_NMAX));		\
			while (n--) {					\
				s1 += *adler_buf++;			\
				s2 += s1;				\
			}						\
			s1 %= ADLER_BASE;				\
			s2 %= ADLER_BASE;				\
		}							\
	} while (0)

#endif
