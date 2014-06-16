# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

KERNEL_MAKE_OPTS:=	V=1 \
			ARCH="$(ADK_TARGET_KARCH)" \
			CROSS_COMPILE="$(TARGET_CROSS)" \
			CC="$(TARGET_CC)" \
			HOSTCC="${HOST_CC}" \
			HOSTCXX="${HOST_CXX}" \
			DISABLE_PAX_PLUGINS=y \
			CONFIG_SHELL='${SHELL}'

# regex for relocs needs pcre on Darwin
ifeq ($(ADK_HOST_DARWIN),y)
KERNEL_MAKE_OPTS+=	HOSTCFLAGS='$(HOST_CPPFLAGS) ${HOST_CFLAGS}' HOSTLDFLAGS='-lpcreposix'
else
KERNEL_MAKE_OPTS+=	HOSTCFLAGS='${HOST_CFLAGS}'
endif

KERNEL_MAKE_ENV:=	PATH="${STAGING_HOST_DIR}/usr/bin:$$PATH"
