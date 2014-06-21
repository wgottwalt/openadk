# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		renderproto
PKG_VERSION:=		0.11.1
PKG_RELEASE:=		1
PKG_DESCR:=		x rendering extension headers
PKG_SECTION:=		dev/header
PKG_BUILDDEP:=		renderproto-host
PKG_MD5SUM:=		9b103359123e375bb7760f7dbae3dece
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=		dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,RENDERPROTO,renderproto,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,RENDERPROTO,renderproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		auto

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
