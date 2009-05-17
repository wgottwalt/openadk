/* $MirOS: contrib/hosted/fwcf/cpr_lsth.c,v 1.3 2006/09/23 23:46:35 tg Exp $ */

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

__RCSID("$MirOS: contrib/hosted/fwcf/cpr_lsth.c,v 1.3 2006/09/23 23:46:35 tg Exp $");

int
list_compressors(void)
{
	int rv;

	printf("List of registered compressors:\n");
	if ((rv = compress_list()))
		printf("No compressor registered!\n");
	return (rv);
}
