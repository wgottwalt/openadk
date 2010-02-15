/*
  File: scsi-spin.c
  
  A simple program to manually spin up and down a scsi device.

  Copyright 1998 Rob Browning <rlb@cs.utexas.edu>
  Copyright 2001 Eric Delaunay <delaunay@debian.org>

  This source is covered by the terms the GNU Public License.

  Some of the original code came from
    The Linux SCSI programming HOWTO
    Heiko Ei<DF>feldt heiko@colossus.escape.de
    v1.5, 7 May 1996

*/

#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <getopt.h>
#include <string.h>
#include <fcntl.h>
#include <errno.h>
#include <mntent.h>
#include <sys/ioctl.h>
#include <scsi/sg.h>
#include <scsi/scsi.h>
#include <scsi/scsi_ioctl.h>

#include <linux/major.h>
#include <sys/sysmacros.h>
#include <sys/stat.h>

#define SCSI_DISK_MAJOR(M) ((M) == SCSI_DISK0_MAJOR || \
			    ((M) >= SCSI_DISK1_MAJOR && \
			     (M) <= SCSI_DISK7_MAJOR) || \
			    ((M) >= SCSI_DISK8_MAJOR && \
			     (M) <= SCSI_DISK15_MAJOR))

#define SCSI_BLK_MAJOR(M) \
  (SCSI_DISK_MAJOR(M) || \
   (M) == SCSI_CDROM_MAJOR)

/* define USE_SG_IO to send commands using scsi generic interface
 */
#define USE_SG_IO

#ifdef USE_SG_IO
int opt_oldioctl = 0;
int opt_verbose = 0;

const char* SENSE_KEY_STR[16] = {
    "NO SENSE",
    "RECOVERED ERROR",
    "NOT READY",
    "MEDIUM ERROR",
    "HARDWARE ERROR",
    "ILLEGAL REQUEST",
    "UNIT ATTENTION",
    "DATA PROJECT",
    "BLANK CHECK",
    "VENDOR-SPECIFIC",
    "COPY ARBORTED",
    "ABORTED COMMAND",
    "EQUAL",
    "VOLUME OVERFLOW",
    "MISCOMPARED",
    "RESERVED"
};

/* process a complete SCSI cmd. Use the generic SCSI interface. */
static int handle_SCSI_cmd(const int fd,
                           const unsigned cmd_len,      /* command length */
                           unsigned char *cmd,	        /* command buffer */
                           const unsigned in_size,      /* input data size */
                           const unsigned out_size,     /* output data size */
                           unsigned char *io_buff,      /* i/o buffer */
                           unsigned sense_size,         /* sense buf length */
                           unsigned char* sense_buff,   /* sense buffer */
			   const unsigned timeout       /* timeout in s */
                           ) {
  ssize_t status = 0;
  int k, err;
  sg_io_hdr_t sg_hdr;
  unsigned char sense[16];
  
  /* safety checks */
  if (!cmd_len) return -1;            /* need a cmd_len != 0 */
  if (in_size > 0 && io_buff == NULL) return -1; /* need an input buffer != NULL */
  /* generic SCSI device header construction */
  memset(&sg_hdr, 0, sizeof(sg_hdr));
  sg_hdr.interface_id = 'S';
  sg_hdr.dxfer_direction = SG_DXFER_NONE;
  sg_hdr.cmd_len = cmd_len;
  sg_hdr.cmdp = cmd;
  sg_hdr.dxfer_len = in_size;
  sg_hdr.dxferp = io_buff;
  sg_hdr.timeout  = (timeout ? timeout : 2)*1000;	/* timeout in ms */
  if (sense_buff == NULL) {
    sense_buff = sense;
    sense_size = sizeof(sense);
  }
  sg_hdr.mx_sb_len = sense_size;
  sg_hdr.sbp = sense_buff;

  if (opt_verbose > 1) {
    fprintf( stderr, "       cmd = " );
    for( k = 0 ; k < cmd_len ; k++ )
      fprintf( stderr, " %02x", cmd[k] );
    fputc( '\n', stderr );
  }
  /* send command */
  status = ioctl( fd, SG_IO, &sg_hdr );
  if (status < 0 || sg_hdr.masked_status == CHECK_CONDITION) {
    /* some error happened */
    fprintf( stderr, "SG_IO: status = 0x%x cmd = 0x%x\n",
             sg_hdr.status, cmd[0] );
    if (opt_verbose > 0) {
      fprintf( stderr, "       sense = " );
      for( k = 0 ; k < sg_hdr.sb_len_wr ; k++ )
        fprintf( stderr, " %02x", sense_buff[k] );
      fputc( '\n', stderr );
      err = sense_buff[0] & 0x7f;
      if (err == 0x70 || err == 0x71) {
        fprintf( stderr, "               (%s)\n", SENSE_KEY_STR[sense_buff[2] & 0xf] );
      }
    }
    perror("");
  }
  return status;  /* 0 means no error */
}
#endif

