#!/usr/bin/env bash
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

if [ $(id -u) -ne 0 ];then
	printf "Installation is only possible as root\n"
	exit 1
fi

f=0
for tool in parted sfdisk mkfs.ext4 tune2fs;do
	if ! which $tool >/dev/null; then
		echo "Checking if $tool is installed... failed"
		f=1
	fi
done
if [ $f -eq 1 ];then exit 1;fi

if [ -z $1 ];then
	printf "Please give your compact flash device as first parameter\n"
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
		printf "Using $1 as CF disk for installation\n"
		echo "WARNING: This will destroy all data on $1 - type Yes to continue!"
		read y
		if [ "$y" = "Yes" ];then
			env LC_ALL=C sfdisk -l $1 2>&1 |grep 'No medium'
			if [ $? -eq 0 ];then
				echo "No medium found"
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

printf "Create partition and filesystem for rb532\n"
rootpart=${1}2
parted -s $1 mklabel msdos >/dev/null 2>&1
sleep 2
maxsize=$(env LC_ALL=C parted $1 -s unit cyl print |awk '/^Disk/ { print $3 }'|sed -e 's/cyl//')
rootsize=$(($maxsize-2))

parted -s $1 unit cyl mkpart primary ext2 0 2 >/dev/null 2>&1
parted -s $1 unit cyl mkpart primary ext2 2 $rootsize >/dev/null 2>&1
parted -s $1 unit cyl mkpart primary fat32 $rootsize $maxsize >/dev/null 2>&1
parted -s $1 set 1 boot on >/dev/null 2>&1
sfdisk --change-id $1 1 27 >/dev/null 2>&1
sfdisk --change-id $1 3 88 >/dev/null 2>&1
sleep 1
mkfs.ext4 -q -O ^huge_file ${1}2
tune2fs -c 0 -i 0 -m 1 ${rootpart} >/dev/null 2>&1
if [ $? -eq 0 ];then
	printf "Successfully disabled filesystem checks on ${rootpart}\n"
else	
	printf "Disabling filesystem checks failed, Exiting.\n"
	exit 1
fi	

tmp=$(mktemp -d)
mount -t ext4 ${rootpart} $tmp
printf "Extracting install archive\n"
tar -C $tmp -xzpf $2 
dd if=$tmp/boot/kernel of=${1}1 bs=2048 >/dev/null 2>&1
if [ $? -eq 0 ];then
	printf "Installation of kernel successful.\n"
	rm $tmp/boot/kernel
else
	printf "Installation of kernel failed.\n"
fi
printf "Fixing permissions\n"
chmod 1777 $tmp/tmp
chmod 4755 $tmp/bin/busybox
umount $tmp
printf "Successfully installed.\n"
exit 0
