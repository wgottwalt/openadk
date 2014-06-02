# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

KERNEL_MAKE_OPTS:=	V=1 \
			ARCH="$(ADK_TARGET_ARCH)" \
			CROSS_COMPILE="$(TARGET_CROSS)" \
			CC="$(TARGET_CC)" \
			HOSTCC="${CC_FOR_BUILD}" \
			HOSTCXX="${CXX_FOR_BUILD}" \
			DISABLE_PAX_PLUGINS=y \
			CONFIG_SHELL='${SHELL}'

# regex for relocs needs pcre on Darwin
ifeq ($(ADK_HOST_DARWIN),y)
KERNEL_MAKE_OPTS+=	HOSTCFLAGS='$(CPPFLAGS_FOR_BUILD) ${CFLAGS_FOR_BUILD}' HOSTLDFLAGS='-lpcreposix'
else
KERNEL_MAKE_OPTS+=	HOSTCFLAGS='${CFLAGS_FOR_BUILD}'
endif

KERNEL_MAKE_ENV:=	PATH="${STAGING_HOST_DIR}/usr/bin:$$PATH"
