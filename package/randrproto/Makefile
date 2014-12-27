# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		randrproto
PKG_VERSION:=		1.4.0
PKG_RELEASE:=		1
PKG_HASH:=		b2c44b63a22f37eef5a2e4ec325e8e6c2ee8b235ef516357535570def6210c88
PKG_DESCR:=		xrandr protcol headers
PKG_SECTION:=		dev/header
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=		dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,RANDRPROTO,randrproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
