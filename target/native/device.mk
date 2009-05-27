ARCH:=			$(shell uname -m|sed -e "s/i.*86/x86/")
CPU_ARCH:=		$(shell uname -m)
KERNEL_VERSION:=	2.6.29.1
KERNEL_RELEASE:=	1
KERNEL_MD5SUM:=		4ada43caecb08fe2af71b416b6f586d8
TARGET_OPTIMIZATION:=	-Os -pipe
