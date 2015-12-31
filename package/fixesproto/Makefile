# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		fixesproto
PKG_VERSION:=		5.0
PKG_RELEASE:=		1
PKG_DESCR:=		xfixes extension headers
PKG_SECTION:=		dev/header
PKG_HASH:=		67865a0e3cdc7dec1fd676f0927f7011ad4036c18eb320a2b41dbd56282f33b8
PKG_SITES:=		http://www.x.org/releases/individual/proto/
PKG_OPTS:=              dev devonly

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,FIXESPROTO,fixesproto,$(PKG_VERSION)-$(PKG_RELEASE)))
$(eval $(call PKG_template,FIXESPROTO,fixesproto,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

HOST_STYLE:=		auto

include $(ADK_TOPDIR)/mk/host-bottom.mk
include $(ADK_TOPDIR)/mk/pkg-bottom.mk
