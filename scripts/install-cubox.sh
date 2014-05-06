#!/usr/bin/env bash
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

if [ $(id -u) -ne 0 ];then
	echo "Installation is only possible as root"
	exit 1
fi

f=0
for tool in parted sfdisk mkfs.ext4;do
	if ! which $tool >/dev/null; then
		echo "Checking if $tool is installed... failed"
		f=1
	fi
done
if [ $f -eq 1 ];then exit 1;fi

datadir=0
keep=0
while getopts "dk" ch; do
	case $ch in
		d)
			datadir=1
			;;
		k)
			keep=1
			;;
	esac
done
shift $((OPTIND - 1))

if [ -z $1 ];then
	echo "Please give your SD card device as first parameter"
	exit 1
else
	if [ -z $2 ];then
		echo "Please give your install tar archive as second parameter"
		exit 1
	fi
	if [ -f $2 ];then
		echo "Installing $2 on $1"
	else
		echo "$2 is not a file, exiting"
		exit 1
	fi
	if [ -z $3 ];then
		echo "Please give your firmware directory as third parameter"
		exit 1
	fi
	if [ ! -d $3 ];then
		echo "$3 is not a directory, exiting"
		exit 1
	fi
	if [ -b $1 ];then
		echo "Using $1 as SD card disk for installation"
		echo "WARNING: This will destroy all data on $1 - type Yes to continue!"
		read y
		if [ "$y" = "Yes" ];then
			env LC_ALL=C sfdisk -l $1 2>&1 |grep 'No medium'
			if [ $? -eq 0 ];then
				echo "No medium found"
				exit 1
			else
				echo "Starting with installation"
			fi
		else
			echo "Exiting."
			exit 1
		fi
	else
		echo "Sorry $1 is not a block device"
		exit 1
	fi
fi

if [ $(mount | grep $1| wc -l) -ne 0 ];then
	echo "Block device $1 is in use, please umount first"
	exit 1
fi

maxsize=$(env LC_ALL=C parted $1 -s unit s print |awk '/^Disk/ { print $3 }'|sed -e 's/s//')
maxsize=$(($maxsize-1))
rootsize=$(($maxsize-32768))
rootsizeend=$(($rootsize+1))

echo "Install bootloader for cubox-i"
parted -s $1 mklabel msdos >/dev/null 2>&1
dd if=${3}/SPL of=${1} bs=1K seek=1 >/dev/null 2>&1
dd if=${3}/u-boot.img of=${1} bs=1K seek=42 >/dev/null 2>&1
parted -a optimal -s $1 unit s mkpart primary ext2 -- 2048 $rootsize >/dev/null 2>&1
parted -a optimal -s $1 unit s mkpart primary fat32 $rootsizeend $maxsize >/dev/null 2>&1
sfdisk --change-id $1 2 88 >/dev/null 2>&1

echo "Creating filesystem"
mkfs.ext4 -q -O ^huge_file ${1}1
sync

tmp=$(mktemp -d)
mount -t ext4 ${1}1 $tmp

echo "Extracting install archive"
tar -C $tmp -xzpf $2 
echo "Fixing permissions"
chmod 1777 $tmp/tmp
chmod 4755 $tmp/bin/busybox
cp ${3}/*.dtb $tmp/boot/
umount $tmp
echo "Successfully installed."
exit 0
