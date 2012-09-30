# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXrender
PKG_VERSION:=		0.9.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		5dba047cf278e5ac77cd0f19f7195fb9
PKG_DESCR:=		X11 rendering library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		renderproto libX11
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_SUBPKGS:=		LIBXRENDER LIBXRENDER_DEV
PKGSD_LIBXRENDER_DEV:=	X11 rendering headers
PKGSC_LIBXRENDER_DEV:=	x11/devel

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXRENDER,libxrender,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,LIBXRENDER_DEV,libxrender-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBXRENDER_DEV},${PKGSC_LIBXRENDER_DEV},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-malloc0returnsnull

libxrender-install:
	${INSTALL_DIR} ${IDIR_LIBXRENDER}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXrender.so* ${IDIR_LIBXRENDER}/usr/lib

libxrender-dev-install:
	${INSTALL_DIR} ${IDIR_LIBXRENDER_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_LIBXRENDER_DEV}/usr/include
	${INSTALL_DIR} ${IDIR_LIBXRENDER_DEV}/usr/lib/pkgconfig
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/xrender.pc \
		${IDIR_LIBXRENDER_DEV}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
