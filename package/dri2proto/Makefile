# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		dri2proto
PKG_VERSION:=		2.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		873142af5db695537cfe05e01d13541f
PKG_DESCR:=		DRI protocol headers
PKG_SECTION:=		devel
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=              dev devonly

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,DRI2PROTO,dri2proto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

include ${TOPDIR}/mk/pkg-bottom.mk
