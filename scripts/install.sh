#!/usr/bin/env bash
#-
# Copyright © 2010-2014
#	Waldemar Brodkorb <wbx@openadk.org>
#	Thorsten Glaser <tg@mirbsd.org>
#
# Provided that these terms and disclaimer and all copyright notices
# are retained or reproduced in an accompanying document, permission
# is granted to deal in this work without restriction, including un‐
# limited rights to use, publicly perform, distribute, sell, modify,
# merge, give away, or sublicence.
#
# This work is provided “AS IS” and WITHOUT WARRANTY of any kind, to
# the utmost extent permitted by applicable law, neither express nor
# implied; without malicious intent or gross negligence. In no event
# may a licensor, author or contributor be held liable for indirect,
# direct, other damage, loss, or other issues arising in any way out
# of dealing in the work, even if advised of the possibility of such
# damage or existence of a defect, except proven that it results out
# of said person’s immediate fault when using the work as intended.
#
# Alternatively, this work may be distributed under the terms of the
# General Public License, any version, as published by the Free Soft-
# ware Foundation.
#-
# Prepare a USB stick or CF/SD/MMC card or hard disc for installation
# of OpenADK:
# • install a Master Boot Record containing a MirBSD PBR loading GRUB
# • write GRUB2 core.img just past the MBR
# • create a root partition with ext2fs and extract the OpenADK image
#   just built there
# • create a cfgfs partition

ADK_TOPDIR=$(pwd)
HOST=$(gcc -dumpmachine)
me=$0

case :$PATH: in
(*:$ADK_TOPDIR/host_$HOST/usr/bin:*) ;;
(*) export PATH=$PATH:$ADK_TOPDIR/host_$HOST/usr/bin ;;
esac

test -n "$KSH_VERSION" || exec mksh "$me" "$@"
if test -z "$KSH_VERSION"; then
	echo >&2 Fatal error: could not run myself with mksh!
	exit 255
fi

### run with mksh from here onwards ###

