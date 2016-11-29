# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libXrender
PKG_VERSION:=		0.9.10
PKG_RELEASE:=		1
PKG_HASH:=		770527cce42500790433df84ec3521e8bf095dfe5079454a92236494ab296adf
PKG_DESCR:=		x11 rendering library
PKG_SECTION:=		x11/libs
HOST_BUILDDEP:=		renderproto-host xproto-host xextproto-host libXau-host
HOST_BUILDDEP+=		xcb-proto-host libpthread-stubs-host libxcb-host kbproto-host
HOST_BUILDDEP+=		inputproto-host xtrans-host libX11-host
PKG_BUILDDEP:=		renderproto libX11
PKG_SITES:=		http://www.x.org/releases/individual/lib/
PKG_LIBNAME:=		libxrender
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,LIBXRENDER,libxrender,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBXRENDER,libxrender,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		auto
CONFIGURE_ARGS+=	--disable-malloc0returnsnull

libxrender-install:
	${INSTALL_DIR} ${IDIR_LIBXRENDER}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXrender.so* ${IDIR_LIBXRENDER}/usr/lib

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
