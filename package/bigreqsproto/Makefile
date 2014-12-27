# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		bigreqsproto
PKG_VERSION:=		1.1.2
PKG_RELEASE:=		2
PKG_DESCR:=		big requests extension headers
PKG_SECTION:=		dev/header
PKG_HASH:=		de68a1a9dd1a1219ad73531bff9f662bc62fcd777387549c43cd282399f4a6ea
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=		dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,BIGREQSPROTO,bigreqsproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
