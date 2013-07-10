#!/usr/bin/env bash
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

if [ $(id -u) -ne 0 ];then
	printf "Installation is only possible as root\n"
	exit 1
fi

printf "Checking if parted is installed"
parted=$(which parted)

if [ ! -z $parted -a -x $parted ];then
	printf "...okay\n"
else
	printf "...failed\n"
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

if [ -z $1 ];then
	printf "Please give your SD card device as first parameter\n"
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
		printf "Using $1 as SD card disk for installation\n"
		printf "This will destroy all data on $1, are you sure?\n"
		printf "Type "y" to continue\n"
		read y
		if [ "$y" = "y" ];then
			$sfdisk -l $1 2>&1 |grep 'No medium'
			if [ $? -eq 0 ];then
				exit 1
			else
				printf "Starting with installation\n"
			fi
		else
			printf "Exiting.\n"
			exit 1
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


if [ $($sfdisk -l $1 2>/dev/null|grep Empty|wc -l) -ne 4 ];then
	printf "Partitions already exist, should I wipe them?\n"
	printf "Type y to continue\n"
	read y
	if [ $y = "y" ];then
		printf "Wiping existing partitions\n"
		dd if=/dev/zero of=$1 bs=512 count=1 >/dev/null 2>&1
	else
		printf "Exiting.\n"
		exit 1
	fi
fi

printf "Create partition and filesystem for raspberry pi\n"
rootpart=${1}2
$parted -s $1 mklabel msdos
sleep 2
maxsize=$(env LC_ALL=C $parted $1 -s unit cyl print |awk '/^Disk/ { print $3 }'|sed -e 's/cyl//')
rootsize=$(($maxsize-2))

$parted -s $1 unit cyl mkpart primary fat32 -- 0 16
$parted -s $1 unit cyl mkpart primary ext2 -- 16 -2
#$parted -s $1 unit cyl mkpart primary fat32 $rootsize $maxsize
$parted -s $1 set 1 boot on
#$sfdisk --change-id $1 1 27
#$sfdisk --change-id $1 3 88
sleep 2
mkfs.vfat ${1}1
$mke2fs ${1}2
sync
sleep 2

tmp=$(mktemp -d)
mount -t ext2 ${rootpart} $tmp
mkdir $tmp/boot
mount -t vfat ${1}1 $tmp/boot
sleep 2
printf "Extracting install archive\n"
tar -C $tmp -xzpf $2 
printf "Fixing permissions\n"
chmod 1777 $tmp/tmp
chmod 4755 $tmp/bin/busybox
umount $tmp/boot
umount $tmp
printf "Successfully installed.\n"
exit 0
