# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libXau
PKG_VERSION:=		1.0.7
PKG_RELEASE:=		2
PKG_HASH:=		cbb81b4ba0f585faac8b9914b0bdbef6e0ef886a30c70d6584e2b30efeda9ac4
PKG_DESCR:=		x11 authorisation library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		xproto
HOST_BUILDDEP:=		xproto-host
PKG_SITES:=		${MASTER_SITE_XORG}
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
