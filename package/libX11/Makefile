# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libX11
PKG_VERSION:=		1.4.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		3cb91f1f20884661b2b8aae03853441d
PKG_DESCR:=		X11 client-side library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		xproto xextproto xtrans libXdmcp libXau xcb-proto
PKG_BUILDDEP+=		xcmiscproto bigreqsproto kbproto inputproto libxcb
PKG_DEPENDS:=		libxdmcp libxcb libxau
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_SUBPKGS:=		LIBX11 LIBX11_DEV
PKGSD_LIBX11_DEV:=	X11 headers
PKGSC_LIBX11_DEV:=	x11/devel

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBX11,libx11,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,LIBX11_DEV,libx11-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBX11_DEV},${PKGSC_LIBX11_DEV},${PKG_OPTS}))

CONFIGURE_ARGS+=	--enable-xlocale \
			--disable-specs \
			--disable-xf86bigfont \
			--disable-malloc0returnsnull

libx11-install:
	${INSTALL_DIR} ${IDIR_LIBX11}/usr/lib ${IDIR_LIBX11}/usr/share/X11
	${CP} ${WRKINST}/usr/lib/libX11.so* ${IDIR_LIBX11}/usr/lib/
	${CP} ${WRKINST}/usr/lib/libX11-xcb* ${IDIR_LIBX11}/usr/lib/
	${CP} ${WRKINST}/usr/share/X11/XErrorDB ${IDIR_LIBX11}/usr/share/X11
ifeq ($(ADK_LOCALES),y)
	${CP} ${WRKINST}/usr/share/X11/locale ${IDIR_LIBX11}/usr/share/X11
endif

libx11-dev-install:
	${INSTALL_DIR} ${IDIR_LIBX11_DEV}/usr/include/X11
	${CP} ${WRKINST}/usr/include/X11/*.h ${IDIR_LIBX11_DEV}/usr/include/X11
	${INSTALL_DIR} ${IDIR_LIBX11_DEV}/usr/lib/pkgconfig
	${CP} ${WRKINST}/usr/lib/pkgconfig/*.pc \
		${IDIR_LIBX11_DEV}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
