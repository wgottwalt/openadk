# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		xcmiscproto
PKG_VERSION:=		1.2.1
PKG_RELEASE:=		1
PKG_DESCR:=		xc-misc extension headers
PKG_SECTION:=		dev/header
PKG_HASH:=		33415e374f63acc4dbd0ad59425f0c8876e567bad3d8563479ff955cb3bec300
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=		dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XCMISCPROTO,xcmiscproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
