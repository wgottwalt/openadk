# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libX11
PKG_VERSION:=		1.3.2
PKG_RELEASE:=		3
PKG_MD5SUM:=		b68aebbfcac1174c4c95d260e9369766
PKG_DESCR:=		X11 client-side library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		xproto xextproto xtrans libXdmcp libXau 
PKG_BUILDDEP+=		xcmiscproto bigreqsproto kbproto inputproto
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_SUBPKGS:=		LIBX11 LIBX11_DEV
PKGSD_LIBX11_DEV:=	X11 headers
PKGSC_LIBX11_DEV:=	devel

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBX11,libx11,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,LIBX11_DEV,libx11-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBX11_DEV},${PKGSC_LIBX11_DEV},${PKG_OPTS}))

XAKE_FLAGS+=		HOSTCPPFLAGS=-I${STAGING_TARGET_DIR}/usr/include/xproto
CONFIGURE_ARGS+=	--enable-xlocale \
			--disable-specs \
			--disable-xf86bigfont \
			--disable-malloc0returnsnull \
			--without-xcb

post-install:
	${INSTALL_DIR} ${IDIR_LIBX11}/usr/lib ${IDIR_LIBX11}/usr/share/X11
	${CP} ${WRKINST}/usr/lib/libX11.so* ${IDIR_LIBX11}/usr/lib/
	${CP} ${WRKINST}/usr/share/X11/XKeysymDB ${IDIR_LIBX11}/usr/share/X11

libx11-dev-install:
	${INSTALL_DIR} ${IDIR_LIBX11_DEV}/usr/include/X11
	${CP} ${WRKINST}/usr/include/X11/*.h ${IDIR_LIBX11_DEV}/usr/include/X11

include ${TOPDIR}/mk/pkg-bottom.mk
