/*
 * nand - simple nand memory technology device manipulation tool
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
 * The code is based on the mtd-utils nandwrite and flash_erase_all.
 */

#define _GNU_SOURCE
#include <ctype.h>
#include <errno.h>
#include <err.h>
#include <fcntl.h>
#include <limits.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/mount.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <sys/syscall.h>
#include <getopt.h>

#include "mtd/mtd-user.h"
#include <linux/reboot.h>

int nand_open(const char *, int);
int nand_erase(const char *);
int nand_info(const char *);
int nand_write(const char*, const char *, int);
void usage(void) __attribute__((noreturn));

#define MAX_PAGE_SIZE	4096
#define MAX_OOB_SIZE	128

static unsigned char writebuf[MAX_PAGE_SIZE];
static unsigned char oobbuf[MAX_OOB_SIZE];
static unsigned char oobreadbuf[MAX_OOB_SIZE];

static struct nand_oobinfo autoplace_oobinfo = {
	.useecc = MTD_NANDECC_AUTOPLACE
};

static void erase_buffer(void *buffer, size_t size)
{
	const uint8_t kEraseByte = 0xff;

	if (buffer != NULL && size > 0) {
		memset(buffer, kEraseByte, size);
	}
}

int nand_open(const char *nand, int flags) {

	FILE *fp;
	char dev[PATH_MAX];
	int i;

	if ((fp = fopen("/proc/mtd", "r"))) {
		while (fgets(dev, sizeof(dev), fp)) {
			if (sscanf(dev, "mtd%d:", &i) && strstr(dev, nand)) {
				snprintf(dev, sizeof(dev), "/dev/mtd%d", i);
				fclose(fp);
				return open(dev, flags);
			}
		}
		fclose(fp);
	}

	return open(nand, flags);
}

int nand_info(const char *nand) {

	int fd, ret;
	mtd_info_t nandinfo;
	loff_t offset;

	if ((fd = nand_open(nand, O_RDONLY)) < 0) {
		fprintf(stderr, "nand: unable to open MTD device %s\n", nand);
		return 1;
	}

	if (ioctl(fd, MEMGETINFO, &nandinfo) != 0) {
		fprintf(stderr, "nand: unable to get MTD device info from %s\n", nand);
		return 1;
	}

	if (nandinfo.type == MTD_NANDFLASH) {
		fprintf(stdout, "MTD devise is NAND\n");
	} else {
		fprintf(stdout, "MTD devise is NOT NAND\n");
		return 1;
	}

	fprintf(stdout, "NAND block/erase size is: %u\n", nandinfo.erasesize); 
	fprintf(stdout, "NAND page size is: %u\n", nandinfo.writesize); 
	fprintf(stdout, "NAND OOB size is: %u\n", nandinfo.oobsize); 
	fprintf(stdout, "NAND partition size is: %u\n", nandinfo.size); 

	for (offset = 0; offset < nandinfo.size; offset += nandinfo.erasesize) {
		ret = ioctl(fd, MEMGETBADBLOCK, &offset);
		if (ret > 0) {
			printf("\nSkipping bad block at %llu\n", offset);
			continue;
		} else if (ret < 0) {
			if (errno == EOPNOTSUPP) {
				fprintf(stderr, "Bad block check not available\n");
				return 1;
			}
		}
	}

	return 0;
}

