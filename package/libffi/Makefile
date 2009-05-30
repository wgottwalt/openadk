# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libffi
PKG_VERSION:=		3.0.8
PKG_RELEASE:=		1
PKG_MD5SUM:=		188a4f79fdac2310044b44b7d3918ef9
PKG_DESCR:=		Foreign Function Interface library
PKG_SECTION:=		libs
PKG_URL:=		http://sourceware.org/libffi
PKG_SITES:=		ftp://sourceware.org/pub/libffi/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBFFI,libffi,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	autotool gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_LIBFFI}/usr/lib
	${CP} ${WRKINST}/usr/lib/libffi.so.* ${IDIR_LIBFFI}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
