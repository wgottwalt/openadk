/* $MirOS: contrib/hosted/fwcf/wraps.c,v 1.7 2006/09/26 10:25:03 tg Exp $ */

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
#include "fts_subs.h"
#include "pack.h"
#include "sysdeps.h"

__RCSID("$MirOS: contrib/hosted/fwcf/wraps.c,v 1.7 2006/09/26 10:25:03 tg Exp $");

char *
fwcf_packm(const char *dir, int algo, size_t *dstsz)
{
	char empty_data = 0, *data, *f_data = NULL;
	size_t i;

	if (dir == NULL) {
		data = &empty_data;
		i = 1;
	} else {
		ftsf_start(dir);
		data = (f_data = ft_packm()) + sizeof (size_t);
		i = *(size_t *)f_data - sizeof (size_t);
	}
	data = fwcf_pack(data, i, algo, dstsz);
	if (f_data != NULL)
		free(f_data);
	return (data);
}

char *
fwcf_pack(char *odata, size_t i, int algo, size_t *dstsz)
{
	int j;
	size_t k;
	char *data, *cdata;

	if (i > 0xFFFFFF)
		errx(1, "inner size of %lu too large", (u_long)i);
#ifdef DEBUG
	fprintf(stderr, "fwcf_pack: algo %02X packing %lu\n", algo, (u_long)i);
#endif

	if ((j = compressor_get(algo)->compress(&cdata, odata, i)) == -1)
		errx(1, "%s compression failed", compressor_get(algo)->name);

	/* 12 bytes header, padding to 4-byte boundary, 4 bytes trailer */
	k = ((j + 19) / 4) * 4;
#if DEF_FLASHPART > 0xFFFFFF
# error DEF_FLASHPART too large
#endif
	if (k > DEF_FLASHPART)
		errx(1, "%lu bytes too large for flash partition of %lu KiB",
		    (u_long)k, DEF_FLASHPART / 1024UL);
	/* padded to size of flash block */
#if (DEF_FLASHBLOCK & 3)
# error DEF_FLASHBLOCK must be dword-aligned
#endif
	*dstsz = ((k + (DEF_FLASHBLOCK - 1)) / DEF_FLASHBLOCK) * DEF_FLASHBLOCK;
	if ((data = malloc(*dstsz)) == NULL)
		err(1, "malloc");
	mkheader(data, *dstsz, k, i, algo);
	memcpy(data + 12, cdata, j);
	free(cdata);
	k = j + 12;
	while (k & 3)
		data[k++] = 0;
	mktrailer(data, k);
	k += 4;
	pull_rndata((uint8_t *)data + k, *dstsz - k);
	return (data);
}
