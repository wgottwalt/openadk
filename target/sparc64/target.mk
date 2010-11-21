include $(TOPDIR)/mk/kernel-ver.mk
ARCH:=			sparc
CPU_ARCH:=		sparc64
TARGET_OPTIMIZATION:=	-Os -pipe
TARGET_CFLAGS_ARCH:=    $(ADK_TARGET_CFLAGS)
