#!/bin/sh

for libc in glibc musl uclibc; do
	for arch in $(cat toolchain/$libc/arch.lst);do
		make VERBOSE=1 ADK_TARGET_ARCH=$arch ADK_TARGET_SYSTEM=qemu-$arch ADK_TARGET_LIBC=$libc ADK_TARGET_FS=initramfspiggyback defconfig all
		if [ $? -ne 0 ];then
			echo "build failed"
			exit 1
		fi
	done
done
		
