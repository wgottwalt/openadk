/* $MirOS: contrib/hosted/fwcf/compress.c,v 1.7 2006/09/23 23:46:35 tg Exp $ */

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
#include <stdlib.h>

#include "defs.h"
#include "compress.h"

__RCSID("$MirOS: contrib/hosted/fwcf/compress.c,v 1.7 2006/09/23 23:46:35 tg Exp $");

static void compress_initialise(void);

static fwcf_compressor *fwcf_compressors = NULL;

int
compress_register(fwcf_compressor *e)
{
	compress_initialise();
	if (e == NULL)
		return (1);

	if ((e->init == NULL) || (e->compress == NULL) ||
	    (e->decompress == NULL) || (e->name == NULL))
		return (1);
	if (fwcf_compressors[e->code].name != NULL)
		return (2);

	fwcf_compressors[e->code] = *e;
	return (0);
}

fwcf_compressor *
compress_enumerate(void)
{
	int i;
	fwcf_compressor *rv = NULL;

	compress_initialise();
	for (i = 0; i < 256; ++i)
		if (fwcf_compressors[i].name != NULL) {
			if (fwcf_compressors[i].code == i)
				rv = fwcf_compressors;
			else
				errx(1, "fwcf compressor registry invalid");
		}
	return (rv);
}

static void
compress_initialise(void)
{
	if (fwcf_compressors != NULL)
		return;
	if ((fwcf_compressors = calloc(256, sizeof (fwcf_compressor))) == NULL)
		err(1, "calloc");
}
