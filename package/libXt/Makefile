# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXt
PKG_VERSION:=		1.0.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		28f627c7a5ca08c2413ce91d21c177d8
PKG_DESCR:=		X Toolkit Intrinsics
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		libSM
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXT,libxt,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

XAKE_FLAGS+=		HOSTCPPFLAGS=-I${STAGING_TARGET_DIR}/usr/include/xproto
CONFIGURE_ARGS+=	--disable-malloc0returnsnull \
			--disable-install-makestrs

post-install:
	${INSTALL_DIR} ${IDIR_LIBXT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXt.so* ${IDIR_LIBXT}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
