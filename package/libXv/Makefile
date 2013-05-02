# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXv
PKG_VERSION:=		1.0.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		066145bab1f182476589af0ee9c18152
PKG_DESCR:=		X11 Xvideo extensions library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		libX11 videoproto libXext
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_SUBPKGS:=		LIBXV LIBXV_DEV
PKGSD_LIBXV_DEV:=	X11 Xvideo extensions headers
PKGSC_LIBXV_DEV:=	x11/devel

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXV,libxv,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBXV_DEV,libxv-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBXV_DEV},${PKGSC_LIBXV_DEV}))

CONFIGURE_ARGS+=	--disable-malloc0returnsnull

libxv-install:
	${INSTALL_DIR} ${IDIR_LIBXV}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXv.so* ${IDIR_LIBXV}/usr/lib/

libxv-dev-install:
	${INSTALL_DIR} ${IDIR_LIBXV_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* \
		${IDIR_LIBXV_DEV}/usr/include
	${INSTALL_DIR} ${IDIR_LIBXV_DEV}/usr/lib/pkgconfig
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/*.pc \
		${IDIR_LIBXV_DEV}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
