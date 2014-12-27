# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		xf86driproto
PKG_VERSION:=		2.1.0
PKG_RELEASE:=		1
PKG_DESCR:=		x dri protocol headers
PKG_SECTION:=		dev/header
PKG_HASH:=		d23f12deffd03e582e897ed6a7df3ea7f66ee8577f0f61374dcdf2ebffdce1be
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=		dev devonly

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XF86DRIPROTO,xf86driproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
