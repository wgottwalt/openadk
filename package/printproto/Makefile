# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		printproto
PKG_VERSION:=		1.0.5
PKG_RELEASE:=		1
PKG_DESCR:=		x print extension headers
PKG_SECTION:=		dev/header
PKG_HASH:=		e8b6f405fd865f0ea7a3a2908dfbf06622f57f2f91359ec65d13b955e49843fc
PKG_SITES:=		http://xorg.freedesktop.org/releases/individual/proto/
PKG_OPTS:=		dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,PRINTPROTO,printproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
