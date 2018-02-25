/*-
 * Copyright (c) 2007, 2009
 *	Thorsten Glaser <tg@mirbsd.org>
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
 * fgetln() wrapper for operating systems with getline() – glibc
 */

#undef _GNU_SOURCE
#define _GNU_SOURCE		/* for getline() */
#include <sys/types.h>
#include <stdio.h>
#include <string.h>

__RCSID("$MirOS: contrib/code/mirmake/dist/contrib/fgetln.c,v 1.7 2014/12/20 22:23:29 tg Exp $");

char *fgetln(FILE *, size_t *);

char *
fgetln(FILE *stream, size_t *len)
{
	static char *lb = NULL;
	static size_t lbsz = 0;

	if ((*len = getline(&lb, &lbsz, stream)) != (size_t)-1)
		/* getdelim ensures *len is not 0 here */
		return (lb);

	/* not required by manpage, but reference implementation does this */
	*len = 0;

	/* not required to zero lb or lbsz: getdelim manages it */
	return (NULL);
}
