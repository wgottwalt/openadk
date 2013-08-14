/* $MirOS: contrib/hosted/fwcf/tool.c,v 1.7 2007/03/09 22:35:13 tg Exp $ */

/*-
 * Copyright (c) 2006, 2007
 *	Thorsten Glaser <tg@mirbsd.de>
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
 */

#include <sys/param.h>
#include <err.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include "defs.h"
#include "compress.h"
#include "minilzop.h"
#include "pack.h"

static __dead void usage(void);
static int mkfwcf(int, const char *, int);
static int unfwcf(int, const char *);
#ifndef SMALL
static int refwcf(int, int, int);
#endif
static int fsopen(const char *, int, int);

int
main(int argc, char *argv[])
{
	int c;
	int mode = 0, doempty = 0;
	int ifd, ofd;
#ifdef SMALL
	int calg = -1;
#else
	int calg = 0;
	const char *infile = NULL, *outfile = NULL;
#endif
	const char *dfile = NULL;
	const char *file_root = NULL;
	fwcf_compressor *cl;

#ifdef SMALL
	while ((c = getopt(argc, argv, "D:delMUZ")) != -1)
#else
	while ((c = getopt(argc, argv, "C:cD:dei:lMo:RUZ")) != -1)
#endif
		switch (c) {
#ifndef SMALL
		case 'C':
			if (!(calg = strtonum(optarg, 1, 255, NULL))
			    && !(calg = compressor_getbyname(optarg)))
				usage();
			break;
		case 'c':
			calg = -1;
			break;
#endif
		case 'D':
			if (doempty)
				usage();
			dfile = optarg;
			break;
		case 'd':
			mode = (mode == 5 || mode == 6) ? 6 : 3;
			break;
		case 'e':
			if (dfile != NULL)
				usage();
			doempty = 1;
			break;
#ifndef SMALL
		case 'i':
			infile = optarg;
			break;
#endif
		case 'l':
			return (list_compressors());
		case 'M':
			mode = 1;
			break;
#ifndef SMALL
		case 'o':
			outfile = optarg;
			break;
		case 'R':
			mode = 4;
			break;
#endif
		case 'U':
			mode = 2;
			break;
		case 'Z':
			mode = (mode == 3) ? 6 : 5;
			break;
		default:
			usage();
		}
	argc -= optind;
	argv += optind;

	switch (mode) {
	case 1:
		if (argc != ((dfile == NULL) ? (1 - doempty) : 0))
			usage();
		break;
	case 2:
		if (argc != ((dfile == NULL) ? 1 : 0))
			usage();
		break;
#ifndef SMALL
	case 3:
	case 4:
		if (argc || doempty || (dfile != NULL))
			usage();
		break;
#endif
	case 5:
	case 6:
		if ((dfile != NULL) || doempty
#ifndef SMALL
		    || infile || outfile
#endif
		    )
			usage();
		break;
	default:
		usage();
	}
	if (argc)
		file_root = *argv;

	if (mode == 5 || mode == 6) {
		ifd = fsopen(argc-- > 0 ? *argv++ : NULL,
		    O_RDONLY, STDIN_FILENO);
		ofd = fsopen(argc-- > 0 ? *argv++ : NULL,
		    O_WRONLY | O_CREAT | O_TRUNC, STDOUT_FILENO);
		if (argc > 0)
			usage();
#ifndef SMALL
		if (calg == 0)
			/* force host tool to compress even without -c */
			calg = -1;
#endif
		goto get_calg;
	}

#ifdef SMALL
	ifd = STDIN_FILENO;
	ofd = STDOUT_FILENO;
#else
	ifd = fsopen(infile, O_RDONLY, STDIN_FILENO);
	ofd = fsopen(outfile, O_WRONLY | O_CREAT | O_TRUNC, STDOUT_FILENO);
#endif

	if (mode == 2 && dfile != NULL) {
		char *data;
		size_t sz;
		int dfd;

		if ((data = fwcf_unpack(ifd, &sz)) == NULL)
			return (1);
		if ((dfd = fsopen(dfile, O_WRONLY | O_CREAT | O_TRUNC,
		    STDOUT_FILENO)) < 0)
			err(1, "open %s", dfile);
		write_aszdata(dfd, data, sz);
		close(dfd);
		free(data);
		return (0);
	}

	if ((mode == 2) || (mode == 3))
		return (unfwcf(ifd, (mode == 3) ? NULL : file_root));

 get_calg:
	if (calg == -1) {
		if ((cl = compress_enumerate()) != NULL)
			for (calg = 1; calg < 257; ++calg)
				if (cl[calg & 0xFF].name != NULL)
					break;

		if ((cl == NULL) || (calg == 257))
			errx(1, "no compression algorithms found");
		calg &= 0xFF;
	}

	if (mode == 5 || mode == 6)
		return (minilzop(ifd, ofd, calg, (mode == 6)));

#ifndef SMALL
	if (mode == 4)
		return (refwcf(ifd, ofd, calg));
#endif

	if (dfile != NULL) {
		char *udata, *data;
		size_t sz, isz;
		int dfd;

		if ((dfd = fsopen(dfile, O_RDONLY, STDIN_FILENO)) < 0)
			err(1, "open %s", dfile);
		read_aszdata(dfd, &udata, &isz);
		close(dfd);
		data = fwcf_pack(udata, isz, calg, &sz);
		isz = write(ofd, data, sz);
		free(data);
		return (isz == sz ? 0 : 1);
	}

	return (mkfwcf(ofd, doempty ? NULL : file_root, calg));
}

static __dead void
usage(void)
{
	extern const char *__progname;

	fprintf(stderr, "Usage:"
#ifdef SMALL
	    "	%s -M { -D <file> | -e | <directory> }"
	    "\n	%s -U { -D <file> | <directory> }"
	    "\n	%s -Z[d] [<infile> [<outfile>]]"
	    "\n	%s -l\n", __progname, __progname, __progname, __progname);
#else
	    "	%s -M [-c | -C <compressor>] [-o <file>]"
	    "\n	    { -D <file> | -e | <directory> }"
	    "\n	%s [-i <file>] -U { -D <file> | <directory> }"
	    "\n	%s [-i <file>] -d"
	    "\n	%s -R [-c | -C <compressor>] [-i <infile>] [-o <outfile>]"
	    "\n	%s -Z[d] [-c | -C <compressor>] [<infile> [<outfile>]]"
	    "\n	%s -l\n",
	    __progname, __progname, __progname, __progname, __progname,
	    __progname);
#endif
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

static int
unfwcf(int fd, const char *dir)
{
	char *udata;

	if ((udata = fwcf_unpack(fd, NULL))) {
#ifndef SMALL
		if (dir == NULL)
			ft_dump(udata);
		else
#endif
			ft_creatm(udata, dir);
	}
	return (udata != NULL ? 0 : 1);
}

#ifndef SMALL
static int
refwcf(int ifd, int ofd, int algo)
{
	char *udata, *data;
	size_t sz, isz;

	if ((udata = fwcf_unpack(ifd, &isz)) == NULL)
		return (1);
	data = fwcf_pack(udata, isz, algo, &sz);
	return ((size_t)write(ofd, data, sz) == sz ? 0 : 1);
}
#endif

static int
fsopen(const char *fn, int mode, int altfd)
{
	return (((fn == NULL) || (*fn == '\0') ||
	    ((fn[0] == '-') && (fn[1] == '\0'))) ? altfd :
	    open(fn, mode, 0666));
}
