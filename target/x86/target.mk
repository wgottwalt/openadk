include $(TOPDIR)/mk/kernel-ver.mk
ARCH:=			x86
CPU_ARCH:=		$(strip $(subst ",, $(ADK_TARGET_CPU_ARCH)))
TARGET_OPTIMIZATION:=	-Os -pipe
TARGET_CFLAGS_ARCH:=	$(ADK_TARGET_CFLAGS)