me=${me##*/}

if (( USER_ID )); then
	print -u2 Installation is only possible as root!
	exit 1
fi

ADK_TOPDIR=$(realpath .)
ostype=$(uname -s)

cfgfs=1
noformat=0
quiet=0
serial=0
speed=115200
panicreboot=10

function usage {
cat >&2 <<EOF
Syntax: $me [-c cfgfssize] [-p panictime] [±q] [-s serialspeed]
    [±t] -n /dev/sdb image
Defaults: -c 1 -p 10 -s 115200; -t = enable serial console
EOF
	exit $1
}

while getopts "c:hp:qs:nt" ch; do
	case $ch {
	(c)	if (( (cfgfs = OPTARG) < 0 || cfgfs > 5 )); then
			print -u2 "$me: -c $OPTARG out of bounds"
			exit 1
		fi ;;
	(h)	usage 0 ;;
	(p)	if (( (panicreboot = OPTARG) < 0 || panicreboot > 300 )); then
			print -u2 "$me: -p $OPTARG out of bounds"
			exit 1
		fi ;;
	(q)	quiet=1 ;;
	(+q)	quiet=0 ;;
	(s)	if [[ $OPTARG != @(96|192|384|576|1152)00 ]]; then
			print -u2 "$me: serial speed $OPTARG invalid"
			exit 1
		fi
		speed=$OPTARG ;;
	(n)	noformat=1 ;;
	(t)	serial=1 ;;
	(+t)	serial=0 ;;
	(*)	usage 1 ;;
	}
done
shift $((OPTIND - 1))

(( $# == 2 )) || usage 1

f=0
tools='mke2fs tune2fs'
case $ostype {
(DragonFly|*BSD*)
	;;
(Darwin)
	tools="$tools fuse-ext2"
	;;
(Linux)
	;;
(*)
	print -u2 Sorry, not ported to the OS "'$ostype'" yet.
	exit 1
	;;
}
for tool in $tools; do
	print -n Checking if $tool is installed...
	if whence -p $tool >/dev/null; then
		print " okay"
	else
		print " failed"
		f=1
	fi
done
(( f )) && exit 1

tgt=$1
src=$2

if [[ ! -b $tgt ]]; then
	print -u2 "'$tgt' is not a block device, exiting"
	exit 1
fi
if [[ ! -f $src ]]; then
	print -u2 "'$src' is not a file, exiting"
	exit 1
fi
(( quiet )) || print "Installing $src on $tgt."

case $ostype {
(DragonFly|*BSD*)
	basedev=${tgt%c}
	tgt=${basedev}c
	part=${basedev}i
	match=\'${basedev}\''[a-p]'
	function mount_ext2fs {
		mount -t ext2fs "$1" "$2"
	}
	;;
(Darwin)
	basedev=$tgt
	part=${basedev}s1
	match=\'${basedev}\''?(s+([0-9]))'
	function mount_ext2fs {
		fuse-ext2 "$1" "$2" -o rw+
		sleep 3
	}
	;;
(Linux)
	basedev=$tgt
	part=${basedev}1
	match=\'${basedev}\''+([0-9])'
	function mount_ext2fs {
		mount -t ext2 "$1" "$2"
	}
	;;
}

mount |&
while read -p dev rest; do
	eval [[ \$dev = $match ]] || continue
	print -u2 "Block device $tgt is in use, please umount first."
	exit 1
done

if (( !quiet )); then
	print "WARNING: This will overwrite $basedev - type Yes to continue!"
	read x
	[[ $x = Yes ]] || exit 0
fi

dksz=$(dkgetsz "$tgt")
heads=64
secs=32
(( cyls = dksz / heads / secs ))
if (( cyls < (cfgfs + 2) )); then
	print -u2 "Size of $tgt is $dksz, this looks fishy?"
	exit 1
fi

if stat -qs .>/dev/null 2>&1; then
	statcmd='stat -f %z'	# BSD stat (or so we assume)
else
	statcmd='stat -c %s'	# GNU stat
fi

if ! T=$(mktemp -d /tmp/openadk.XXXXXXXXXX); then
	print -u2 Error creating temporary directory.
	exit 1
fi
tar -xOzf "$src" boot/grub/core.img >"$T/core.img"
integer coreimgsz=$($statcmd "$T/core.img")
if (( coreimgsz < 1024 )); then
	print -u2 core.img is probably too small: $coreimgsz
	rm -rf "$T"
	exit 1
fi
if (( coreimgsz > 65024 )); then
	print -u2 core.img is larger than 64K-512: $coreimgsz
	rm -rf "$T"
	exit 1
fi
(( coreendsec = (coreimgsz + 511) / 512 ))
if [[ $basedev = /dev/svnd+([0-9]) ]]; then
	# BSD svnd0 mode: protect sector #1
	corestartsec=2
	(( ++coreendsec ))
	corepatchofs=$((0x614))
else
	corestartsec=1
	corepatchofs=$((0x414))
fi
# partition offset: at least coreendsec+1 but aligned on a multiple of secs
(( partofs = ((coreendsec / secs) + 1) * secs ))

(( quiet )) || print Preparing MBR and GRUB2...
dd if=/dev/zero of="$T/firsttrack" count=$partofs 2>/dev/null
echo $corestartsec $coreendsec | mksh "$ADK_TOPDIR/scripts/bootgrub.mksh" \
    -A -g $((cyls-cfgfs)):$heads:$secs -M 1:0x83 -O $partofs | \
    dd of="$T/firsttrack" conv=notrunc 2>/dev/null
dd if="$T/core.img" of="$T/firsttrack" conv=notrunc seek=$corestartsec \
    2>/dev/null
# set partition where it can find /boot/grub
print -n '\0\0\0\0' | \
    dd of="$T/firsttrack" conv=notrunc bs=1 seek=$corepatchofs 2>/dev/null

# create cfgfs partition (mostly taken from bootgrub.mksh)
set -A thecode
typeset -Uui8 thecode
mbrpno=0
set -A g_code $cyls $heads $secs
(( psz = g_code[0] * g_code[1] * g_code[2] ))
(( pofs = (cyls - cfgfs) * g_code[1] * g_code[2] ))
set -A o_code	# g_code equivalent for partition offset
(( o_code[2] = pofs % g_code[2] + 1 ))
(( o_code[1] = pofs / g_code[2] ))
(( o_code[0] = o_code[1] / g_code[1] + 1 ))
(( o_code[1] = o_code[1] % g_code[1] + 1 ))
# boot flag; C/H/S offset
thecode[mbrpno++]=0x00
(( thecode[mbrpno++] = o_code[1] - 1 ))
(( cylno = o_code[0] > 1024 ? 1023 : o_code[0] - 1 ))
(( thecode[mbrpno++] = o_code[2] | ((cylno & 0x0300) >> 2) ))
(( thecode[mbrpno++] = cylno & 0x00FF ))
# partition type; C/H/S end
(( thecode[mbrpno++] = 0x88 ))
(( thecode[mbrpno++] = g_code[1] - 1 ))
(( cylno = g_code[0] > 1024 ? 1023 : g_code[0] - 1 ))
(( thecode[mbrpno++] = g_code[2] | ((cylno & 0x0300) >> 2) ))
(( thecode[mbrpno++] = cylno & 0x00FF ))
# partition offset, size (LBA)
(( thecode[mbrpno++] = pofs & 0xFF ))
(( thecode[mbrpno++] = (pofs >> 8) & 0xFF ))
(( thecode[mbrpno++] = (pofs >> 16) & 0xFF ))
(( thecode[mbrpno++] = (pofs >> 24) & 0xFF ))
(( pssz = psz - pofs ))
(( thecode[mbrpno++] = pssz & 0xFF ))
(( thecode[mbrpno++] = (pssz >> 8) & 0xFF ))
(( thecode[mbrpno++] = (pssz >> 16) & 0xFF ))
(( thecode[mbrpno++] = (pssz >> 24) & 0xFF ))
# write partition table entry
ostr=
curptr=0
while (( curptr < 16 )); do
	ostr=$ostr\\0${thecode[curptr++]#8#}
done
print -n "$ostr" | \
    dd of="$T/firsttrack" conv=notrunc bs=1 seek=$((0x1CE)) 2>/dev/null

(( quiet )) || print Writing MBR and GRUB2 to target device...
dd if="$T/firsttrack" of="$tgt"

if [[ $basedev = /dev/svnd+([0-9]) ]]; then
	(( quiet )) || print "Creating BSD disklabel on target device..."
	# c: whole device (must be so)
	# i: ext2fs (matching first partition)
	# j: cfgfs (matching second partition)
	# p: MBR and GRUB2 area (by tradition)
	cat >"$T/bsdlabel" <<-EOF
		type: vnd
		disk: vnd device
		label: OpenADK
		flags:
		bytes/sector: 512
		sectors/track: $secs
		tracks/cylinder: $heads
		sectors/cylinder: $((heads * secs))
		cylinders: $cyls
		total sectors: $((cyls * heads * secs))
		rpm: 3600
		interleave: 1
		trackskew: 0
		cylinderskew: 0
		headswitch: 0
		track-to-track seek: 0
		drivedata: 0

		16 partitions:
		c: $((cyls * heads * secs)) 0 unused
		i: $(((cyls - cfgfs) * heads * secs - partofs)) $partofs ext2fs
		j: $((cfgfs * heads * secs)) $(((cyls - cfgfs) * heads * secs)) unknown
		p: $partofs 0 unknown
EOF
	disklabel -R ${basedev#/dev/} "$T/bsdlabel"
fi

(( quiet )) || print "Creating ext2fs on ${part}..."
q=
(( quiet )) && q=-q
(( noformat )) || mke2fs $q "$part"
partuuid=$(tune2fs -l "$part" | sed -n '/^Filesystem UUID:[	 ]*/s///p')
(( noformat )) || tune2fs -c 0 -i 0 "$part"

(( quiet )) || print Extracting installation archive...
mount_ext2fs "$part" "$T"
gzip -dc "$src" | (cd "$T"; tar -xvpf -)
cd "$T"
rnddev=/dev/urandom
[[ -c /dev/arandom ]] && rnddev=/dev/arandom
dd if=$rnddev bs=16 count=1 >>etc/.rnd 2>/dev/null
(( quiet )) || print Fixing up permissions...
chown 0:0 tmp
chmod 1777 tmp
chmod 4755 bin/busybox
[[ -f usr/bin/Xorg ]] && chmod 4755 usr/bin/Xorg
[[ -f usr/bin/sudo ]] && chmod 4755 usr/bin/sudo
(( quiet )) || print Configuring GRUB2 bootloader...
mkdir -p boot/grub
(
	print set default=0
	print set timeout=1
	if (( serial )); then
		print serial --unit=0 --speed=$speed
		print terminal_output serial
		print terminal_input serial
		consargs="console=ttyS0,$speed console=tty0"
	else
		print terminal_output console
		print terminal_input console
		consargs="console=tty0"
	fi
	print
	print 'menuentry "GNU/Linux (OpenADK)" {'
	linuxargs="root=UUID=$partuuid $consargs"
	(( panicreboot )) && linuxargs="$linuxargs panic=$panicreboot"
	print "\tlinux /boot/kernel $linuxargs"
	print '}'
) >boot/grub/grub.cfg
(( quiet )) || print Finishing up...
cd "$ADK_TOPDIR"
umount "$T"

(( quiet )) || print "\nNote: the rootfs UUID is: $partuuid"

rm -rf "$T"
exit 0
