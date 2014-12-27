# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		kbproto
PKG_VERSION:=		1.0.6
PKG_RELEASE:=		1
PKG_DESCR:=		keyboard protocol headers
PKG_SECTION:=		dev/header
PKG_BUILDDEP:=		kbproto-host
PKG_HASH:=		01fd22286ca9c2a93ca7bb686dbb2f3c108ceb944cd3dfdc9ceeb50f9b7f4505
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=		dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,KBPROTO,kbproto,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,KBPROTO,kbproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		auto

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
