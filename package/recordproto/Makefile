# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		recordproto
PKG_VERSION:=		1.14.2
PKG_RELEASE:=		1
PKG_DESCR:=		record extension headers
PKG_SECTION:=		dev/header
PKG_BUILDDEP:=		recordproto-host
PKG_HASH:=		485f792570dd7afe49144227f325bf2827bc7d87aae6a8ab6c1de2b06b1c68c5
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=		dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,RECORDPROTO,recordproto,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,RECORDPROTO,recordproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		auto

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
