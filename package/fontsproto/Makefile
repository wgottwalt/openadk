# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		fontsproto
PKG_VERSION:=		2.1.3
PKG_RELEASE:=		1
PKG_HASH:=		72c44e63044b2b66f6fa112921621ecc20c71193982de4f198d9a29cda385c5e
PKG_DESCR:=		fonts extension headers
PKG_SECTION:=		dev/header
PKG_SITES:=		$(MASTER_SITE_XORG)
PKG_OPTS:=		dev devonly

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,FONTSPROTO,fontsproto,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
