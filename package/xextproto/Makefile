# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xextproto
PKG_VERSION:=		7.2.1
PKG_RELEASE:=		1
PKG_DESCR:=		X Protocol Extensions headers
PKG_SECTION:=		devel
PKG_MD5SUM:=		9062d689f422fad1b8774c967d730f09
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=		dev devonly

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XEXTPROTO,xextproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

include ${TOPDIR}/mk/pkg-bottom.mk
