/* $MirOS: contrib/hosted/fwcf/unwraps.c,v 1.10 2006/09/26 10:25:03 tg Exp $ */

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
#ifdef DEBUG
#include <stdio.h>
#endif
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "defs.h"
#include "adler.h"
#include "compress.h"
#include "pack.h"
#include "sysdeps.h"

__RCSID("$MirOS: contrib/hosted/fwcf/unwraps.c,v 1.10 2006/09/26 10:25:03 tg Exp $");

char *
fwcf_unpack(int fd, size_t *inner)
{
	uint8_t c, hdrbuf[12];
	size_t outer, x_inner, x, len, maxln;
	char *cdata, *udata;
	ADLER_DECL;

	if (inner == NULL)
		inner = &x_inner;

	if (read(fd, hdrbuf, 12) != 12)
		err(1, "read");

	if (strncmp((const char *)hdrbuf, "FWCF", 4))
		errx(1, "file format error");

	outer = LOADT(hdrbuf + 4);
	/* we don't need to support older versions, but specification
	   major 0 and 1 are compatible */
	if (hdrbuf[7] > FWCF_VER)
		errx(1, "wrong file version %02Xh", hdrbuf[7]);
	*inner = LOADT(hdrbuf + 8);
	c = hdrbuf[11];
	maxln = ((outer + (DEF_FLASHBLOCK - 1)) / DEF_FLASHBLOCK)
	    * DEF_FLASHBLOCK;

	if (((cdata = malloc(maxln)) == NULL) ||
	    ((udata = malloc(*inner)) == NULL))
		err(1, "malloc");
	memcpy(cdata, hdrbuf, 12);
	if (read(fd, cdata + 12, maxln - 12) < (ssize_t)(outer - 12))
		err(1, "read");

	len = outer - 4;
	ADLER_CALC(cdata);
	if ((s1 != LOADW(cdata + outer - 4)) ||
	    (s2 != LOADW(cdata + outer - 2)))
		errx(1, "crc mismatch: %02X%02X%02X%02X != %04X%04X",
		    (uint8_t)cdata[outer - 1], (uint8_t)cdata[outer - 2],
		    (uint8_t)cdata[outer - 3], (uint8_t)cdata[outer - 4],
		    s2, s1);

	if ((x = compressor_get(c)->decompress(udata, *inner, cdata + 12,
	    outer - 16)) != *inner)
		errx(1, "size mismatch: decompressed %lu, want %lu", (u_long)x,
		    (u_long)*inner);
	push_rndata((uint8_t *)cdata + outer, maxln - outer);
	free(cdata);
#ifdef DEBUG
	fprintf(stderr, "fwcf_unpack: decompressed outer %lu inner %lu\n",
	    (u_long)outer, (u_long)*inner);
#endif
	return (udata);
}
