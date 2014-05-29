# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libX11
PKG_VERSION:=		1.6.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		7e17129e1678355d8268883ee31a6edf
PKG_DESCR:=		x11 client-side library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		xproto-host xextproto-host libXau-host libpthread-stubs-host
PKG_BUILDDEP+=		xcb-proto-host libxcb-host kbproto-host
PKG_BUILDDEP+=		inputproto-host xtrans-host libX11-host
PKG_BUILDDEP+=		xproto xextproto xtrans libXdmcp libXau xcb-proto
PKG_BUILDDEP+=		xcmiscproto bigreqsproto kbproto inputproto libxcb
PKG_DEPENDS:=		libxdmcp libxcb libxau
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_LIBNAME:=		libx11
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

ifeq ($(ADK_STATIC),y)
PKG_OPTS+=		libonly
endif

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,LIBX11,libx11,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBX11,libx11,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		auto
CONFIGURE_ARGS+=	--enable-xlocale \
			--disable-specs \
			--disable-xf86bigfont \
			--disable-malloc0returnsnull
HOST_CONFIGURE_ARGS+=	$(CONFIGURE_ARGS)

libx11-install:
	${INSTALL_DIR} ${IDIR_LIBX11}/usr/lib ${IDIR_LIBX11}/usr/share/X11
	${CP} ${WRKINST}/usr/lib/libX11.so* ${IDIR_LIBX11}/usr/lib/
	${CP} ${WRKINST}/usr/lib/libX11-xcb*.so* ${IDIR_LIBX11}/usr/lib/
	${CP} ${WRKINST}/usr/share/X11/XErrorDB ${IDIR_LIBX11}/usr/share/X11
	${CP} ${WRKINST}/usr/share/X11/locale ${IDIR_LIBX11}/usr/share/X11

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
