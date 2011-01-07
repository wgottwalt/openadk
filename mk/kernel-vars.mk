# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

KERNEL_MAKE_OPTS:=	-C "${LINUX_DIR}" V=1
ifneq ($(ADK_NATIVE),y)
KERNEL_MAKE_OPTS+=	CROSS_COMPILE="$(TARGET_CROSS)" ARCH=$(ARCH) \
			CC="$(TARGET_CC)" HOSTCC="${HOSTCC}" \
			HOSTCFLAGS='${HOSTCFLAGS}'
endif

ifeq (${ADK_TARGET_SYSTEM_LINKSYS_WRT54G},y)
ADK_KCPPFLAGS+=		-DBCM47XX_OVERRIDE_FLASHSIZE=0x400000
endif

KERNEL_MAKE_ENV+=	KCPPFLAGS='${ADK_KCPPFLAGS}'
