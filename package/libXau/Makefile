# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXau
PKG_VERSION:=		1.0.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		ee1ee30c00d1e033cfc0237a349e1219
PKG_DESCR:=		X11 authorisation library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		xproto
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_SUBPKGS:=		LIBXAU LIBXAU_DEV
PKGSD_LIBXAU_DEV:=	Xauth headers
PKGSC_LIBXAU_DEV:=	x11/devel

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXAU,libxau,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,LIBXAU_DEV,libxau-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBXAU_DEV},${PKGSC_LIBXAU_DEV},${PKG_OPTS}))

post-install:
	${INSTALL_DIR} ${IDIR_LIBXAU}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXau.so* ${IDIR_LIBXAU}/usr/lib/

libxau-dev-install:
	${INSTALL_DIR} ${IDIR_LIBXAU_DEV}/usr/include/X11/
	${CP} ${WRKINST}/usr/include/X11/* \
		${IDIR_LIBXAU_DEV}/usr/include/X11/
	${INSTALL_DIR} ${IDIR_LIBXAU_DEV}/usr/lib/pkgconfig
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/xau.pc \
		${IDIR_LIBXAU_DEV}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
