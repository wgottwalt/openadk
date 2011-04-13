include $(TOPDIR)/mk/kernel-ver.mk
ARCH:=			mips
CPU_ARCH:=		mips64el
TARGET_OPTIMIZATION:=	-Os -pipe
TARGET_CFLAGS_ARCH:=    $(ADK_TARGET_CFLAGS) -mabi=64
