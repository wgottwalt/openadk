# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

KERNEL_MAKE_OPTS:=	-C "${LINUX_DIR}" V=1
ifneq ($(ADK_NATIVE),y)
KERNEL_MAKE_OPTS+=	CROSS_COMPILE="$(TARGET_CROSS)" ARCH=$(ARCH) CC="$(TARGET_CC)" HOSTCC="${HOSTCC}"
endif
