# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		videoproto
PKG_VERSION:=		2.3.1
PKG_RELEASE:=		1
PKG_DESCR:=		x11 video protocol headers
PKG_SECTION:=		dev/header
PKG_HASH:=		c7c91429426a1c2cf34a6c29bd6f19ad0551f7766d8f4562a2cec0edddec14c7
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=		dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,VIDEOPROTO,videoproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