int nand_erase(const char *nand) {

	mtd_info_t meminfo;
	struct nand_oobinfo oobinfo;
	int fd, clmpos, clmlen;
	erase_info_t erase;

	clmpos = 0;
	clmlen = 8;

	erase_buffer(oobbuf, sizeof(oobbuf));

	if ((fd = nand_open(nand, O_RDWR)) < 0) {
		fprintf(stderr, "nand: %s: unable to open MTD device\n", nand);
		return 1;
	}

	if (ioctl(fd, MEMGETINFO, &meminfo) != 0) {
		fprintf(stderr, "nand: %s: unable to get MTD device info\n", nand);
		return 1;
	}

	erase.length = meminfo.erasesize;

	for (erase.start = 0; erase.start < meminfo.size; erase.start += meminfo.erasesize) {
		if (ioctl(fd, MEMERASE, &erase) != 0) {
			fprintf(stderr, "\nnand: %s: MTD Erase failure: %s\n", nand, strerror(errno));
			continue;
		}

		struct mtd_oob_buf oob;

		if (ioctl(fd, MEMGETOOBSEL, &oobinfo) != 0) {
			fprintf(stderr, "Unable to get NAND oobinfo\n");
			return 1;
		}

		if (oobinfo.useecc != MTD_NANDECC_AUTOPLACE) {
			fprintf(stderr, "NAND device/driver does not support autoplacement of OOB\n");
			return 1;
		}

		if (!oobinfo.oobfree[0][1]) {
			fprintf(stderr, "Autoplacement selected and no empty space in oob\n");
			return 1;
		}
		clmpos = oobinfo.oobfree[0][0];
		clmlen = oobinfo.oobfree[0][1];
		if (clmlen > 8)
			clmlen = 8;

		//fprintf(stdout, "Using clmlen: %d clmpos: %d\n", clmlen, clmpos); 

		oob.ptr = oobbuf;
		oob.start = erase.start + clmpos;
		oob.length = clmlen;
		if (ioctl (fd, MEMWRITEOOB, &oob) != 0) {
			fprintf(stderr, "\nnand: %s: MTD writeoob failure: %s\n", nand, strerror(errno));
			continue;
		}
	}
	return 0;
}

