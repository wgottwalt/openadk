# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		renderproto
PKG_VERSION:=		0.11.1
PKG_RELEASE:=		1
PKG_DESCR:=		X Rendering Extension headers
PKG_SECTION:=		devel
PKG_MD5SUM:=		9b103359123e375bb7760f7dbae3dece
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=		dev devonly

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,RENDERPROTO,renderproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

include ${TOPDIR}/mk/pkg-bottom.mk