static void
scsi_spin(const int fd, const int desired_state, const int load_eject, const int wait) {
#ifdef USE_SG_IO
  if (! opt_oldioctl) {
    unsigned char cmdblk [6] =
      { START_STOP,  /* command */
        (wait ? 0 : 1),  /* lun(3 bits)/reserved(4 bits)/immed(1 bit) */
        0,  /* reserved */
        0,  /* reserved */
        (load_eject ? 2 : 0)
            | (desired_state ? 1 : 0),  /* reserved(6)/LoEj(1)/Start(1)*/
        0 };/* reserved/flag/link */
  
    if (handle_SCSI_cmd(fd, sizeof(cmdblk), cmdblk, 0, 0, NULL, 0, NULL, wait)) {
      fprintf( stderr, "start/stop failed\n" );
      exit(2);
    }
    return;
  }
#endif
  int ret;
  if (desired_state != 0)
    ret = ioctl( fd, SCSI_IOCTL_START_UNIT );
  else
    ret = ioctl( fd, SCSI_IOCTL_STOP_UNIT );
  if (ret < 0)
    perror( "scsi_spin: ioctl" );
}

static void
scsi_lock(const int fd, const int door_lock) {
#ifdef USE_SG_IO
  if (! opt_oldioctl) {
    unsigned char cmdblk [6] =
      { ALLOW_MEDIUM_REMOVAL,  /* command */
        0,  /* lun(3 bits)/reserved(5 bits) */
        0,  /* reserved */
        0,  /* reserved */
        (door_lock ? 1 : 0), /* reserved(7)/Prevent(1)*/
        0 };/* control */
  
    if (handle_SCSI_cmd(fd, sizeof(cmdblk), cmdblk, 0, 0, NULL, 0, NULL, 2)) {
      fprintf( stderr, "lock/unlock failed\n" );
      exit(2);
    }
    return;
  }
#endif
  int ret;
  if (door_lock != 0)
    ret = ioctl( fd, SCSI_IOCTL_DOORLOCK );
  else
    ret = ioctl( fd, SCSI_IOCTL_DOORUNLOCK );
  if (ret < 0)
    perror( "scsi_lock: ioctl" );
}

/* -- [ED] --
 * Check if the device has some of its partitions mounted.
 * The check is done by comparison between device major and minor numbers so it
 * even works when the device name of the mount point is not the same of the
 * one passed to scsi-spin (for example, scsidev creates device aliases under
 * /dev/scsi).
 */
static int
is_mounted( const char* device, int use_proc, int devmaj, int devmin )
{
  struct mntent *mnt;
  struct stat devstat;
  int mounted = 0;
  struct {
    __uint32_t dev_id;
    __uint32_t host_unique_id;
  } scsi_dev_id, scsi_id;
  FILE *mtab;
  char *mtabfile = use_proc ? "/proc/mounts" : "/etc/mtab";

  if (devmaj == SCSI_GENERIC_MAJOR) {
    /* scsi-spin device arg is /dev/sgN */
    int fd = open( device, O_RDONLY );
    if (fd >= 0) {
      int ret = ioctl( fd, SCSI_IOCTL_GET_IDLUN, &scsi_dev_id );
      close( fd );
      if (ret < 0)
	return -1;
    }
  }
  /*printf("devid=%x\n",scsi_dev_id.dev_id);*/

  mtab = setmntent( mtabfile, "r" );
  if (mtab == NULL)
    return -1;

  while ((mnt = getmntent( mtab )) != 0) {
    char * mdev = mnt->mnt_fsname;
    if (stat( mdev, &devstat ) == 0) {
      int maj = major(devstat.st_rdev);
      int min = minor(devstat.st_rdev);
      if (SCSI_DISK_MAJOR(maj) && SCSI_DISK_MAJOR(devmaj)) {
	if (maj == devmaj && (min & ~15) == (devmin & ~15)) {
	  mounted = 1;
	  break;
	}
      }
      else if (devmaj == SCSI_GENERIC_MAJOR && SCSI_BLK_MAJOR(maj)) {
	/* scsi-spin device arg is /dev/sgN */
	int fd = open( mdev, O_RDONLY );
	if (fd >= 0) {
	  int ret = ioctl( fd, SCSI_IOCTL_GET_IDLUN, &scsi_id );
	  close( fd );
	  /*printf("id=%x\n",scsi_id.dev_id);*/
	  if (ret == 0 && scsi_id.dev_id == scsi_dev_id.dev_id) {
	    /* same SCSI ID => same device */
	    mounted = 1;
	    break;
	  }
	}
      }
      else if (maj == SCSI_CDROM_MAJOR && maj == devmaj && min == devmin) {
	mounted = 1;
	break;
      }
    }
  }

  endmntent( mtab );
  return mounted;
}

