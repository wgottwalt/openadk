# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libXau
PKG_VERSION:=		1.0.8
PKG_RELEASE:=		1
PKG_HASH:=		c343b4ef66d66a6b3e0e27aa46b37ad5cab0f11a5c565eafb4a1c7590bc71d7b
PKG_DESCR:=		x11 authorisation library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		xproto
HOST_BUILDDEP:=		xproto-host
PKG_SITES:=		http://www.x.org/releases/individual/lib/
PKG_LIBNAME:=		libxau
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,LIBXAU,libxau,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBXAU,libxau,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		auto

libxau-install:
	${INSTALL_DIR} ${IDIR_LIBXAU}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXau.so* ${IDIR_LIBXAU}/usr/lib/

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
