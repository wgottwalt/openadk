/*-
 * Copyright (c) 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009,
 *		 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017
 *	mirabilos <m@mirbsd.org>
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

#include <errno.h>
#include <fcntl.h>
#include <signal.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>

#define MKSH_CAT_BUFSIZ	256

#ifndef O_BINARY
#define O_BINARY	0
#endif

#define ksh_sigmask(sig) (((sig) < 1 || (sig) > 127) ? 255 : 128 + (sig))

static char buf[MKSH_CAT_BUFSIZ];
static volatile sig_atomic_t intrsig;

static const char Tsynerr[] = "cat: syntax error\n";
static const char unkerr_msg[] = "Unknown error";
static const char sigint_msg[] = " ...\ncat: Interrupted\n";

static void
disperr(const char *fn)
{
	int e = errno;

	write(2, "cat: ", 5);
	write(2, fn, strlen(fn));
	write(2, ": ", 2);
	if (strerror_r(e, buf, MKSH_CAT_BUFSIZ))
		write(2, unkerr_msg, sizeof(unkerr_msg) - 1);
	else
		write(2, buf, strlen(buf));
	write(2, "\n", 1);
}

static void
sighandler(int signo __attribute__((__unused__)))
{
	intrsig = 1;
}

int
main(int argc __attribute__((__unused__)), char *wp[])
{
	int fd = 0, rv;
	ssize_t n, w;
	const char *fn = "<stdin>";
	char *cp;

	++wp;
	/* parse options (POSIX demands this) */
	while ((cp = *wp) && *cp++ == '-') {
		if (!cp[0])
			break;
		if (cp[0] == '-' && !cp[1]) {
			++wp;
			break;
		}
		while (*cp == 'u')
			++cp;
		if (*cp) {
			write(2, Tsynerr, sizeof(Tsynerr) - 1);
			return (1);
		}
		++wp;
	}
	rv = 0;

	/* catch SIGPIPE */
	signal(SIGPIPE, SIG_IGN);

	/* abort on SIGINT */
	signal(SIGINT, sighandler);

	do {
		if (*wp) {
			fn = *wp++;
			if (fn[0] == '-' && !fn[1])
				fd = 0;
			else if ((fd = open(fn, O_RDONLY | O_BINARY)) < 0) {
				disperr(fn);
				rv = 1;
				continue;
			}
		}
		while (/* CONSTCOND */ 1) {
			if ((n = read(fd, (cp = buf), MKSH_CAT_BUFSIZ)) == -1) {
				if (errno == EINTR) {
					/* give the user a chance to ^C out */
					if (intrsig)
						goto has_intrsig;
					/* interrupted, try again */
					continue;
				}
				/* an error occured during reading */
				disperr(fn);
				rv = 1;
				break;
			} else if (n == 0)
				/* end of file reached */
				break;
			while (n) {
				if (intrsig)
					goto has_intrsig;
				if ((w = write(1, cp, n)) != -1) {
					n -= w;
					cp += w;
					continue;
				}
				if (errno == EINTR) {
 has_intrsig:
					/* give the user a chance to ^C out */
					if (intrsig) {
						write(2, sigint_msg,
						    sizeof(sigint_msg) - 1);
						return (ksh_sigmask(SIGINT));
					}
					/* interrupted, try again */
					continue;
				}
				if (errno == EPIPE) {
					/* fake receiving signal */
					rv = ksh_sigmask(SIGPIPE);
				} else {
					/* an error occured during writing */
					disperr("<stdout>");
					rv = 1;
				}
				if (fd != 0)
					close(fd);
				goto out;
			}
		}
		if (fd != 0)
			close(fd);
	} while (*wp);

 out:
	return (rv);
}
