ARCH:=			$(shell uname -m|sed -e "s/i.*86/x86/" -e "s/_64//")
CPU_ARCH:=		$(shell uname -m)
KERNEL_VERSION:=	2.6.32
KERNEL_RELEASE:=	1
KERNEL_MD5SUM:=		260551284ac224c3a43c4adac7df4879
TARGET_OPTIMIZATION:=	-Os -pipe
