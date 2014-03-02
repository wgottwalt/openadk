# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk
ifeq ($(ADK_TARGET_LIB_GLIBC),y)
include ${TOPDIR}/toolchain/glibc/Makefile.inc
else
ifeq ($(ADK_TARGET_LIB_MUSL),y)
include ${TOPDIR}/toolchain/musl/Makefile.inc
else
include ${TOPDIR}/toolchain/uClibc/Makefile.inc
endif
endif

PKG_NAME:=		libstdcxx
PKG_DESCR:=		C++ support library
PKG_SECTION:=		libs
PKG_NEED_CXX:=		1
NO_DISTFILES:=		1

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBSTDCXX,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-install:
	${INSTALL_DIR} ${IDIR_LIBSTDCXX}/usr/${ADK_TARGET_LIBC_PATH}
ifeq ($(ADK_NATIVE),y)
	$(CP) /usr/lib/libstdc++.so* ${IDIR_LIBSTDCXX}/usr/lib
else
	$(CP) ${STAGING_TARGET_DIR}/${ADK_TARGET_LIBC_PATH}/libstdc++.so* ${IDIR_LIBSTDCXX}/usr/${ADK_TARGET_LIBC_PATH}
	-@rm ${IDIR_LIBSTDCXX}/usr/${ADK_TARGET_LIBC_PATH}/libstdc++.so.*-gdb.py
endif

include ${TOPDIR}/mk/pkg-bottom.mk
