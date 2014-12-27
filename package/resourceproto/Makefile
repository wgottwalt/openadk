# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		resourceproto
PKG_VERSION:=		1.2.0
PKG_RELEASE:=		1
PKG_DESCR:=		resource extension headers
PKG_SECTION:=		dev/header
PKG_HASH:=		469029d14fdeeaa7eed1be585998ff4cb92cf664f872d1d69c04140815b78734
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=		dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,RESOURCEPROTO,resourceproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
