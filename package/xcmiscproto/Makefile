# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xcmiscproto
PKG_VERSION:=		1.2.1
PKG_RELEASE:=		1
PKG_DESCR:=		xc-misc extension headers
PKG_SECTION:=		dev/header
PKG_MD5SUM:=		9a8da85301db41e8435099ffefb4ac74
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=		dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XCMISCPROTO,xcmiscproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

include ${TOPDIR}/mk/pkg-bottom.mk
