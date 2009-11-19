ARCH:=			$(shell uname -m|sed -e "s/i.*86/x86/" -e "s/_64//")
CPU_ARCH:=		$(shell uname -m)
KERNEL_VERSION:=	2.6.31.5
KERNEL_RELEASE:=	1
KERNEL_MD5SUM:=		926bff46d24e2f303e4ee92234e394d8
TARGET_OPTIMIZATION:=	-Os -pipe
