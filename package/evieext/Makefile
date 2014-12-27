# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		evieext
PKG_VERSION:=		1.1.0
PKG_RELEASE:=		2
PKG_HASH:=		c82f1608f50c36b55a85f85d97b8fc5841197fde3035e5005143211f2992518b
PKG_DESCR:=		collection of xevie extension headers
PKG_SECTION:=		dev/header
PKG_SITES:=		ftp://ftp.x.org/pub/individual/proto/
PKG_OPTS:=              dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,EVIEEXT,evieext,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
