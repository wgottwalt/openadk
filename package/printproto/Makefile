# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		printproto
PKG_VERSION:=		1.0.5
PKG_RELEASE:=		1
PKG_DESCR:=		x print extension headers
PKG_SECTION:=		dev/header
PKG_MD5SUM:=		5afeb3a7de8a14b417239a14ea724268
PKG_SITES:=		http://xorg.freedesktop.org/releases/individual/proto/
PKG_OPTS:=		dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,PRINTPROTO,printproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

include ${TOPDIR}/mk/pkg-bottom.mk
