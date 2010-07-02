/*
 * daemon for version information of embedded systems
 *
 * Copyright (C) 2010 Waldemar Brodkorb <wbx@openadk.org>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 *
 */

#include <arpa/inet.h>
#include <errno.h>
#include <fcntl.h>
#include <getopt.h>
#include <netinet/in.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h> 
#include <sys/stat.h>
#include <sys/types.h>
#include <time.h>
#include <unistd.h>

#define VERSION		"0.1"
#define LOGFILE		"/tmp/uvd.log"
#define LOCKFILE	"/tmp/uvd.lock"
#define BUFSIZE		1024
#define VERFILE		"/etc/adkversion"

void version() {
	fprintf(stdout, "uvd version %s", VERSION);
	exit(EXIT_SUCCESS);
}

static const char *log_date(void) {
	static char buf[18];
	time_t t = time(NULL);	
	strftime(buf, 18, "%b %d %H:%M:%S", localtime(&t));
	return buf;
}

void die(const char *msg) {
	fprintf(stderr, "%s\n", msg);
	exit(EXIT_FAILURE);
}

void die_log(FILE *lf, const char *msg) {
	fprintf(lf, "%s: %s\n", log_date(), msg);
	exit(EXIT_FAILURE);
}

void log_msg(FILE *lf, const char *msg) {
	fprintf(lf, "%s: %s\n", log_date(), msg);
	fflush(lf);
}


void signal_handler(int sig) {

	switch(sig) {
		case SIGHUP:
			break;
		case SIGTERM:
		case SIGINT:
		case SIGQUIT:
			unlink(LOCKFILE);
			exit(EXIT_SUCCESS);
			break;
		default:
			break;
	}
}

void usage(int argc, char *argv[]) {

	if (argc >=1) {
		fprintf(stdout, "Usage: %s [ --help | --debug | --version ]\n", argv[0]);
		fprintf(stdout, "  Options:\n");
		fprintf(stdout, "    --debug	| -d start in debug mode, don't fork\n");
		fprintf(stdout, "    --version	| -v show version\n");
		fprintf(stdout, "    --help	| -h show help\n");
		fprintf(stdout, "\n");
	}
	exit(EXIT_SUCCESS);
}


int main(int argc, char **argv) {

	pid_t pid, sid;
	int lfd, c, ss, n, res;
	FILE *lf = NULL;
	int vf;
	struct sigaction sigact;
	int daemonize = 1;
	int optval = 1;
	char buf[BUFSIZE];
	struct sockaddr_in server = { 0 };
	struct sockaddr_in clientaddr; /* client addr */
	socklen_t clientlen;

	/* options descriptor */
	static struct option longopts[] = {
		{ "debug",	no_argument,	0,	'd' },
		{ "help",	no_argument,	0,	'h' },
		{ "version",	no_argument,	0,	'v' },
		{ NULL,		0,		NULL,	0 }
	};

	while((c = getopt_long(argc, argv, "dhv", longopts, NULL)) != -1) {
		switch(c) {
			case 'h':
				usage(argc, argv);
				break;
			case 'v':
				version();
				break;
			case 'd':
				daemonize = 0;
				break;
			default:
				usage(argc, argv);
			}
	}

	if (daemonize) {
		/* Fork off the parent process */
		pid = fork();
		if (pid < 0)
			die("Can't fork process");

		/* If we got a pid, we exit the parent process */	
		if (pid > 0)
			exit(EXIT_SUCCESS);

		/* Change the file mode mask */
		umask(0);
	}

	/* Open a logfile */
	lf = fopen(LOGFILE, "a");
	if (lf == NULL)
		die("Can't open logfile");
	
	if (daemonize) {
		/* Create a new session for child process */
		if ((sid = setsid()) < 0);
			die_log(lf, "Can't create a new session for child process");

		/* Change the current working directory */
		if ((chdir("/")) < 0)
			die_log(lf, "Can't change working directory to /");
	}

	/* check if daemon already running */
	if ((lfd = open(LOCKFILE, O_RDWR | O_CREAT, 0640) < 0))
		die("Can't open or create lock file");

	if (lockf(lfd, F_TLOCK, 0) == -1)
		die("uvd already running!");

	if (daemonize) {
		/* Close out the standard file descriptors */
       		close(STDIN_FILENO);
        	close(STDOUT_FILENO);
        	close(STDERR_FILENO);
	}

	/* Handle some signals */
	sigact.sa_handler = signal_handler;
	sigact.sa_flags = 0;

	sigaction(SIGHUP, &sigact, NULL);
	sigaction(SIGTERM, &sigact, NULL);
	sigaction(SIGINT, &sigact, NULL);
	sigaction(SIGQUIT, &sigact, NULL);

	log_msg(lf, "uvd started successfully");

	/* create network socket */
	if ((ss = socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP)) == -1)
		die("can not create socket");	

	server.sin_addr.s_addr=htonl(INADDR_ANY);
	server.sin_family = AF_INET;
	server.sin_port = htons(4242);

	if (setsockopt (ss, SOL_SOCKET, SO_BROADCAST, (caddr_t) &optval, sizeof (optval)) < 0)
		die("can not set socket option");

	if (setsockopt (ss, SOL_SOCKET, SO_REUSEADDR, (caddr_t) &optval, sizeof (optval)) < 0)
		die("can not set socket option");

	if (bind(ss, (struct sockaddr *) &server, sizeof(server)) < 0)
		die("can not bind socket");

	/* loop forever */
	while(1) {
		clientlen = sizeof(clientaddr);
		n = recvfrom(ss, buf, BUFSIZE , 0, (struct sockaddr *)&clientaddr, &clientlen);
		if (n < 0) 
			die_log(lf, "error reading from client");

		buf[n] = 0;
		res = strncmp(buf, "version", n);
		if (res > 0) {
			log_msg(lf, "been asked for version information");
			if ((vf = open(VERFILE, O_RDONLY)) < 0)
				die_log(lf, "unable to open version file");

			ssize_t num;
			do {
				num = read(vf, &buf, sizeof(buf));
				buf[num] = '\0';
				if (sendto(ss, buf, num, 0, (struct sockaddr *) &clientaddr, sizeof(clientaddr)) < 0)
					die_log(lf, "can not send data");
			} while (num > 0);

			close(vf);
		}
	}
	close(ss);
	return(0);
}
