# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXrandr
PKG_VERSION:=		1.3.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		edacf83655be2e48348b626c0dc454f3
PKG_DESCR:=		Xrandr library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		randrproto
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_SUBPKGS:=		LIBXRANDR LIBXRANDR_DEV
PKGSD_LIBXRANDR_DEV:=	Xrandr headers
PKGSC_LIBXRANDR_DEV:=	x11/devel

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXRANDR,libxrandr,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBXRANDR_DEV,libxrandr-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBXRANDR_DEV},${PKGSC_LIBXRANDR_DEV}))

CONFIGURE_ARGS+= 	--disable-malloc0returnsnull

libxrandr-install:
	${INSTALL_DIR} ${IDIR_LIBXRANDR}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXrandr.so* ${IDIR_LIBXRANDR}/usr/lib

libxrandr-dev-install:
	${INSTALL_DIR} ${IDIR_LIBXRANDR_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_LIBXRANDR_DEV}/usr/include
	${INSTALL_DIR} ${IDIR_LIBXRANDR_DEV}/usr/lib/pkgconfig
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/*.pc \
		${IDIR_LIBXRANDR_DEV}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
