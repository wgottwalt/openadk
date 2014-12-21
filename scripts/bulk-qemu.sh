#!/bin/sh

if [ ! -z $1 ];then
	c=$1
else
	c="uclibc-ng glibc musl uclibc"
fi

for libc in $c; do
	for arch in $(cat toolchain/$libc/arch.lst);do
		echo "Cleaning old stuff"
		make cleandir
		echo "Building $libc for $arch"
		DEFAULT="ADK_VERBOSE=1 ADK_APPLIANCE=new ADK_TARGET_ARCH=$arch ADK_TARGET_SYSTEM=qemu-$arch ADK_TARGET_LIBC=$libc ADK_TARGET_FS=initramfspiggyback"
		case $arch in
		mips|microblaze)
			for endian in little big;do
				make $DEFAULT ADK_TARGET_ENDIAN=$endian defconfig all
				cp -a firmware firmware.$arch.$endian
			done
			;;
		*)
			make $DEFAULT defconfig all
			cp -a firmware firmware.$arch
			;;
		esac
		if [ $? -ne 0 ];then
			echo "build failed"
			exit 1
		fi
		make cleandir
	done
done
