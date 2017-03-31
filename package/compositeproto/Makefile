# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		compositeproto
PKG_VERSION:=		0.4.2
PKG_RELEASE:=		1
PKG_HASH:=		22195b7e50036440b1c6b3b2d63eb03dfa6e71c8a1263ed1f07b0f31ae7dad50
PKG_DESCR:=		composite headers
PKG_SECTION:=		dev/header
PKG_SITES:=		http://www.x.org/releases/individual/proto/
PKG_OPTS:=		dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,COMPOSITEPROTO,compositeproto,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,COMPOSITEPROTO,compositeproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		auto

include $(ADK_TOPDIR)/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
