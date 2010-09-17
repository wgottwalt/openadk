/*-
 * Copyright (c) 2010
 *      Thorsten Glaser <tg@mirbsd.org>
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

#include <sys/types.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <err.h>
#include <fcntl.h>
#include <limits.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

struct ptrsize {
	const char *ptr;
	size_t size;
};

static void *xrecalloc(void *, size_t, size_t);
static int cmpfn(const void *, const void *);

#define MUL_NO_OVERFLOW	(1UL << (sizeof (size_t) * 8 / 2))

#ifndef SIZE_MAX
#ifdef SIZE_T_MAX
#define SIZE_MAX	SIZE_T_MAX
#else
#define SIZE_MAX	((size_t)-1)
#endif
#endif

#if !defined(MAP_FAILED)
/* XXX imake style */
#  if defined(__linux)
#define MAP_FAILED	((void *)-1)
#  elif defined(__bsdi__) || defined(__osf__) || defined(__ultrix)
#define MAP_FAILED	((caddr_t)-1)
#  endif
#endif

static void *
xrecalloc(void *ptr, size_t nmemb, size_t size)
{
	void *rv;

	if ((nmemb >= MUL_NO_OVERFLOW || size >= MUL_NO_OVERFLOW) &&
	    nmemb > 0 && SIZE_MAX / nmemb < size)
		errx(1, "attempted integer overflow: %zu * %zu", nmemb, size);
	size *= nmemb;
	if ((rv = realloc(ptr, size)) == NULL)
		err(1, "cannot allocate %zu bytes", size);
	return (rv);
}

int
sortfile(char *infile, char *outfile)
{
	int fd, fdout;
	size_t fsz, asz, anents;
	char *cp, *thefile, *endfile;
	struct ptrsize *thearray;

	if ((fd = open(infile, O_RDONLY)) < 0)
		err(1, "open: %s", infile);
	else {
		struct stat sb;

		/* reasonable maximum size: 3/4 of SIZE_MAX */
		fsz = (SIZE_MAX / 2) + (SIZE_MAX / 4);

		if (fstat(fd, &sb))
			err(1, "stat: %s", infile);
		if (sb.st_size > fsz)
			errx(1, "file %s too big, %llu > %zu", infile,
			    (unsigned long long)sb.st_size, fsz);
		fsz = (size_t)sb.st_size;
	}

	if ((thefile = mmap(NULL, fsz, PROT_READ, MAP_FILE | MAP_PRIVATE,
	    fd, (off_t)0)) == MAP_FAILED)
		err(1, "mmap %zu bytes from %s", fsz, infile);
	/* last valid byte in the file, must be newline anyway */
	endfile = thefile + fsz - 1;

	thearray = xrecalloc(NULL, (asz = 8), sizeof(thearray[0]));
	thearray[(anents = 0)].ptr = cp = thefile;

	while ((cp = memchr(cp, '\n', endfile - cp)) != NULL) {
		/* byte after the \n */
		if (++cp > endfile)
			/* end of file */
			break;
		thearray[anents].size = cp - thearray[anents].ptr;
		if (++anents == asz)
			/* resize array */
			thearray = xrecalloc(thearray, (asz <<= 1),
			    sizeof(thearray[0]));
		thearray[anents].ptr = cp;
	}
	thearray[anents].size = endfile - thearray[anents].ptr + 1;

	qsort(thearray, ++anents, sizeof(thearray[0]), cmpfn);

	if ((fdout = open(outfile, O_WRONLY | O_CREAT, S_IRWXU)) < 0)
		err(1, "open: %s", outfile);
	else {
		for (asz = 0; asz < anents; ++asz)
			if ((size_t)write(fdout, thearray[asz].ptr,
			    thearray[asz].size) != thearray[asz].size)
				err(1, "write %zu bytes", thearray[asz].size);
	}

	if (munmap(thefile, fsz))
		warn("munmap");

	free(thearray);
	close(fd);

	return (0);
}

static int
cmpfn(const void *p1, const void *p2)
{
	int rv;
	const struct ptrsize *a1 = (const struct ptrsize *)p1;
	const struct ptrsize *a2 = (const struct ptrsize *)p2;

	if ((rv = memcmp(a1->ptr, a2->ptr, (a1->size > a2->size ?
	    a2->size : a1->size) - /* '\n' */ 1)) != 0)
		/* unequal in the common part */
		return (rv);

	/* shorter string is smaller */
	return (a1->size > a2->size ? 1 : a1->size == a2->size ? 0 : -1);
}
