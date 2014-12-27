# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		scrnsaverproto
PKG_VERSION:=		1.2.2
PKG_RELEASE:=		1
PKG_DESCR:=		screensaver headers
PKG_SECTION:=		dev/header
PKG_HASH:=		d8dee19c52977f65af08fad6aa237bacee11bc5a33e1b9b064e8ac1fd99d6e79
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=		dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,SCRNSAVERPROTO,scrnsaverproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
