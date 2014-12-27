# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		dri3proto
PKG_VERSION:=		1.0
PKG_RELEASE:=		1
PKG_HASH:=		e1a0dad3009ecde52c0bf44187df5f95cc9a7cc0e76dfc2f2bbf3e909fe03fa9
PKG_DESCR:=		dri3 protocol headers
PKG_SECTION:=		dev/header
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=              dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,DRI3PROTO,dri3proto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