int nand_write(const char *img, const char *nand, int quiet) {

	static bool pad = true;
	static const char *standard_input = "-";
	static bool markbad = true;
	static int mtdoffset = 0;
	int cnt = 0;
	int fd = -1;
	int ifd = -1;
	int imglen = 0, pagelen;
	bool baderaseblock = false;
	int blockstart = -1;
	struct mtd_info_user meminfo;
	struct mtd_oob_buf oob;
	loff_t offs;
	int ret, readlen;

	erase_buffer(oobbuf, sizeof(oobbuf));

	/* Open the device */
	if ((fd = nand_open(nand, O_RDWR | O_SYNC)) == -1) {
		perror(nand);
		exit (EXIT_FAILURE);
	}

	/* Fill in MTD device capability structure */
	if (ioctl(fd, MEMGETINFO, &meminfo) != 0) {
		perror("MEMGETINFO");
		close(fd);
		exit (EXIT_FAILURE);
	}

	/* Make sure device page sizes are valid */
	if (!(meminfo.oobsize == 16 && meminfo.writesize == 512) &&
			!(meminfo.oobsize == 8 && meminfo.writesize == 256) &&
			!(meminfo.oobsize == 64 && meminfo.writesize == 2048) &&
			!(meminfo.oobsize == 128 && meminfo.writesize == 4096)) {
		fprintf(stderr, "Unknown flash (not normal NAND)\n");
		close(fd);
		exit (EXIT_FAILURE);
	}

	oob.length = meminfo.oobsize;
	oob.ptr = oobbuf;

	/* Determine if we are reading from standard input or from a file. */
	if (strcmp(img, standard_input) == 0) {
		ifd = STDIN_FILENO;
	} else {
		ifd = open(img, O_RDONLY);
	}

	if (ifd == -1) {
		perror(img);
		goto restoreoob;
	}

	pagelen = meminfo.writesize;

	/*
	 * For the standard input case, the input size is merely an
	 * invariant placeholder and is set to the write page
	 * size. Otherwise, just use the input file size.
	 */

	if (ifd == STDIN_FILENO) {
	    imglen = pagelen;
	} else {
	    imglen = lseek(ifd, 0, SEEK_END);
	    lseek (ifd, 0, SEEK_SET);
	}

	// Check, if file is page-aligned
	if ((!pad) && ((imglen % pagelen) != 0)) {
		fprintf (stderr, "Input file is not page-aligned. Use the padding "
				 "option.\n");
		goto closeall;
	}

	// Check, if length fits into device
	if ( ((imglen / pagelen) * meminfo.writesize) > (meminfo.size - mtdoffset)) {
		fprintf (stderr, "Image %d bytes, NAND page %d bytes, OOB area %u bytes, device size %u bytes\n",
				imglen, pagelen, meminfo.writesize, meminfo.size);
		perror ("Input file does not fit into device");
		goto closeall;
	}

	/*
	 * Get data from input and write to the device while there is
	 * still input to read and we are still within the device
	 * bounds. Note that in the case of standard input, the input
	 * length is simply a quasi-boolean flag whose values are page
	 * length or zero.
	 */
	while (imglen && (mtdoffset < meminfo.size)) {
		// new eraseblock , check for bad block(s)
		// Stay in the loop to be sure if the mtdoffset changes because
		// of a bad block, that the next block that will be written to
		// is also checked. Thus avoiding errors if the block(s) after the
		// skipped block(s) is also bad
		while (blockstart != (mtdoffset & (~meminfo.erasesize + 1))) {
			blockstart = mtdoffset & (~meminfo.erasesize + 1);
			offs = blockstart;
			baderaseblock = false;
			if (quiet < 2)
				fprintf (stdout, "Writing data to block %d at offset 0x%x\n",
						 blockstart / meminfo.erasesize, blockstart);

			/* Check all the blocks in an erase block for bad blocks */
			do {
				if ((ret = ioctl(fd, MEMGETBADBLOCK, &offs)) < 0) {
					perror("ioctl(MEMGETBADBLOCK)");
					goto closeall;
				}
				if (ret == 1) {
					baderaseblock = true;
					if (!quiet)
						fprintf (stderr, "Bad block at %x "
								"from %x will be skipped\n",
								(int) offs, blockstart);
				}

				if (baderaseblock) {
					mtdoffset = blockstart + meminfo.erasesize;
				}
				offs +=  meminfo.erasesize;
			} while ( offs < blockstart + meminfo.erasesize );

		}

		readlen = meminfo.writesize;

		if (ifd != STDIN_FILENO) {
			int tinycnt = 0;

			if (pad && (imglen < readlen))
			{
				readlen = imglen;
				erase_buffer(writebuf + readlen, meminfo.writesize - readlen);
			}

			/* Read Page Data from input file */
			while(tinycnt < readlen) {
				cnt = read(ifd, writebuf + tinycnt, readlen - tinycnt);
				if (cnt == 0) { // EOF
					break;
				} else if (cnt < 0) {
					perror ("File I/O error on input file");
					goto closeall;
				}
				tinycnt += cnt;
			}
		} else {
			int tinycnt = 0;

			while(tinycnt < readlen) {
				cnt = read(ifd, writebuf + tinycnt, readlen - tinycnt);
				if (cnt == 0) { // EOF
					break;
				} else if (cnt < 0) {
					perror ("File I/O error on stdin");
					goto closeall;
				}
				tinycnt += cnt;
			}

			/* No padding needed - we are done */
			if (tinycnt == 0) {
				imglen = 0;
				break;
			}

			/* No more bytes - we are done after writing the remaining bytes */
			if (cnt == 0) {
				imglen = 0;
			}

			/* Padding */
			if (pad && (tinycnt < readlen)) {
				erase_buffer(writebuf + tinycnt, meminfo.writesize - tinycnt);
			}
		}

		/* Write out the Page data */
		if (pwrite(fd, writebuf, meminfo.writesize, mtdoffset) != meminfo.writesize) {
			int rewind_blocks;
			off_t rewind_bytes;
			erase_info_t erase;

			perror ("pwrite");
			/* Must rewind to blockstart if we can */
			rewind_blocks = (mtdoffset - blockstart) / meminfo.writesize; /* Not including the one we just attempted */
			rewind_bytes = (rewind_blocks * meminfo.writesize) + readlen;
			if (lseek(ifd, -rewind_bytes, SEEK_CUR) == -1) {
				perror("lseek");
				fprintf(stderr, "Failed to seek backwards to recover from write error\n");
				goto closeall;
			}
			erase.start = blockstart;
			erase.length = meminfo.erasesize;
			fprintf(stderr, "Erasing failed write from %08lx-%08lx\n",
				(long)erase.start, (long)erase.start+erase.length-1);
			if (ioctl(fd, MEMERASE, &erase) != 0) {
				perror("MEMERASE");
				goto closeall;
			}

			if (markbad) {
				loff_t bad_addr = mtdoffset & (~(meminfo.erasesize) + 1);
				fprintf(stderr, "Marking block at %08lx bad\n", (long)bad_addr);
				if (ioctl(fd, MEMSETBADBLOCK, &bad_addr)) {
					perror("MEMSETBADBLOCK");
					/* But continue anyway */
				}
			}
			mtdoffset = blockstart + meminfo.erasesize;
			imglen += rewind_blocks * meminfo.writesize;

			continue;
		}
		if (ifd != STDIN_FILENO) {
			imglen -= readlen;
		}
		mtdoffset += meminfo.writesize;
	}

closeall:
	close(ifd);

restoreoob:

	close(fd);
	/*

	if ((ifd != STDIN_FILENO) && (imglen > 0)) {
		perror ("Data was only partially written due to error\n");
		exit (EXIT_FAILURE);
	}

	/* Return happy */
	return EXIT_SUCCESS;
}

