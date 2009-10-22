ARCH:=			$(shell uname -m|sed -e "s/i.*86/x86/" -e "s/_64//")
CPU_ARCH:=		$(shell uname -m)
KERNEL_VERSION:=	2.6.31.4
KERNEL_RELEASE:=	1
KERNEL_MD5SUM:=		be9c3a697a54ac099c910d068ff0dc03
TARGET_OPTIMIZATION:=	-Os -pipe
