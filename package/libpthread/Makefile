# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

ifeq ($(ADK_TARGET_LIB_GLIBC),y)
include ${TOPDIR}/toolchain/glibc/Makefile.inc
endif
ifeq ($(ADK_TARGET_LIB_EGLIBC),y)
include ${TOPDIR}/toolchain/eglibc/Makefile.inc
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC),y)
include ${TOPDIR}/toolchain/uClibc/Makefile.inc
endif
ifeq ($(ADK_NATIVE),y)
PKG_VERSION:=		1.0
PKG_RELEASE:=		1
endif

PKG_NAME:=		libpthread
PKG_DESCR:=		POSIX threading library
PKG_SECTION:=		libs
PKG_OPTS:=		noremove

NO_DISTFILES:=		1

PKG_SUBPKGS:=		LIBPTHREAD LIBPTHREAD_DEV
PKGSC_LIBPTHREAD_DEV:=	devel

ifeq ($(ADK_STATIC),y)
PKG_OPTS+=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBPTHREAD,libpthread,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,LIBPTHREAD_DEV,libpthread-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKGSC_LIBPTHREAD_DEV},${PKG_OPTS}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

libpthread-install:
ifeq ($(ADK_NATIVE),)
	${INSTALL_DIR} ${IDIR_LIBPTHREAD}/lib
	${CP} ${STAGING_TARGET_DIR}/lib/libpthread*.so* ${IDIR_LIBPTHREAD}/lib
	(cd ${STAGING_TARGET_DIR}/lib && ln -sf libpthread.so.0 libpthread.so)
endif

libpthread-dev-install:
ifeq ($(ADK_NATIVE),)
	${INSTALL_DIR} ${IDIR_LIBPTHREAD_DEV}/usr/lib
	-${CP} ./files/libpthread.so.$(ARCH) ${IDIR_LIBPTHREAD_DEV}/usr/lib/libpthread.so
	-${CP} ${STAGING_TARGET_DIR}/usr/lib/libpthread_nonshared.a ${IDIR_LIBPTHREAD_DEV}/usr/lib
endif

include ${TOPDIR}/mk/pkg-bottom.mk
