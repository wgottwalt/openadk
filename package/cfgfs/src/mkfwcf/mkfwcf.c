/* $MirOS: contrib/hosted/fwcf/mkfwcf/mkfwcf.c,v 1.13 2006/09/24 20:35:00 tg Exp $ */

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

__RCSID("$MirOS: contrib/hosted/fwcf/mkfwcf/mkfwcf.c,v 1.13 2006/09/24 20:35:00 tg Exp $");

static int mkfwcf(int, const char *, int);
static __dead void usage(void);

int
main(int argc, char *argv[])
{
	int c;
	int fd = STDOUT_FILENO, docompress = 0, doempty = 0;
	const char *file_root = NULL, *outfile = NULL;

	while ((c = getopt(argc, argv, "C:celo:")) != -1)
		switch (c) {
		case 'C':
			if (!(docompress = strtonum(optarg, 1, 255, NULL)))
				usage();
			break;
		case 'c':
			docompress = 1;
			break;
		case 'e':
			doempty = 1;
			break;
		case 'l':
			return (list_compressors());
		case 'o':
			outfile = optarg;
			break;
		default:
			usage();
		}
	argc -= optind;
	argv += optind;

	if ((argc < 0) || (argc > 1))
		usage();

	if (argc && doempty)
		usage();

	if (argc)
		file_root = *argv;

	if (outfile != NULL)
		if ((fd = open(outfile, O_WRONLY | O_CREAT | O_TRUNC,
		    0666)) < 0)
			err(1, "open %s", outfile);

	if ((file_root == NULL) && !doempty)
		if ((file_root = getcwd(NULL, 0)) == NULL)
			err(1, "cannot determine current working directory");

	return (mkfwcf(fd, doempty ? NULL : file_root, docompress));
}

static __dead void
usage(void)
{
	extern const char *__progname;

	fprintf(stderr, "Usage:\t%s [-e] [-c | -C <algorithm-number>] [-o <outfile>]"
	    "\n\t    [<directory>]\n\t%s -l\n", __progname, __progname);
	exit(1);
}

static int
mkfwcf(int fd, const char *dir, int algo)
{
	size_t sz;
	char *data;

	data = fwcf_packm(dir, algo, &sz);
	return ((size_t)write(fd, data, sz) == sz ? 0 : 1);
}
