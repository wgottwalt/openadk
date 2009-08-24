/*
 * cryptinit 1.0.2 - setup encrypted root/swap system using LUKS
 *
 * Copyright (C) 2009 Waldemar Brodkorb <mail@waldemar-brodkorb.de>
 * Copyright (C) 2008 Phil Sutter <phil@nwl.cc>
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
 * strongly based on ideas and work from Phil Sutter
 * http://nwl.cc/cgi-bin/git/gitweb.cgi?p=initramfs-init.git;a=summary
 *   - used with cryptsetup 1.0.6 (needs a small cryptsetup-patch)
 *   - see comment at the end of file for a useful initramfs filelist
 *   - compile and link with following commands to get a static init
 *     gcc -Wall -c -o init.o cryptinit.c
 *     libtool --mode=link --tag=CC gcc -all-static -o init init.o \
 *	/usr/lib/libcryptsetup.la
 */

#include <errno.h>
#include <fcntl.h>
#include <stdarg.h> 
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <libcryptsetup.h>
#include <sys/mount.h>
#include <sys/reboot.h>
#include <sys/types.h>
#include <sys/utsname.h>
#include <sys/wait.h>

#define HOSTNAME "linux"
#define DOMAINNAME "foo.bar"

#define CRYPT_SWAP_DEV "/dev/sda3"
#define CRYPT_SWAP_NAME "swap"
#define CRYPT_ROOT_DEV "/dev/sda2"
#define CRYPT_ROOT_NAME "root"

#define PROCPATH "/proc"
#define SYSPATH "/sys"
#define PROCFS "proc"
#define SYSFS "sysfs"

#define DEF_KERN_CONS "/dev/console"
#define DEF_KERN_SWAP "/dev/mapper/swap"
#define DEF_KERN_ROOT_SRC "/dev/mapper/root"
#define DEF_KERN_ROOT_TGT "/mnt"
#define DEF_KERN_ROOT_FS "xfs"
#define DEF_KERN_INIT "/init"

#ifndef MS_MOVE
#define MS_MOVE         8192
#endif

/* a structure for holding options to mount() a device */
struct mntopts {
        char *source;
        char *target;
        char *fstype;
        unsigned long flags;
};

/* a structure for holding kernel boot parameters */
struct commandline {
        struct mntopts root;
        char *init;
        char *resume;
        ushort do_resume;
        ushort debug;
};

struct commandline cmdline;

void debug_printf(const char *format, ...) {
	va_list params;
	if(cmdline.debug) {
		va_start(params, format);
		vprintf(format, params);
		va_end(params);
	}
}

void debug_msg(const char *s) {
	if(cmdline.debug)
		fputs(s, stderr);
}

void log_msg(const char *s) {
	fputs(s, stdout);
}

/* logging function from cryptsetup library */
static void cmdLineLog(int class, char *msg) {
	switch(class) {
	case CRYPT_LOG_NORMAL:
		debug_msg(msg);
		break;
	case CRYPT_LOG_ERROR:
		debug_msg(msg);
		break;
	default:
		fprintf(stderr, "Internal error for msg: %s", msg);
		break;
	}
}

int switch_root(char *console, char *newroot, char *init) {

	if (chdir(newroot)) {
		fprintf(stderr,"bad newroot %s\n",newroot);
		return 1;
	}
	/* Overmount / with newdir and chroot into it.  The chdir is needed to
	 * recalculate "." and ".." links. */
	if (mount(".", "/", NULL, MS_MOVE, NULL) || chroot(".") || chdir("/")) {
		fprintf(stderr,"switch_root: error moving root\n");
		return 2;
	}

	/* If a new console specified, redirect stdin/stdout/stderr to that. */
	if (console) {
		close(0);
		if(open(console, O_RDWR) < 0) {
			fprintf(stderr,"Bad console '%s'\n",console);
			return 4;
		}
		dup2(0, 1);
		dup2(0, 2);
	}

	log_msg("Starting Linux from encrypted root disk\n");
	/* Exec real init.  (This is why we must be pid 1.) */
	execl(init, init, (char *)NULL);
	fprintf(stderr,"Bad init '%s'\n",init);
	return 3;
}

char *read_cmdline(void) {
	FILE *fp;
	int linelen, i;
	char *str;

	if((fp=fopen("/proc/cmdline","r")) == NULL) {
		perror("fopen()");
		return NULL;
	}
	linelen = 10;
	str = calloc(linelen, sizeof(char));
	for(i=0;(str[i]=fgetc(fp)) != EOF; i++) {
		if(i>linelen-1) {
			linelen += 10;
			if((str=realloc(str, linelen)) == NULL) {
				perror("realloc()");
				return NULL;
			}
		}
	}
	str[i-1] = '\0'; /* substitutes \n for \0 */
	fclose(fp);
	return str;
}

