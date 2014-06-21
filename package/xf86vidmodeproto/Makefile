# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		xf86vidmodeproto
PKG_VERSION:=		2.3.1
PKG_RELEASE:=		1
PKG_DESCR:=		xfree86-vidmodeextension extension headers
PKG_SECTION:=		dev/header
PKG_MD5SUM:=		99016d0fe355bae0bb23ce00fb4d4a2c
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=		dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XF86VIDMODEPROTO,xf86vidmodeproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
