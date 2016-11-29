# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libXtst
PKG_VERSION:=		1.2.3
PKG_RELEASE:=		1
PKG_HASH:=		a0c83acce02d4923018c744662cb28eb0dbbc33b4adc027726879ccf68fbc2c2
PKG_DESCR:=		client interface to the record extension to the x protocol
PKG_SECTION:=		x11/libs
PKG_BUILDDEP+=		recordproto libXi
HOST_BUILDDEP:=		recordproto-host xproto-host xextproto-host
HOST_BUILDDEP+=		inputproto-host kbproto-host xtrans-host
HOST_BUILDDEP+=		xcb-proto-host libXau-host libpthread-stubs-host
HOST_BUILDDEP+=		libX11-host libXext-host libXi-host
PKG_SITES:=		http://www.x.org/releases/individual/lib/
PKG_LIBNAME:=		libxtst
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,LIBXTST,libxtst,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBXTST,libxtst,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		auto
CONFIGURE_ARGS+= 	--disable-malloc0returnsnull

libxtst-install:
	${INSTALL_DIR} ${IDIR_LIBXTST}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXtst.so* ${IDIR_LIBXTST}/usr/lib

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
