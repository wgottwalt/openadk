#!/usr/bin/env bash
#-
# Copyright © 2010-2012
#	Waldemar Brodkorb <wbx@openadk.org>
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

filesystem=ext2

while getopts "f:i" option
do
	case $option in
		f)
		filesystem=$OPTARG
		;;
		i)
		initramfs=1
		;;
		*)
		printf "Option not recognized\n"
		exit 1
		;;
	esac
done
shift $(($OPTIND - 1))


tools='qemu-img'
ostype=$(uname -s)

case $ostype in
(Darwin)
	tools="$tools genext2fs"
	;;
(Linux)
	tools="$tools mke2fs parted"
	if [ $(id -u) -ne 0 ];then
		printf "Installation is only possible as root\n"
		exit 1
	fi
	;;
(*)
	printf Sorry, not ported to the OS "'$ostype'" yet.\n
	exit 1
	;;
esac

for tool in $tools; do
	printf "Checking if $tool is installed..."
	if which $tool >/dev/null; then
		printf " okay\n"
	else
		printf " failed\n"
		f=1
	fi
done
(( f )) && exit 1

if [ -z $1 ];then
	printf "Please give the name of the image file\n"
	exit 1
fi	

if [ -z $initramfs ];then
	if [ -z $2 ];then
		printf "Please give the name of the openadk archive file\n"
		exit 1
	fi	
else
	if [ -z $2 ];then
		printf "Please give the full path prefix to kernel/initramfs\n"
		exit 1
	fi
fi


printf "Create partition and filesystem\n"
case $ostype in
(Darwin)
	offset=16384
	;;
(Linux)
	printf "Generate qemu image (768 MB)\n"
	qemu-img create -f raw $1 768M >/dev/null
	parted -s $1 mklabel msdos
	parted -s $1 -- mkpart primary ext2 0 -0
	parted -s $1 set 1 boot on
	offset=$(parted $1 unit b print | tail -2 | head -1 | cut -f 1 --delimit="B" | cut -c 9-)
	;;
(*)
	printf Sorry, not ported to the OS "'$ostype'" yet.\n
	exit 1
	;;
esac



if [ "$filesystem" = "ext2" -o "$filesystem" = "ext3" -o "$filesystem" = "ext4" ];then
	mkfsopts=-F
fi

case $ostype in
(Darwin)
	tmp=$(mktemp -d -t xxx)
	tar -C $tmp -xzpf $2 
	printf "Fixing permissions\n"
	chmod 1777 $tmp/tmp
	chmod 4755 $tmp/bin/busybox
	printf "Creating filesystem $filesystem\n"
	genext2fs -q -b 709600 -d $tmp ${1}.new
	cat scripts/mbr ${1}.new > $1
	rm ${1}.new 
	;;
(Linux)
	dd if=$1 of=mbr bs=$offset count=1 2>/dev/null
	dd if=$1 skip=$offset of=$1.new 2>/dev/null
	printf "Creating filesystem $filesystem\n"
	mkfs.$filesystem $mkfsopts ${1}.new >/dev/null
	cat mbr ${1}.new > $1
	rm ${1}.new 
	#rm mbr
	tmp=$(mktemp -d)
	mount -o loop,offset=$offset -t $filesystem $1 $tmp
if [ -z $initramfs ];then
	printf "Extracting install archive\n"
	tar -C $tmp -xzpf $2 
	printf "Fixing permissions\n"
	chmod 1777 $tmp/tmp
	chmod 4755 $tmp/bin/busybox
else
	printf "Copying kernel/initramfs\n"
	mkdir $tmp/boot $tmp/dev
	cp $2-kernel $tmp/boot/kernel
	cp $2-initramfs $tmp/boot/initramfs
fi
	umount $tmp
	;;
(*)
	printf Sorry, not ported to the OS "'$ostype'" yet.\n
	exit 1
	;;
esac

printf "Successfully installed.\n"
printf "Be sure $1 is writable for the user which use qemu\n"
exit 0
