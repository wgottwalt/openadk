include $(TOPDIR)/mk/kernel-ver.mk
ARCH:=			powerpc
CPU_ARCH:=		ppc
TARGET_OPTIMIZATION:=	-Os -pipe
TARGET_CFLAGS_ARCH:=	$(ADK_TARGET_CFLAGS)
