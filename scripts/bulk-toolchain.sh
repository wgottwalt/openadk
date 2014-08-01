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
		DEFAULT="VERBOSE=1 ADK_TARGET_ARCH=$arch ADK_TARGET_SYSTEM=toolchain-$arch ADK_TARGET_LIBC=$libc"
		case $arch in
		mips|microblaze|sh)
			for endian in little big;do
				make $DEFAULT ADK_TARGET_ENDIAN=$endian defconfig all
			done
			;;
		*)
			make $DEFAULT defconfig all
			;;
		esac
		if [ $? -ne 0 ];then
			echo "build failed"
			exit 1
		fi
	done
done
