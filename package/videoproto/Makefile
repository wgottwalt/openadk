# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		videoproto
PKG_VERSION:=		2.3.3
PKG_RELEASE:=		1
PKG_HASH:=		df8dfeb158767f843054248d020e291a2c40f7f5e0ac6d8706966686fee7c5c0
PKG_DESCR:=		x11 video protocol headers
PKG_SECTION:=		dev/header
PKG_SITES:=		http://www.x.org/releases/individual/proto/
PKG_OPTS:=		dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,VIDEOPROTO,videoproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
