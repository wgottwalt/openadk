# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXrender
PKG_VERSION:=		0.9.7
PKG_RELEASE:=		2
PKG_MD5SUM:=		b6702e6f56f9d9103dc688f4336529a9
PKG_DESCR:=		X11 rendering library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		renderproto-host xproto-host xextproto-host libXau-host 
PKG_BUILDDEP+=		xcb-proto-host libpthread-stubs-host libxcb-host kbproto-host
PKG_BUILDDEP+=		inputproto-host xtrans-host libX11-host libXrender-host renderproto libX11
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_LIBNAME:=		libxrender
PKG_OPTS:=		dev

ifeq ($(ADK_STATIC),y)
PKG_OPTS+=		libonly
endif

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,LIBXRENDER,libxrender,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBXRENDER,libxrender,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		auto
CONFIGURE_ARGS+=	--disable-malloc0returnsnull

libxrender-install:
	${INSTALL_DIR} ${IDIR_LIBXRENDER}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXrender.so* ${IDIR_LIBXRENDER}/usr/lib

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
