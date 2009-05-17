/* $MirOS: contrib/hosted/fwcf/fts_debg.c,v 1.2 2006/09/23 23:21:04 tg Exp $ */

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
#include <sys/stat.h>
#include <stdio.h>

#include "defs.h"
#include "fts_subs.h"

__RCSID("$MirOS: contrib/hosted/fwcf/fts_debg.c,v 1.2 2006/09/23 23:21:04 tg Exp $");

void
ftsf_debugent(ftsf_entry *e)
{
	fprintf(stderr,
	    "%s @%08X %06o %2u %u %06llX %lu:%lu %s/\033[1m%s\033[0m%c\n",
	    (e->etype == FTSF_DIR ? "DIR" : e->etype == FTSF_FILE ? "REG" :
	    e->etype == FTSF_SYMLINK ? "SYM" : "OTH"),
	    (unsigned)e->statp->st_ino, (unsigned)e->statp->st_mode,
	    e->statp->st_nlink, (unsigned)e->statp->st_mtime,
	    (uint64_t)e->statp->st_size, (u_long)e->statp->st_uid,
	    (u_long)e->statp->st_gid, ftsf_prefix, e->pathname,
	    ((e->statp->st_mode & S_IFMT) == S_IFDIR ? '/' :
	    (e->statp->st_mode & S_IFMT) == S_IFIFO ? '|' :
	    (e->statp->st_mode & S_IFMT) == S_IFLNK ? '@' :
	    (e->statp->st_mode & S_IFMT) == S_IFSOCK ? '=' :
	    (e->statp->st_mode & S_IFMT) == S_IFBLK ? '&' :
	    (e->statp->st_mode & S_IFMT) == S_IFCHR ? '%' :
	    (e->statp->st_mode & (S_IXUSR | S_IXGRP | S_IXOTH)) ? '*' : '_'));
}
