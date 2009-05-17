/* $MirOS: contrib/hosted/fwcf/cpr_list.c,v 1.4 2006/09/24 03:21:29 tg Exp $ */

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
#include <stdio.h>

#include "defs.h"
#include "compress.h"

__RCSID("$MirOS: contrib/hosted/fwcf/cpr_list.c,v 1.4 2006/09/24 03:21:29 tg Exp $");

int
compress_list(void)
{
	fwcf_compressor *cl;
	int i;

	if ((cl = compress_enumerate()) == NULL)
		return (1);

	for (i = 0; i < 256; ++i)
		if (cl[i].name != NULL)
			printf("%02Xh = %s%s\n", cl[i].code,
			    (i < 0xE0 ? "" : "PRIVATE "), cl[i].name);
	return (0);
}
