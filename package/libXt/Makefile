# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXt
PKG_VERSION:=		1.1.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		7a80ed7aba06668b12ebd0910318a1f1
PKG_DESCR:=		X Toolkit Intrinsics libraries
PKG_SECTION:=		x11/libs
PKG_DEPENDS:=		libsm libice libuuid libx11 libxau libxdmcp libxcb
PKG_BUILDDEP:=		libSM libX11 kbproto
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_SUBPKGS:=		LIBXT LIBXT_DEV
PKGSD_LIBXT_DEV:=	X Toolkit Intrinsics headers
PKGSC_LIBXT_DEV:=	x11/devel

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXT,libxt,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBXT_DEV,libxt-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBXT_DEV},${PKGSC_LIBXT_DEV}))

TARGET_CFLAGS:=         $(filter-out -flto,$(TARGET_CFLAGS))
CONFIGURE_ARGS+=	--disable-malloc0returnsnull

libxt-install:
	${INSTALL_DIR} ${IDIR_LIBXT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXt.so* ${IDIR_LIBXT}/usr/lib

libxt-dev-install:
	${INSTALL_DIR} ${IDIR_LIBXT_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_LIBXT_DEV}/usr/include
	${INSTALL_DIR} ${IDIR_LIBXT_DEV}/usr/lib/pkgconfig
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/*.pc \
		${IDIR_LIBXT_DEV}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