static void
usage()
{
  static char usage_string[] = 
    "usage: scsi-spin {-u,-d} [-nfpe] device\n"
    "          -u, --up       spin up device.\n"
    "          -d, --down     spin down device.\n"
    "          -v, --verbose[=n] verbose mode (1: normal, 2: debug).\n"
#ifdef SG_IO
    "          -e, --loej     load (-u) or eject (-d) removable medium.\n"
    "          -w, --wait=[n] wait the spin up/down operation to be completed\n"
    "                         (n is the number of seconds to timeout).\n"
    "          -I, --oldioctl use legacy ioctl instead of SG I/O (-e,-w ignored).\n"
#endif
    "          -l, --lock     prevent medium removal.\n"
    "          -L, --unlock   allow medium removal.\n"
    "          -n, --noact    do nothing but check if the device is in use.\n"
    "          -f, --force    force spinning up/down even if the device is in use.\n"
    "          -p, --proc     use /proc/mounts instead of /etc/mtab to do the check.\n"
    "       device is one of /dev/sd[a-z], /dev/scd[0-9]* or /dev/sg[0-9]*.\n";

  fputs(usage_string, stderr);
}

int
main(int argc, char *argv[])
{
  int result = 0;
  int fd;
  int opt_up = 0;
  int opt_down = 0;
  int opt_loej = 0;
  int opt_wait = 0;
  int opt_force = 0;
  int opt_noact = 0;
  int opt_proc = 0;
  int opt_lock = 0;
  int opt_unlock = 0;
  struct option cmd_line_opts[] = {
    {"verbose", 2, NULL, 'v'},
    {"up", 0, NULL, 'u'},
    {"down", 0, NULL, 'd'},
#ifdef SG_IO
    {"loej", 0, NULL, 'e'},
    {"wait", 2, NULL, 'w'},
    {"oldioctl", 0, NULL, 'I'},
#endif
    {"lock", 0, NULL, 'l'},
    {"unlock", 0, NULL, 'L'},
    {"force", 0, NULL, 'f'},
    {"noact", 0, NULL, 'n'},
    {"proc", 0, NULL, 'p'},
    {0, 0, 0, 0},
  };
  char* endptr = "";
  char* device;
  struct stat devstat;
  
  char c;
  while((c = getopt_long(argc, argv, "vudewlLfnp", cmd_line_opts, NULL)) != EOF) {
    switch (c) {
    case 'v': opt_verbose = optarg ? strtol(optarg, &endptr, 10) : opt_verbose+1;
	      if (*endptr) goto error;
	      break;
    case 'u': opt_up = 1; break;
    case 'd': opt_down = 1; break;
#ifdef SG_IO
    case 'e': opt_loej = 1; break;
    case 'w': opt_wait = optarg ? strtol(optarg, &endptr, 10) : opt_wait+1;
	      if (*endptr) goto error;
	      break;
    case 'I': opt_oldioctl = 1; break;
#endif
    case 'f': opt_force = 1; break;
    case 'l': opt_lock = 1; break;
    case 'L': opt_unlock = 1; break;
    case 'n': opt_noact = 1; break;
    case 'p': opt_proc = 1; break;
    default:
error:
      usage();
      exit(1);
    }
  }

  if(opt_up && opt_down) {
    fputs("scsi-spin: specified both --up and --down.  "
          "Is this some kind of test?\n", stderr);
    exit(1);
  }
  if(opt_lock && opt_unlock) {
    fputs("scsi-spin: specified both --lock and --unlock.  "
          "Is this some kind of test?\n", stderr);
    exit(1);
  }
  if (opt_oldioctl && (opt_wait || opt_loej)) {
    fputs("scsi-spin: -e or -w not working in old ioctl mode.\n", stderr);
    exit(1);
  }
  if(!(opt_up || opt_down || opt_lock || opt_unlock)) {
    fputs("scsi-spin: must specify --up, --down, --lock or --unlock at least.\n", stderr);
    exit(1);
  }

  if(optind != (argc - 1)) {
    usage();
    exit(1);
  }

  device = argv[optind];

  if(stat(device, &devstat) == -1) {
    fprintf(stderr, "scsi-spin [stat]: %s: %s\n", device, strerror(errno));
    result = 1;
  }

  if (is_mounted( device, opt_proc, major(devstat.st_rdev), minor(devstat.st_rdev) )) {
    if (! opt_force) {
      fprintf( stderr, "scsi-spin: device already in use (mounted partition)\n" );
      exit(1);
    }
    else {
      fprintf( stderr, "scsi-spin [warning]: device is mounted but --force is passed\n" );
    }
  }

  /* first try to open the device r/w */
  fd = open(device, O_RDWR);
  if (fd < 0) {
    /* if it's fail, then try ro */
    fd = open(device, O_RDONLY);
    if (fd < 0) {
      fprintf(stderr, "scsi-spin [open]: %s: %s\n", device, strerror(errno));
      exit(1);
    }
  }

  if ((S_ISBLK(devstat.st_mode) &&
       SCSI_BLK_MAJOR(major(devstat.st_rdev))) ||
      (S_ISCHR(devstat.st_mode) &&
       major(devstat.st_rdev) == SCSI_GENERIC_MAJOR))
  {
    if (! opt_noact) {
      if (opt_lock || opt_unlock)
        scsi_lock(fd, opt_lock);
      if (opt_up || opt_down)
        scsi_spin(fd, opt_up, opt_loej, opt_wait);
    }
  }
  else {
    fprintf(stderr, "scsi-spin: %s is not a disk or generic SCSI device.\n", device);
    result = 1;
  }

  close(fd);
  return result;
}
