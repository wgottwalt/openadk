# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXinerama
PKG_VERSION:=		1.1.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		29a813b3850d499a3524a8d5d5ecb099
PKG_DESCR:=		Xinerama library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		xineramaproto
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_SUBPKGS:=		LIBXINERAMA LIBXINERAMA_DEV
PKGSD_LIBXINERAMA_DEV:=	Xinerama headers
PKGSC_LIBXINERAMA_DEV:=	x11/devel

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXINERAMA,libxinerama,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBXINERAMA_DEV,libxinerama-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBXINERAMA_DEV},${PKGSC_LIBXINERAMA_DEV}))

CONFIGURE_ARGS+= 	--disable-malloc0returnsnull

libxinerama-install:
	${INSTALL_DIR} ${IDIR_LIBXINERAMA}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXinerama.so* ${IDIR_LIBXINERAMA}/usr/lib

libxinerama-dev-install:
	${INSTALL_DIR} ${IDIR_LIBXINERAMA_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_LIBXINERAMA_DEV}/usr/include
	${INSTALL_DIR} ${IDIR_LIBXINERAMA_DEV}/usr/lib/pkgconfig
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/*.pc \
		${IDIR_LIBXINERAMA_DEV}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
