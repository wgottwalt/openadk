include $(TOPDIR)/mk/kernel-ver.mk
ARCH:=			arm
CPU_ARCH:=		arm
TARGET_OPTIMIZATION:=	-Os -pipe
TARGET_CFLAGS_ARCH:=    -march=armv5te -msoft-float
