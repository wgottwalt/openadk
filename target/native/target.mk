ARCH:=			$(shell uname -m|sed -e "s/i.*86/x86/" -e "s/_64//")
CPU_ARCH:=		$(shell uname -m)
KERNEL_VERSION:=	2.6.33
KERNEL_RELEASE:=	1
KERNEL_MD5SUM:=		c3883760b18d50e8d78819c54d579b00
TARGET_OPTIMIZATION:=	-Os -pipe
