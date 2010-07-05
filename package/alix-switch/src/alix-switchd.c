/*
* alix-switchd.c
*
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; either version 2 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*/

#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <syslog.h>
#include <time.h>
#include <unistd.h>
#include <sys/io.h>
#include <sys/stat.h>
#include <sys/types.h>

#define SCRIPT		"/etc/alix-switch"
#define GPIOBASE	0x6100

typedef void (*sighandler_t)(int);

static sighandler_t handle_signal (int sig_nr, sighandler_t signalhandler) {

	struct sigaction neu_sig, alt_sig;

	neu_sig.sa_handler = signalhandler;
	sigemptyset(&neu_sig.sa_mask);
	neu_sig.sa_flags = SA_RESTART;
	if (sigaction (sig_nr, &neu_sig, &alt_sig) < 0)
		return SIG_ERR;

	return alt_sig.sa_handler;
}

static void start_daemon (void) {

	int i;
	pid_t pid, sid;

	handle_signal(SIGHUP, SIG_IGN);
	if ((pid = fork ()) != 0)
		exit(EXIT_FAILURE);
	umask(0);
	if ((sid = setsid()) < 0)
		exit(EXIT_FAILURE);
	chdir("/");
	for (i = sysconf(_SC_OPEN_MAX); i > 0; i--)
		close(i);
}


int main(int argc, char *argv[]) {

	int i;
	unsigned long bPort = 0;
	struct timespec sleep;
	int bDaemon = 0, bSwitch = 0, bState = 0;
 
	for(i = 1; i < argc; i++) {
		if (!strcasecmp(argv[i], "-d") || !strcasecmp(argv[i], "--daemon")) {
			bDaemon = 1;
		} else {
			printf( "\nusage: %s [-d | --daemon]\n", argv[0]);
			exit(EXIT_FAILURE);
		}
	}

	if (iopl(3)) {
		fprintf( stderr, "Could not set I/O permissions to level 3\n");
		exit(EXIT_FAILURE);
	}
   
	if (bDaemon)
		start_daemon();

	sleep.tv_sec = 0;
	sleep.tv_nsec = 50000000;

	while(1) {
		bPort = inl(GPIOBASE + 0xB0);
		if ((bPort & 0x100) == 0)
			bState = 1;
		else
			bState = 0;
      
		if (bState && !bSwitch)
     			system(SCRIPT " on");

		bSwitch = bState;
		nanosleep(&sleep, NULL);
	}

	if (iopl(0)) {
      		fprintf(stderr, "Could not set I/O permissions to level 0");
		exit(EXIT_FAILURE);
	}

	return EXIT_SUCCESS;
}
