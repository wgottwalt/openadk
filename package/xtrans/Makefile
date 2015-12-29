# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		xtrans
PKG_VERSION:=		1.3.5
PKG_RELEASE:=		1
PKG_DESCR:=		network protocol transport library
PKG_SECTION:=		dev/header
PKG_BUILDDEP:=		xtrans-host
PKG_HASH:=		b7a577c1b6c75030145e53b4793db9c88f9359ac49e7d771d4385d21b3e5945d
PKG_SITES:=		http://www.x.org/releases/individual/lib/
PKG_OPTS:=		dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,XTRANS,xtrans,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,XTRANS,xtrans,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		auto
CONFIGURE_ARGS+=	--datadir=/usr/lib

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
