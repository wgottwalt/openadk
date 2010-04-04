/* $Id: port-linux.c 1793 2007-01-28 20:55:08Z tg $ */

/* part of the adjtime-linux patch */

/*
 * Copyright (c) 2004 Darren Tucker <dtucker at zip com au>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

#include "includes.h"

#ifdef USE_ADJTIMEX
#include <sys/timex.h>
#include <errno.h>
#ifdef adjtime
# undef adjtime
#endif

#include "ntpd.h"

/* scale factor used by adjtimex freq param.  1 ppm = 65536 */
#define ADJTIMEX_FREQ_SCALE 65536

/* maximum change to skew per adjustment, in PPM */
#define MAX_SKEW_DELTA 5.0

int
_compat_adjtime(const struct timeval *delta, struct timeval *olddelta)
{
	static struct timeval tlast = {0,0};
	static double tskew = 0;
	static int synced = -1;
	struct timeval tnow, tdelta;
	double skew = 0, newskew, deltaskew, adjust, interval = 0;
	struct timex tmx;
	int result, saved_errno;

	gettimeofday(&tnow, NULL);
	adjust = (double)delta->tv_sec;
	adjust += (double)delta->tv_usec / 1000000;

	/* Even if the caller doesn't care about the olddelta, we do */
	if (olddelta == NULL)
		olddelta = &tdelta;

	result = adjtime(delta, olddelta);
	saved_errno = errno;

	if (olddelta->tv_sec == 0 && olddelta->tv_usec == 0 &&
	    synced != INT_MAX)
		synced++;
	 else
		synced = 0;

	/*
	 * do skew calculations if we have synced
	 */
	if (synced == 0 ) {
		tmx.modes = 0;
		if (adjtimex(&tmx) == -1)
			log_warn("adjtimex get failed");
		else
			tskew = (double)tmx.freq / ADJTIMEX_FREQ_SCALE;
	} else if (synced >= 1) {
		interval = (double)(tnow.tv_sec - tlast.tv_sec);
		interval += (double)(tnow.tv_usec - tlast.tv_usec) / 1000000;

		skew = (adjust * 1000000) / interval;
		newskew = ((tskew * synced) + skew) / synced;
		deltaskew = newskew - tskew;

		if (deltaskew > MAX_SKEW_DELTA) {
			log_info("skew change %0.3lf exceeds limit", deltaskew);
			tskew += MAX_SKEW_DELTA;
		} else if (deltaskew < -MAX_SKEW_DELTA) {
			log_info("skew change %0.3lf exceeds limit", deltaskew);
			tskew -= MAX_SKEW_DELTA;
		} else {
			tskew = newskew;
		}

		/* Adjust the kernel skew.  */
		tmx.freq = (long)(tskew * ADJTIMEX_FREQ_SCALE);
		tmx.modes = ADJ_FREQUENCY;
		if (adjtimex(&tmx) == -1)
			log_warn("adjtimex set freq failed");
	}

	log_debug("interval %0.3lf skew %0.3lf total skew %0.3lf", interval,
	    skew, tskew);

	tlast = tnow;
	errno = saved_errno;
	return result;
}
#endif
