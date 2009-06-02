# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXmu
PKG_VERSION:=		1.0.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		48b432e84035c664ece80a33695d5254
PKG_DESCR:=		a set of miscellaneous utility convenience functions for X libraries
PKG_SECTION:=		x11
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXMU,libxmu,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu
#CONFIGURE_ARGS+=	--disable-malloc0returnsnull
BUILD_STYLE=		auto
INSTALL_STYLE=		auto confprog

post-install:
	${INSTALL_DIR} ${IDIR_LIBXMU}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXmu.so* ${IDIR_LIBXMU}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
