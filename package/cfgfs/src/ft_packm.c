/* $MirOS: contrib/hosted/fwcf/ft_packm.c,v 1.4 2006/09/23 23:21:04 tg Exp $ */

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
#include <errno.h>
#include <stdlib.h>
#include <string.h>

#include "defs.h"
#include "fts_subs.h"
#include "pack.h"

__RCSID("$MirOS: contrib/hosted/fwcf/ft_packm.c,v 1.4 2006/09/23 23:21:04 tg Exp $");

char *
ft_packm(void)
{
	ftsf_entry e;
	int i;
	char *rv = NULL, *rv2, *afile;
	size_t len = 1 + sizeof (size_t), k, pos = sizeof (size_t);

	while ((i = ftsf_next(&e)) > 0) {
		//ftsf_debugent(&e);
		if ((e.etype != FTSF_FILE) && (e.etype != FTSF_SYMLINK) &&
		    (e.etype != FTSF_DIR))
			continue;
		if ((afile = ft_pack(&e)) == NULL)
			errx(1, "cannot pack %s/%s", ftsf_prefix, e.pathname);
		len += (k = *(size_t *)afile - sizeof (size_t));
		if ((rv2 = realloc(rv, len)) == NULL) {
			i = errno;
			free(rv);
			errno = i;
			err(1, "malloc");
		}
		rv = rv2;
		memcpy(rv + pos, afile + sizeof (size_t), k);
		pos += k;
		free(afile);
	}
	if (i < 0)
		errx(1, "ft_packm failed in fts");
	if (rv == NULL)
		if ((rv = malloc(len)) == NULL)
			err(1, "malloc");
	rv[len - 1] = '\0';
	*(size_t *)rv = len;
	return (rv);
}
