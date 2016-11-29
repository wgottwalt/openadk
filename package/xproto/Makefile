# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		xproto
PKG_VERSION:=		7.0.31
PKG_RELEASE:=		1
PKG_HASH:=		6d755eaae27b45c5cc75529a12855fed5de5969b367ed05003944cf901ed43c7
PKG_DESCR:=		x window system core protocol headers
PKG_SECTION:=		dev/header
PKG_BUILDDEP:=		xproto-host
PKG_SITES:=		http://www.x.org/releases/individual/proto/
PKG_OPTS:=		dev devonly

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,XPROTO,xproto,$(PKG_VERSION)-$(PKG_RELEASE)))
$(eval $(call PKG_template,XPROTO,xproto,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

HOST_STYLE:=		auto

include $(ADK_TOPDIR)/mk/host-bottom.mk
include $(ADK_TOPDIR)/mk/pkg-bottom.mk
