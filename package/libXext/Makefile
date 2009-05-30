# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXext
PKG_VERSION:=		1.0.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		b7749174f9b3c3227bcbabc9ffb7d1a9
PKG_DESCR:=		X Window System client interface to several extensions to the X protocol
PKG_SECTION:=		x11
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXEXT,libxext,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--disable-malloc0returnsnull
BUILD_STYLE=		auto
INSTALL_STYLE=		auto confprog

post-install:
	${INSTALL_DIR} ${IDIR_LIBXEXT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXext.so* ${IDIR_LIBXEXT}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
