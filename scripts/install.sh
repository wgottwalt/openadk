#!/usr/bin/env bash
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

TOPDIR=$(pwd)

if [ $(id -u) -ne 0 ];then
	printf "Installation is only possible as root\n"
	exit 1
fi

printf "Checking if mke2fs is installed"
mke2fs=$(which mke2fs)

if [ ! -z $mke2fs -a -x $mke2fs ];then
	printf "...okay\n"
else
	printf "...failed\n"
	exit 1
fi

cfgfs=1
quiet=0
while getopts "nq" option
do
	case $option in
		q)
			quiet=1
			;;
		n)
			cfgfs=0
			;;
		*)
			printf "Option not recognized\n"
			exit 1
			;;
	esac
done
shift $(($OPTIND - 1))


if [ -z $1 ];then
	printf "Please give your compact flash or USB device as first parameter\n"
	exit 1
else
	if [ -z $2 ];then
		printf "Please give your install tar archive as second parameter\n"
		exit 2
	fi
	if [ -f $2 ];then
		printf "Installing $2 on $1\n"
	else
		printf "$2 is not a file, Exiting\n"
		exit 1
	fi
	if [ -b $1 ];then
		printf "Using $1 as CF/USB disk for installation\n"
		if [ $quiet -eq 0 ];then
			printf "This will destroy all data on $1, are you sure?\n"
			printf "Type "y" to continue\n"
			read y
		fi
	else
		printf "Sorry $1 is not a block device\n"
		exit 1
	fi
fi
	
if [ $(mount | grep $1| wc -l) -ne 0 ];then
	printf "Block device $1 is in use, please umount first.\n"
	exit 1
fi

case $2 in
	wrap*)
		speed=38400
		;;
	*)
		speed=115200
		;;
esac

rootpart=${1}1
pt=$TOPDIR/bin/tools/pt
# get sector size from block device
maxsector=$(sudo $pt -g $1)
head=16
sect=63
rsize=$(($maxsector / 2))

printf "Creating partition table ...\n"
table=$(mktemp)
# generate partition table
$pt -o $table -s $sect -h $head -p ${rsize}K
# write partition table to block device
dd if=$table of=$1 bs=512 count=1 2> /dev/null
printf "Creating ext2 filesystem ...\n"
$mke2fs -q ${1}1

printf "Extracting install archive ...\n"
tmp=$(mktemp -d)
mount -t ext2 ${rootpart} $tmp
tar -C $tmp -xzpf $2 
printf "Fixing permissions ...\n"
chmod 1777 $tmp/tmp
chmod 4755 $tmp/bin/busybox

printf "Installing GRUB bootloader ...\n"
mkdir -p $tmp/boot/grub
cat << EOF > $tmp/boot/grub/grub.cfg
set default=0
set timeout=1
terminal_output console
terminal_input console

menuentry "GNU/Linux (OpenADK)" {
	insmod ext2
	set root=(hd0,1)
	linux /boot/vmlinuz-adk init=/init
}
EOF
./bin/tools/sbin/grub-install \
	--grub-setup=./bin/tools/sbin/grub-setup \
	--grub-mkimage=./bin/tools/bin/grub-mkimage \
	--grub-mkdevicemap=./bin/tools/sbin/grub-mkdevicemap \
	--no-floppy --root-directory=$tmp $1
umount $tmp
printf "Successfully installed.\n"
rm -rf $tmp
exit 0
