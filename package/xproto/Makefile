# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		xproto
PKG_VERSION:=		7.0.27
PKG_RELEASE:=		1
PKG_DESCR:=		x window system core protocol headers
PKG_SECTION:=		dev/header
PKG_HASH:=		693d6ae50cb642fc4de6ab1f69e3f38a8e5a67eb41ac2aca253240f999282b6b
PKG_BUILDDEP:=		xproto-host
PKG_SITES:=		$(MASTER_SITE_XORG)
PKG_OPTS:=		dev devonly

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,XPROTO,xproto,$(PKG_VERSION)-$(PKG_RELEASE)))
$(eval $(call PKG_template,XPROTO,xproto,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

HOST_STYLE:=		auto

include $(ADK_TOPDIR)/mk/host-bottom.mk
include $(ADK_TOPDIR)/mk/pkg-bottom.mk
