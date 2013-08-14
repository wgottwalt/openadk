/* $MirOS: contrib/hosted/fwcf/header.c,v 1.7 2006/09/26 10:25:03 tg Exp $ */

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
#ifdef DEBUG_ADLER
#include <zlib.h>
#endif

#include "defs.h"
#include "adler.h"
#include "pack.h"

char *
mkheader(char *f_header, size_t hdrsize, u_int32_t outer_len,
    u_int32_t inner_len, u_int8_t algo)
{
	char *hdrptr = f_header;
	size_t hdrleft = hdrsize;

#ifdef DEBUG
	fprintf(stderr, "header: inner=%d outer=%d\n", inner_len & 0xFFFFFF,
	    outer_len & 0xFFFFFF);
#endif

	STOREB('F');
	STOREB('W');
	STOREB('C');
	STOREB('F');

	outer_len = (outer_len & 0xFFFFFF) | (FWCF_VER << 24);
	STORED(outer_len);

	inner_len = (inner_len & 0xFFFFFF) | (algo << 24);
	STORED(inner_len);
	return (hdrptr);
}

char *
mktrailer(char *data, size_t len)
{
	char *hdrptr = data + len;
	size_t hdrleft = 4;
	ADLER_DECL;
#ifdef DEBUG_ADLER
	u_int32_t adler = adler32(1, (u_int8_t *)data, len);
#endif

	ADLER_CALC(data);
#ifdef DEBUG_ADLER
	if ((s1 != (adler & 0xFFFF)) || (s2 != (adler >> 16)))
		errx(255, "adler32 implementation error: %04X%04X vs %08X",
		    s2, s1, adler);
#endif
	STOREW(s1);
	STOREW(s2);
	return (data);
}
