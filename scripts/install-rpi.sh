#!/usr/bin/env bash
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

if [ $(id -u) -ne 0 ];then
	echo "Installation is only possible as root"
	exit 1
fi

for tool in parted sfdisk mkfs.vfat mkfs.ext4;do
	if ! which $tool >/dev/null; then
		echo "Checking if $tool is installed... failed"
		f=1
	fi
done
[[ $f -eq 1 ]] && exit 1

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
	if [ -b $1 ];then
		echo "Using $1 as SD card disk for installation"
		echo "WARNING: This will destroy all data on $1 - type Yes to continue!"
		read y
		if [ "$y" = "Yes" ];then
			$sfdisk -l $1 2>&1 |grep 'No medium'
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

echo "Wiping existing partitions"
dd if=/dev/zero of=$1 bs=512 count=1 >/dev/null 2>&1
sync

echo "Create partition and filesystem for raspberry pi"
rootpart=${1}2
parted -s $1 mklabel msdos
sleep 2
maxsize=$(env LC_ALL=C parted $1 -s unit cyl print |awk '/^Disk/ { print $3 }'|sed -e 's/cyl//')
rootsize=$(($maxsize-34))
datasize=$(($maxsize-2))

parted -s $1 unit cyl mkpart primary fat32 -- 0 16
parted -s $1 unit cyl mkpart primary ext2 -- 16 $rootsize
parted -s $1 unit cyl mkpart primary ext2 $rootsize $datasize
parted -s $1 unit cyl mkpart primary fat32 $datasize $maxsize
parted -s $1 set 1 boot on
sfdisk --change-id $1 4 88
sleep 2
mkfs.vfat ${1}1
mkfs.ext4 ${1}2
mkfs.ext4 ${1}3
sync
sleep 2

tmp=$(mktemp -d)
mount -t ext4 ${rootpart} $tmp
mkdir $tmp/boot
mkdir $tmp/data
mount -t ext4 ${1}3 $tmp/data
mkdir $tmp/data/mpd $tmp/data/xbmc
mount -t vfat ${1}1 $tmp/boot
sleep 1
echo "Extracting install archive"
tar -C $tmp -xzpf $2 
echo "Fixing permissions"
chmod 1777 $tmp/tmp
chmod 4755 $tmp/bin/busybox
echo "/dev/mmcblk0p3	/data	ext4	rw	0	0" >>$tmp/etc/fstab
umount $tmp/data
umount $tmp/boot
umount $tmp
echo "Successfully installed."
exit 0