int parse_cmdline(char *line) {
	int tmpnum;
	char *tmpstr, *lstr, *rstr, *idx;
	char *invchars[1];

	tmpstr = strtok(line, " ");
	do {
		if((idx=strchr(tmpstr, '=')) != NULL) {
			rstr = idx + 1;
			idx = '\0';
			lstr = tmpstr;

			if(!strncmp(lstr, "rootfstype", 10)) {
				cmdline.root.fstype = rstr;

			} else if(!strncmp(lstr, "root", 4)) {
				cmdline.root.source = rstr;

			} else if(!strncmp(lstr, "init", 4)) {
				cmdline.init = rstr;

			} else if(!strncmp(lstr, "resume", 6)) {
				cmdline.resume = rstr;
			}

		} else if(!strncmp(tmpstr, "noresume", 8)) {
			cmdline.do_resume = 0;

		} else if(!strncmp(tmpstr, "debug", 5)) {
			cmdline.debug=1;

		} else {
			if(cmdline.debug)
				printf("unknown bootparam flag %s\n",tmpstr);
		}
	} while((tmpstr = strtok(NULL, " ")) != NULL);

	debug_printf("\n Bootparams scanned:\n");
	debug_printf("root\t%s\nrootfstype\t%s\ninit\t%s\nresume\t%s\ndo_resume\t%i\n",
			cmdline.root.source,cmdline.root.fstype,cmdline.init,cmdline.resume,cmdline.do_resume);
	debug_printf("debug\t%i\n\n",
			cmdline.debug);
	return 0;
}

int get_cmdline() {
	char *str;

	/* first set some useful defaults */
	cmdline.root.source = DEF_KERN_ROOT_SRC;
	cmdline.root.target = DEF_KERN_ROOT_TGT;
	cmdline.root.fstype = DEF_KERN_ROOT_FS;
	cmdline.root.flags = MS_RDONLY;
	cmdline.init = DEF_KERN_INIT;
	cmdline.resume = DEF_KERN_SWAP;
	cmdline.do_resume = 1;
	cmdline.debug = 0;

	/* read out cmdline from /proc */
	str = read_cmdline();

	/* parse the cmdline */
	if(parse_cmdline(str))
		return -1;

	return 0;
}

void kmsg_log(int level) {
	FILE *fd;

	debug_msg("Finetune kernel log\n");
	if((fd = fopen("/proc/sys/kernel/printk", "r+")) == NULL) {
		perror("fopen()");
		return;
	}
	fprintf(fd, "%d", level);
	fclose(fd);
}

void do_resume(void) {
	FILE *fd;

	debug_msg("Trying to resume\n");
	if((fd = fopen("/sys/power/resume", "a")) == NULL) {
		return;
	}
	fprintf(fd, "254:0\n");
	fclose(fd);
}

void do_halt(void) {
	int pid;

	/* run sync just to be sure */
	sync();

	/* fork to prevent a kernel panic while killing init */
	if((pid=fork()) == 0) {
		reboot(0x4321fedc);
		_exit(0);
	}
	waitpid(pid, NULL, 0);
}

int do_mount(struct mntopts o) {
	debug_printf("do_mount: mounting %s with fstype %s\n", o.source, o.fstype);
	if(mount(o.source, o.target, o.fstype, o.flags, NULL)) {
		perror("mount()");
		debug_printf("do_mount: mounting %s with fstype %s\n failed", o.source, o.fstype);
		return errno;
	}
	return 0;
}

