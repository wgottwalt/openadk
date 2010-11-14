#!/usr/bin/env bash
if [ $(id -u) -ne 0 ];then
	printf "Installation is only possible as root\n"
	exit 1
fi

printf "Checking if sfdisk is installed"
sfdisk=$(which sfdisk)

if [ ! -z $sfdisk -a -x $sfdisk ];then
	printf "...okay\n"
else
	printf "...failed\n"
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

printf "Checking if tune2fs is installed"
tune2fs=$(which tune2fs)

if [ ! -z $tune2fs -a -x $tune2fs ];then
	printf "...okay\n"
else
	printf "...failed\n"
	exit 1
fi

cfgfs=1
rb532=0
while getopts "nr" option
do
	case $option in
		n)
			cfgfs=0
			;;
		r)
			rb532=1
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
	if [ $rb532 -eq 1 ];then
		if [ -z $3 ];then
			printf "Please give the kernel as third parameter\n"
			exit 2
		fi
		if [ -f $3 ];then
			printf "Installing $3 on $1\n"
		else
			printf "$3 is not a file, Exiting\n"
			exit 1
		fi
	fi
	if [ -b $1 ];then
		printf "Using $1 as CF/USB disk for installation\n"
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

case $2 in
	wrap*)
		speed=38400
		;;
	*)
		speed=115200
		;;
esac

if [ $rb532 -ne 0 ];then
	printf "Create partition and filesystem for rb532\n"
	rootpart=${1}2
	$parted -s $1 mklabel msdos
	sleep 2
	maxsize=$(env LC_ALL=C $parted $1 -s unit cyl print |awk '/^Disk/ { print $3 }'|sed -e 's/cyl//')
	rootsize=$(($maxsize-2))

	$parted -s $1 unit cyl mkpart primary ext2 0 1
	$parted -s $1 unit cyl mkpart primary ext2 1 $rootsize
	$parted -s $1 unit cyl mkpart primary fat32 $rootsize $maxsize
	$parted -s $1 set 1 boot on
	$sfdisk --change-id $1 1 27
	$sfdisk --change-id $1 3 88
	sleep 2
	$mke2fs ${1}2
	sync
	dd if=$3 of=${1}1 bs=2048
	sync
else
	rootpart=${1}1
	if [ $cfgfs -eq 0 ];then
		printf "Create partition and filesystem without cfgfs\n"
$sfdisk $1 << EOF
,,L
;
;
;
y
EOF
		$mke2fs ${rootpart}
	else
		printf "Create partition and filesystem with cfgfs\n"
		$parted -s $1 mklabel msdos
		sleep 2
		maxsize=$(env LC_ALL=C $parted $1 -s unit cyl print |awk '/^Disk/ { print $3 }'|sed -e 's/cyl//')
		rootsize=$(($maxsize-2))

		$parted -s $1 unit cyl mkpart primary ext2 0 $rootsize
		$parted -s $1 unit cyl mkpart primary fat32 $rootsize $maxsize
		$parted -s $1 set 1 boot on
		$sfdisk --change-id $1 2 88
		$mke2fs ${1}1
	fi
fi

if [ $? -eq 0 ];then
	printf "Successfully created partition ${rootpart}\n"
else
	printf "Partition creation failed, Exiting.\n"
	exit 1
fi

sleep 2
$tune2fs -c 0 -i 0 -m 1 ${rootpart} >/dev/null
if [ $? -eq 0 ];then
	printf "Successfully disabled filesystem checks on ${rootpart}\n"
else	
	printf "Disabling filesystem checks failed, Exiting.\n"
	exit 1
fi	

tmp=$(mktemp -d)
mount -t ext2 ${rootpart} $tmp
printf "Extracting install archive\n"
tar -C $tmp -xzpf $2 
printf "Fixing permissions\n"
chmod 1777 $tmp/tmp
chmod 4755 $tmp/bin/busybox

if [ $rb532 -eq 0 ];then
	printf "Installing GRUB bootloader\n"
	mkdir -p $tmp/boot/grub
	mount -o bind /dev $tmp/dev
	chroot $tmp mount -t proc /proc /proc
	chroot $tmp mount -t sysfs /sys /sys
cat << EOF > $tmp/boot/grub/grub.cfg
set default=0
set timeout=1
serial --unit=0 --speed=$speed
terminal_output serial 
terminal_input serial 

menuentry "GNU/Linux (OpenADK)" {
	insmod ext2
	set root=(hd0,1)
	linux /boot/vmlinuz-adk ro init=/init console=ttyS0,$speed console=tty0 panic=10
}
EOF
	chroot $tmp grub-install $1
	umount $tmp/proc
	umount $tmp/sys
	umount $tmp/dev
fi

umount $tmp

printf "Successfully installed.\n"
exit 0
