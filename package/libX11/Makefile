# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libX11
PKG_VERSION:=		1.6.3
PKG_RELEASE:=		1
PKG_HASH:=		0b03b9d22f4c9e59b4ba498f294e297f013cae27050dfa0f3496640200db5376
PKG_DESCR:=		x11 client-side library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		libX11-host xproto xextproto xtrans libXdmcp libXau xcb-proto
PKG_BUILDDEP+=		xcmiscproto bigreqsproto kbproto inputproto libxcb
HOST_BUILDDEP:=		xproto-host xextproto-host kbproto-host libpthread-stubs-host
HOST_BUILDDEP+=		inputproto-host libXau-host xcb-proto-host libxcb-host xtrans-host
PKG_DEPENDS:=		libxdmcp libxcb libxau
PKG_SITES:=		http://www.x.org/releases/individual/lib/
PKG_LIBNAME:=		libx11
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,LIBX11,libx11,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBX11,libx11,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

XAKE_FLAGS+=		V=1
CONFIGURE_ARGS+=	--enable-xlocale \
			--disable-specs \
			--disable-xf86bigfont \
			--disable-malloc0returnsnull
HOST_STYLE:=		auto
HOST_CONFIGURE_ARGS+=	--enable-xlocale \
			--disable-specs \
			--disable-xf86bigfont \
			--disable-malloc0returnsnull

libx11-install:
	${INSTALL_DIR} ${IDIR_LIBX11}/usr/lib ${IDIR_LIBX11}/usr/share/X11
	${CP} ${WRKINST}/usr/lib/libX11.so* ${IDIR_LIBX11}/usr/lib/
	${CP} ${WRKINST}/usr/lib/libX11-xcb*.so* ${IDIR_LIBX11}/usr/lib/
	${CP} ${WRKINST}/usr/share/X11/XErrorDB ${IDIR_LIBX11}/usr/share/X11
	${CP} ${WRKINST}/usr/share/X11/locale ${IDIR_LIBX11}/usr/share/X11

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
