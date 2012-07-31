#!/usr/bin/env bash
#-
# Copyright © 2010, 2011, 2012
#	Waldemar Brodkorb <wbx@openadk.org>
#	Thorsten Glaser <tg@mirbsd.org>
#
# Provided that these terms and disclaimer and all copyright notices
# are retained or reproduced in an accompanying document, permission
# is granted to deal in this work without restriction, including un-
# limited rights to use, publicly perform, distribute, sell, modify,
# merge, give away, or sublicence.
#
# This work is provided 'AS IS' and WITHOUT WARRANTY of any kind, to
# the utmost extent permitted by applicable law, neither express nor
# implied; without malicious intent or gross negligence. In no event
# may a licensor, author or contributor be held liable for indirect,
# direct, other damage, loss, or other issues arising in any way out
# of dealing in the work, even if advised of the possibility of such
# damage or existence of a defect, except proven that it results out
# of said person's immediate fault when using the work as intended.
#
# Alternatively, this work may be distributed under the terms of the
# General Public License, any version, as published by the Free Soft-
# ware Foundation.
#-

TOPDIR=$(pwd)
me=$0

case :$PATH: in
(*:$TOPDIR/bin/tools:*) ;;
(*) export PATH=$PATH:$TOPDIR/bin/tools ;;
esac

test -n "$KSH_VERSION" || if ! which mksh >/dev/null 2>&1; then
	make package=mksh fetch || exit 1
	df=$(cd package/mksh; TOPDIR="$TOPDIR" make show=DISTFILES)
	mkdir -p build_mksh
	gzip -dc dl/"$df" | (cd build_mksh; cpio -mid)
	cd build_mksh/mksh
	bash Build.sh -r -c lto || exit 1
	cp mksh "$TOPDIR"/bin/tools/
	cd "$TOPDIR"
	rm -rf build_mksh
fi

test -n "$KSH_VERSION" || exec mksh "$me" "$@"
if test -z "$KSH_VERSION"; then
	echo >&2 Fatal error: could not run myself with mksh!
	exit 255
fi

### run with mksh from here onwards ###

me=${me##*/}

TOPDIR=$(realpath .)
ostype=$(uname -s)

cfgfs=1
noformat=0
quiet=0
serial=0
speed=115200
panicreboot=10
type=qemu

function usage {
cat >&2 <<EOF
Syntax: $me [�g] [-c cfgfssize] [-p panictime] [±q] [-s serialspeed]
    [±t][ -f diskformat ] -n disk.img archive
Defaults: -c 1 -p 10 -s 115200 -f qemu; -t = enable serial console
EOF
	exit $1
}

while getopts "c:ghp:qs:ntf:" ch; do
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
	(g)	grub=1 ;;
	(+g)	grub=0 ;;
	(s)	if [[ $OPTARG != @(96|192|384|576|1152)00 ]]; then
			print -u2 "$me: serial speed $OPTARG invalid"
			exit 1
		fi
		speed=$OPTARG ;;
	(n)	noformat=1 ;;
	(t)	serial=1 ;;
	(+t)	serial=0 ;;
	(f)	type=$OPTARG ;;
	(*)	usage 1 ;;
	}
done
shift $((OPTIND - 1))

(( $# == 2 )) || usage 1

f=0
tools='genext2fs qemu-img'
case $ostype {
(DragonFly|*BSD*)
	;;
(Darwin)
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

qemu-img create -f raw $tgt 524288k

if stat -qs .>/dev/null 2>&1; then
	statcmd='stat -f %z'	# BSD stat (or so we assume)
else
	statcmd='stat -c %s'	# GNU stat
fi

dksz=$(($($statcmd "$tgt")*2))
heads=64
secs=32
(( cyls = dksz / heads / secs ))
if (( cyls < (cfgfs + 2) )); then
	print -u2 "Size of $tgt is $dksz, this looks fishy?"
	exit 1
fi

if ! T=$(mktemp -d /tmp/openadk.XXXXXXXXXX); then
	print -u2 Error creating temporary directory.
	exit 1
fi
tar -xOzf "$src" usr/share/grub-bin/core.img >"$T/core.img"
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
echo $corestartsec $coreendsec | mksh "$TOPDIR/scripts/bootgrub.mksh" \
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

(( quiet )) || print Extracting installation archive...
gzip -dc "$src" | (cd "$T"; tar -xpf -)
cd "$T"
rnddev=/dev/urandom
[[ -c /dev/arandom ]] && rnddev=/dev/arandom
dd if=$rnddev bs=16 count=1 >>etc/.rnd 2>/dev/null
(( quiet )) || print Fixing up permissions...
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
	linuxargs="root=/dev/sda1 $consargs"
	(( panicreboot )) && linuxargs="$linuxargs panic=$panicreboot"
	print "\tlinux /boot/kernel $linuxargs"
	print '}'
) >boot/grub/grub.cfg
set -A grubfiles
ngrubfiles=0
for a in usr/lib/grub/*-pc/{*.mod,efiemu??.o,command.lst,moddep.lst,fs.lst,handler.lst,parttool.lst}; do
	[[ -e $a ]] && grubfiles[ngrubfiles++]=$a
done
cp "${grubfiles[@]}" boot/grub/
cd "$TOPDIR"

dd if=$tgt of=mbr bs=64k count=1 2>/dev/null
bs=$((524288))
(( quiet )) || print Generating ext2 image with size $bs...
dd if=/dev/zero of=cfgfs bs=1024k count=$cfgfs 2>/dev/null
genext2fs -q -b $bs -d $T ${tgt}.new
(( quiet )) || print Finishing up...
cat mbr ${tgt}.new cfgfs > $tgt

if [[ $type = vbox ]]; then
	rm -f $tgt.vdi
	VBoxManage convertdd $tgt $tgt.vdi
fi

rm -rf "$T" mbr ${tgt}.new cfgfs
exit 0
