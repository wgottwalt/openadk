# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		xbitmaps
PKG_VERSION:=		1.1.1
PKG_RELEASE:=		1
PKG_HASH:=		3bc89e05be4179ce4d3dbba1ae554da4591d41f7a489d9e2735a18cfd8378188
PKG_DESCR:=		prerequiste for xsetroot
PKG_SECTION:=		x11/libs
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=		dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XBITMAPS,xbitmaps,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
