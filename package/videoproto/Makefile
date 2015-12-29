# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		videoproto
PKG_VERSION:=		2.3.2
PKG_RELEASE:=		1
PKG_DESCR:=		x11 video protocol headers
PKG_SECTION:=		dev/header
PKG_HASH:=		70eaa52beb83d07b71d81b9e4a396ba53c825472c4998f9e7b9889325b2a4346
PKG_SITES:=		http://www.x.org/releases/individual/proto/
PKG_OPTS:=		dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,VIDEOPROTO,videoproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
