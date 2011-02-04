include $(TOPDIR)/mk/kernel-ver.mk
ARCH:=			cris
CPU_ARCH:=		cris
TARGET_OPTIMIZATION:=	-Os -pipe -fno-auto-inc-dec -fno-peephole2
TARGET_CFLAGS_ARCH:=    -march=v10