void
usage(void)
{
	fprintf(stderr, "Usage: nand [<options> ...] <command> [<arguments> ...] <device>\n\n"
	"The device is in the format of mtdX (eg: mtd4) or its label.\n"
	"nand recognises these commands:\n"
	"        erase                   erase all data on device\n"
	"        info                    print information about device\n"
	"        write <imagefile>|-     write <imagefile> (use - for stdin) to device\n"
	"Following options are available:\n"
	"        -q                      quiet mode\n"
	"        -r                      reboot after successful command\n"
	"Example: To write linux.img to mtd partition labeled as linux\n"
	"         nand write linux.img linux\n\n");
	exit(1);
}

int main(int argc, char **argv) {

	int ch, quiet, boot;
	char *device;
	enum {
		CMD_INFO,
		CMD_ERASE,
		CMD_WRITE,
	} cmd;

	boot = 0;
	quiet = 0;

	while ((ch = getopt(argc, argv, "Fqr:")) != -1)
		switch (ch) {
			case 'F':
				quiet = 1;
				/* FALLTHROUGH */
			case 'q':
				quiet++;
				break;
			case 'r':
				boot = 1;
				break;
			case '?':
			default:
				usage();
		}
	argc -= optind;
	argv += optind;

	if (argc < 2)
		usage();

	if ((strcmp(argv[0], "erase") == 0) && (argc == 2)) {
		cmd = CMD_ERASE;
		device = argv[1];
	} else if ((strcmp(argv[0], "info") == 0) && (argc == 2)) {
		cmd = CMD_INFO;
		device = argv[1];
	} else if ((strcmp(argv[0], "write") == 0) && (argc == 3)) {
		cmd = CMD_WRITE;
		device = argv[2];
	} else {
		usage();
	}

	sync();

	switch (cmd) {
		case CMD_INFO:
			if (quiet < 2)
				fprintf(stderr, "Info about %s ...\n", device);
			nand_info(device);
			break;
		case CMD_ERASE:
			if (quiet < 2)
				fprintf(stderr, "Erasing %s ...\n", device);
			nand_erase(device);
			break;
		case CMD_WRITE:
			if (quiet < 2)
				fprintf(stderr, "Writing from %s to %s ... ", argv[1], device);
			nand_erase(device);
			nand_write(argv[1], device, quiet);
			if (quiet < 2)
				fprintf(stderr, "\n");
			break;
	}
	
	sync();

	if (boot) {
		fprintf(stderr, "\nRebooting ... ");
		fflush(stdout);
		fflush(stderr);
		syscall(SYS_reboot,LINUX_REBOOT_MAGIC1,LINUX_REBOOT_MAGIC2,LINUX_REBOOT_CMD_RESTART,NULL);
	}	

	return 0;
}
