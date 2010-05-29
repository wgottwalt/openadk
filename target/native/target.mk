ARCH:=			$(shell uname -m|sed -e "s/i.*86/x86/" -e "s/_\?64//")
CPU_ARCH:=		$(shell uname -m)
KERNEL_VERSION:=	2.6.34
KERNEL_RELEASE:=	1
KERNEL_MD5SUM:=		10eebcb0178fb4540e2165bfd7efc7ad
TARGET_OPTIMIZATION:=	-Os -pipe