int main(void) {
	char errormsg[100];
	int i;
	int wrongpass;
	char *pass;
	struct utsname info;
	int ret;
	const char hostname[20] = HOSTNAME;
	const char domainname[20] = DOMAINNAME;
	struct crypt_options options;
	struct interface_callbacks cmd_icb; 

	struct mntopts mopts[2] = {
		{ "proc", PROCPATH, PROCFS, 0 },
		{ "sysfs", SYSPATH, SYSFS, 0 }
	};
	
	/* need to set callback functions, log is required */
	cmd_icb.yesDialog = NULL;
	cmd_icb.log = cmdLineLog;

	/* first try to mount needed virtual filesystems */
	if(do_mount(mopts[0]) || do_mount(mopts[1])) {
		fprintf(stderr, "Error mounting %s and %s\n", 
			PROCPATH, SYSPATH);
		exit(errno);
	}

	/* get kernel command line */
	if(get_cmdline() == -1) {
		fprintf(stderr, "Failed to parse kernel commandline\n");
		exit(errno);
	}

	/* keep kernel quiet while asking for password */
	kmsg_log(0);

	/* first unlock swap partition for resume */
	memset(&options, 0, sizeof(struct crypt_options));
	options.name = CRYPT_SWAP_NAME;
	options.device = CRYPT_SWAP_DEV;
	options.icb = &cmd_icb;

	ret = uname(&info);
	if (ret < 0)
		fprintf(stderr, "Error calling uname function\n");

	/* security by obscurity */
	printf("This is %s.%s (Linux %s %s)\n", hostname, domainname, info.machine, info.release);
	printf("%s login: ", hostname);
	fflush(stdout);
	while(getchar() != '\n');
	/* unlock swap */
	debug_msg("Unlocking Swap\n");
	for(i=0; i<3; i++) {
		/* ask user for password */
		if((pass=getpass("Password: ")) == NULL) {
			perror("getpass()");
			return errno;
		}
		options.passphrase = pass;
		/* try to unlock swap */
		if((wrongpass=crypt_luksOpen(&options))) {
			printf("Login incorrect\n");
			crypt_get_error(errormsg, 99);	
			debug_printf("Error: %s\n", errormsg);
		} else { /* success */
			if(i > 0)
				fprintf(stderr, "%i incorrect attempts\n",i);
			break;
		}
	}
	
	if(wrongpass) {
		fprintf(stderr, "Panic - you are not allowed!\n");
		sleep(3);
		do_halt();
	}

	/* try to resume here */
	if(cmdline.do_resume) {
		debug_msg("Trying to resume from swap\n");
		do_resume();
		debug_msg("Resume failed, starting normal boot\n");
	}

	/* resume returned, starting normal boot */
	options.name = CRYPT_ROOT_NAME;
	options.device = CRYPT_ROOT_DEV;

	/* unlock root device */
	debug_msg("Unlocking Root\n");
	if(crypt_luksOpen(&options)) {
		perror("crypt_luksOpen()");
		crypt_get_error(errormsg, 99);
		debug_printf("Error: %s\n", errormsg);
	}
	
	/* mount root filesystem */
	if(do_mount(cmdline.root)) {
		puts("Error mounting root");
		exit(errno);
	}

	kmsg_log(6);

	/* no need for /sys anymore */
	debug_msg("Unmounting /sys\n");
	if(umount("/sys"))
		perror("umount()");

	/* no need for /proc anymore */
	debug_msg("Unmounting /proc\n");
	if(umount("/proc"))
		perror("umount()");

	/* remove password from RAM */
	memset(pass, 0, strlen(pass)*sizeof(char));

	debug_msg("Switching root\n");
	switch_root(DEF_KERN_CONS, cmdline.root.target, cmdline.init);
	
	return(0);
}
/*
example initramfs file list:
 
dir /dev 755 0 0
dir /dev/mapper 755 0 0
dir /proc 755 0 0
dir /sys 755 0 0
dir /mnt 755 0 0
nod /dev/console 644 0 0 c 5 1
nod /dev/tty 660 0 0 c 5 0
nod /dev/tty0 600 0 0 c 4 0
nod /dev/sda 644 0 0 b 8 0
nod /dev/sda1 644 0 0 b 8 1
nod /dev/sda2 644 0 0 b 8 2
nod /dev/sda3 644 0 0 b 8 3
nod /dev/sda4 644 0 0 b 8 4
nod /dev/null 644 0 0 c 1 3
nod /dev/mapper/control 644 0 0 c 10 62
nod /dev/urandom 644 0 0 c 1 9
file /init /usr/src/init 755 0 0

cryptsetup patch:

Index: lib/setup.c
===================================================================
--- lib/setup.c	(revision 40)
+++ lib/setup.c	(working copy)
@@ -538,10 +538,17 @@
 start:
 	mk=NULL;
 
-	if(get_key("Enter LUKS passphrase: ",&password,&passwordLen, 0, options->key_file,  options->passphrase_fd, options->timeout, options->flags))
-		tries--;
-	else
-		tries = 0;
+	if(options->passphrase) {
+		password = NULL;
+		password = safe_alloc(512);
+		strcpy(password, options->passphrase);
+		passwordLen = strlen(password);
+	} else {
+		if(get_key("Enter LUKS passphrase: ",&password,&passwordLen, 0, options->key_file,  options->passphrase_fd, options->timeout, options->flags))
+			tries--;
+		else
+			tries = 0;
+	}
 
 	if(!password) {
 		r = -EINVAL; goto out;
*/
