# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		xextproto
PKG_VERSION:=		7.3.0
PKG_RELEASE:=		1
PKG_DESCR:=		x protocol extensions headers
PKG_SECTION:=		dev/header
PKG_BUILDDEP:=		xextproto-host
PKG_HASH:=		1b1bcdf91221e78c6c33738667a57bd9aaa63d5953174ad8ed9929296741c9f5
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=		dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,XEXTPROTO,xextproto,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,XEXTPROTO,xextproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		auto

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
