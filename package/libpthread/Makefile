# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

ifeq ($(ADK_TARGET_LIB_GLIBC),y)
include ${TOPDIR}/toolchain/glibc/Makefile.inc
else
include ${TOPDIR}/toolchain/uClibc/Makefile.inc
endif

PKG_NAME:=		libpthread
NO_DISTFILES:=		1

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBPTHREAD,libpthread,${PKG_VERSION}-${PKG_RELEASE}))

do-install:
	${INSTALL_DIR} ${IDIR_LIBPTHREAD}/lib
	${CP} ${STAGING_DIR}/lib/libpthread*.so* ${IDIR_LIBPTHREAD}/lib

include ${TOPDIR}/mk/pkg-bottom.mk
