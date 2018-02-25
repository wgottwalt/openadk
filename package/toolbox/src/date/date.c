/*	$OpenBSD: date.c,v 1.26 2003/10/15 15:58:22 mpech Exp $	*/
/*	$NetBSD: date.c,v 1.11 1995/09/07 06:21:05 jtc Exp $	*/

/*
 * Copyright (c) 1985, 1987, 1988, 1993
 *	The Regents of the University of California.  All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. Neither the name of the University nor the names of its contributors
 *    may be used to endorse or promote products derived from this software
 *    without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 */

#include <sys/param.h>
#include <sys/time.h>

#include <ctype.h>
#include <err.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <locale.h>
#include <syslog.h>
#include <time.h>
#include <unistd.h>

__COPYRIGHT("@(#) Copyright (c) 1985, 1987, 1988, 1993\n\
	The Regents of the University of California.  All rights reserved.\n");
__SCCSID("@(#)date.c	8.2 (Berkeley) 4/28/95");
__RCSID("$MirOS: src/bin/date/date.c,v 1.9 2016/01/02 21:32:56 tg Exp $");

extern const char *__progname;

time_t tval;
int retval;
int slidetime;

#ifndef TM_YEAR_BASE
#define TM_YEAR_BASE	1900
#endif

static void setthetime(char *);
static __dead void badformat(void);
static __dead void usage(void);

int
main(int argc, char *argv[])
{
	struct timezone tz;
	int ch, rflag;
	const char *format = NULL;
	char buf[1024];
	int whatformat = 0;

	tz.tz_dsttime = tz.tz_minuteswest = 0;
	rflag = 0;
	while ((ch = getopt(argc, argv, "ad:nRr:ut:")) != -1)
		switch((char)ch) {
		case 'a':
			slidetime++;
			break;
		case 'd':		/* daylight saving time */
			tz.tz_dsttime = atoi(optarg) ? 1 : 0;
			break;
		case 'n':		/* don't set network */
			break;
		case 'R':		/* RFC 2822 format */
			whatformat |= 1;
			break;
		case 'r':		/* user specified seconds */
			rflag = 1;
			tval = atoll(optarg);
			break;
		case 'u':		/* do everything in UTC */
			if (setenv("TZ", "GMT0", 1) == -1)
				err(1, "cannot unsetenv TZ");
			break;
		case 't':		/* minutes west of GMT */
					/* error check; don't allow "PST" */
			if (isdigit(*optarg)) {
				tz.tz_minuteswest = atoi(optarg);
				break;
			}
			/* FALLTHROUGH */
		default:
			usage();
		}
	argc -= optind;
	argv += optind;

	/*
	 * If -d or -t, set the timezone or daylight saving time; this
	 * doesn't belong here, the kernel should not know about either.
	 */
	if ((tz.tz_minuteswest || tz.tz_dsttime) &&
	    settimeofday(NULL, &tz))
		err(1, "settimeofday");

	if (!rflag && time(&tval) == -1)
		err(1, "time");

	/* allow the operands in any order */
	if (*argv && **argv == '+') {
		if (*(*argv + 1)) {
			whatformat |= 2;
			format = *argv + 1;
		}
		++argv;
	}

	if (*argv) {
		setthetime(*argv);
		++argv;
	}

	if (*argv && **argv == '+') {
		whatformat |= 4;
		format = *argv + 1;
	}

	if (whatformat == 0)
		format = "%a %b %e %H:%M:%S %Z %Y";
	else if (whatformat == 1) {
		format = "%a, %d %b %Y %H:%M:%S %z";
	} else if (whatformat != 2 && whatformat != 4)
		errx(1, "more than one format specified");

	strftime(buf, sizeof (buf), format, localtime(&tval));
	printf("%s\n", buf);
	exit(retval);
}

#define	ATOI2(ar)	((ar)[0] - '0') * 10 + ((ar)[1] - '0'); (ar) += 2;
void
setthetime(char *p)
{
	struct tm *lt;
	struct timeval tv;
	char *dot, *t;
	const char *pc;
	int bigyear;
	int yearset = 0;

	for (t = p, dot = NULL; *t; ++t) {
		if (isdigit(*t))
			continue;
		if (*t == '.' && dot == NULL) {
			dot = t;
			continue;
		}
		badformat();
	}

	lt = localtime(&tval);

	lt->tm_isdst = -1;			/* correct for DST */

	if (dot != NULL) {			/* .SS */
		*dot++ = '\0';
		if (strlen(dot) != 2)
			badformat();
		lt->tm_sec = ATOI2(dot);
		if (lt->tm_sec > 61)
			badformat();
	} else
		lt->tm_sec = 0;

	switch (strlen(p)) {
	case 12:				/* cc */
		bigyear = ATOI2(p);
		lt->tm_year = bigyear * 100 - TM_YEAR_BASE;
		yearset = 1;
		/* FALLTHROUGH */
	case 10:				/* yy */
		if (yearset) {
			lt->tm_year += ATOI2(p);
		} else {
			lt->tm_year = ATOI2(p);
			if (lt->tm_year < 69)		/* hack for 2000 ;-} */
				lt->tm_year += (2000 - TM_YEAR_BASE);
			else
				lt->tm_year += (1900 - TM_YEAR_BASE);
		}
		/* FALLTHROUGH */
	case 8:					/* mm */
		lt->tm_mon = ATOI2(p);
		if ((lt->tm_mon > 12) || !lt->tm_mon)
			badformat();
		--lt->tm_mon;			/* time struct is 0 - 11 */
		/* FALLTHROUGH */
	case 6:					/* dd */
		lt->tm_mday = ATOI2(p);
		if ((lt->tm_mday > 31) || !lt->tm_mday)
			badformat();
		/* FALLTHROUGH */
	case 4:					/* HH */
		lt->tm_hour = ATOI2(p);
		if (lt->tm_hour > 23)
			badformat();
		/* FALLTHROUGH */
	case 2:					/* MM */
		lt->tm_min = ATOI2(p);
		if (lt->tm_min > 59)
			badformat();
		break;
	default:
		badformat();
	}

	/* convert broken-down time to UTC clock time */
	if ((tval = mktime(lt)) < 0)
		errx(1, "specified date is outside allowed range");

	/* set the time */
	if (slidetime) {
		struct timeval tv_current;

		if (gettimeofday(&tv_current, NULL) == -1)
			err(1, "Could not get local time of day");

		tv.tv_sec = tval - tv_current.tv_sec;
		tv.tv_usec = 0;
		if (adjtime(&tv, NULL) == -1)
			errx(1, "adjtime");
	} else {
		tv.tv_sec = tval;
		tv.tv_usec = 0;
		if (settimeofday(&tv, NULL))
			err(1, "settimeofday");
	}

	if ((pc = getlogin()) == NULL)
		pc = "???";
	syslog(LOG_AUTH | LOG_NOTICE, "date set by %s", pc);
}

static void
badformat(void)
{
	warnx("illegal time format");
	usage();
}

static void
usage(void)
{
	fprintf(stderr,
	    "usage:\t%s [-anRu] [-d dst] [-r seconds] [-t west] [+format]\n",
	     __progname);
	fprintf(stderr, "\t    [[[[[[cc]yy]mm]dd]HH]MM[.SS]]\n");
	exit(1);
}
