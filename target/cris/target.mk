include $(TOPDIR)/mk/kernel-ver.mk
ARCH:=			cris
CPU_ARCH:=		$(ADK_TARGET_CPU_ARCH)
TARGET_OPTIMIZATION:=	-Os -pipe -fno-auto-inc-dec -fno-peephole2
TARGET_CFLAGS_ARCH:=    $(ADK_TARGET_CFLAGS)
