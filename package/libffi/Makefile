# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libffi
PKG_VERSION:=		3.0.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		8994a7e0e8baeedf63e3d0d94d75ac68
MASTER_SITES:=		ftp://sourceware.org/pub/libffi/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBFFI,libffi,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE=	autotool gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_LIBFFI}/usr/lib
	${CP} ${WRKINST}/usr/lib/libffi.so.* ${IDIR_LIBFFI}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
