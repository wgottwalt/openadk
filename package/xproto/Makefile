# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		xproto
PKG_VERSION:=		7.0.23
PKG_RELEASE:=		1
PKG_DESCR:=		x window system core protocol headers
PKG_SECTION:=		dev/header
PKG_MD5SUM:=		7ab1239930563a352cb3552fd2db4140
PKG_BUILDDEP:=		xproto-host
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=		dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,XPROTO,xproto,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,XPROTO,xproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		auto

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
