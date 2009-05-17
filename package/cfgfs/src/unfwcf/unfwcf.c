/* $MirOS: contrib/hosted/fwcf/unfwcf/unfwcf.c,v 1.8 2006/09/24 20:35:01 tg Exp $ */

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
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include "defs.h"
#include "compress.h"
#include "pack.h"

__RCSID("$MirOS: contrib/hosted/fwcf/unfwcf/unfwcf.c,v 1.8 2006/09/24 20:35:01 tg Exp $");

static int unfwcf(int, const char *);
static __dead void usage(void);

static int do_dump = 0;

int
main(int argc, char *argv[])
{
	int c;
	int fd = STDIN_FILENO;
	const char *file_root = NULL, *infile = NULL;

	while ((c = getopt(argc, argv, "di:l")) != -1)
		switch (c) {
		case 'd':
			do_dump = 1;
			break;
		case 'i':
			infile = optarg;
			break;
		case 'l':
			return (list_compressors());
		default:
			usage();
		}
	argc -= optind;
	argv += optind;

	if (argc != (1 - do_dump))
		usage();

	file_root = *argv;

	if (infile != NULL)
		if ((fd = open(infile, O_RDONLY, 0)) < 0)
			err(1, "open %s", infile);

	return (unfwcf(fd, file_root));
}

static __dead void
usage(void)
{
	extern const char *__progname;

	fprintf(stderr, "Usage:\t%s [-i <infile>] <directory>"
	    "\n\t%s -d [-i <infile>]"
	    "\n\t%s -l\n", __progname, __progname, __progname);
	exit(1);
}

static int
unfwcf(int fd, const char *dir)
{
	char *udata;

	if ((udata = fwcf_unpack(fd, NULL))) {
		if (do_dump)
			ft_dump(udata);
		else
			ft_creatm(udata, dir);
	}
	return (udata != NULL ? 0 : 1);
}
