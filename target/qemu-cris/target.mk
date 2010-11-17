include $(TOPDIR)/mk/kernel-ver.mk
ARCH:=			cris
CPU_ARCH:=		crisv32
TARGET_OPTIMIZATION:=	-Os -pipe
TARGET_CFLAGS_ARCH:=    -march=v32
