# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		xf86dga
PKG_VERSION:=		1.0.2
PKG_RELEASE:=		1
PKG_HASH:=		dce95dbb8310ad214d60ba2e1fcdb56a41a10bd4843d7f953a8108cbebd1ebf9
PKG_SECTION:=		dev/header
PKG_BUILDDEP:=		libXxf86dga
PKG_SITES:=		http://www.x.org/releases/individual/app/
PKG_OPTS:=		dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XF86DGA,xf86dga,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
