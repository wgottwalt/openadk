# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		dri2proto
PKG_VERSION:=		2.8
PKG_RELEASE:=		1
PKG_HASH:=		7e65b031eaa6ebe23c75583d4abd993ded7add8009b4200a4db7aa10728b0f61
PKG_DESCR:=		dri2 protocol headers
PKG_SECTION:=		dev/header
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=              dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,DRI2PROTO,dri2proto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
