# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXt
PKG_VERSION:=		1.0.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		666305c8a2b825b276b3412d8c0d2273
MASTER_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXT,libxt,$(PKG_VERSION)-$(PKG_RELEASE)))

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--disable-malloc0returnsnull \
			--disable-install-makestrs
BUILD_STYLE=		auto
INSTALL_STYLE=		auto confprog

post-install:
	${INSTALL_DIR} ${IDIR_LIBXT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXt.so* ${IDIR_LIBXT}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
