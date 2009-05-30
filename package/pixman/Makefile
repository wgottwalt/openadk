# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		pixman
PKG_VERSION:=		0.13.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		837df4a02c61a60a880644393b57faed
PKG_DESCR:=		Pixel manipulation library
PKG_SECTION:=		x11
PKG_SITES:=		http://www.cairographics.org/releases/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,PIXMAN,${PKG_NAME},$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto confprog

post-install:
	${INSTALL_DIR} ${IDIR_PIXMAN}/usr/lib
	${CP} ${WRKINST}/usr/lib/libpixman-1.so* ${IDIR_PIXMAN}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
