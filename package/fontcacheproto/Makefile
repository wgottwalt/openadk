# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		fontcacheproto
PKG_VERSION:=		0.1.3
PKG_RELEASE:=		1
PKG_HASH:=		759b4863b55a25bfc8f977d8ed969da0b99b3c823f33c674d6da5825f9df9a79
PKG_SECTION:=		dev/header
PKG_SITES:=		http://www.x.org/releases/individual/proto/
PKG_OPTS:=              dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,FONTCACHEPROTO,fontcacheproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
