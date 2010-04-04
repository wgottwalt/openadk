# arm default is little endian, this target uses EABI
ARCH:=			arm
CPU_ARCH:=		arm
KERNEL_VERSION:=	2.6.33.2
KERNEL_RELEASE:=	1
KERNEL_MD5SUM:=		80c5ff544b0ee4d9b5d8b8b89d4a0ef9
TARGET_OPTIMIZATION:=	-Os -pipe
TARGET_CFLAGS_ARCH:=    -march=armv5te -mtune=arm926ej-s
