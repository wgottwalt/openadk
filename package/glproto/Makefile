# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		glproto
PKG_VERSION:=		1.4.17
PKG_RELEASE:=		1
PKG_DESCR:=		opengl headers
PKG_SECTION:=		dev/header
PKG_HASH:=		9d8130fec2b98bd032db7730fa092dd9dec39f3de34f4bb03ceb43b9903dbc96
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=		dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,GLPROTO,glproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
