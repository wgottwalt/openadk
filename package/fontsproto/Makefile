# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		fontsproto
PKG_VERSION:=		2.1.2
PKG_RELEASE:=		1
PKG_HASH:=		aaf2375a617afdc1500069a838c0694f59f19d592fc9d9ffa05bd4f37b8504c1
PKG_DESCR:=		fonts extension headers
PKG_SECTION:=		dev/header
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=		dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,FONTSPROTO,fontsproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
