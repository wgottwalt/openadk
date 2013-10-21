# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		recordproto
PKG_VERSION:=		1.14.2
PKG_RELEASE:=		1
PKG_DESCR:=		RECORD extension headers
PKG_SECTION:=		devel
PKG_MD5SUM:=		868235e1e150e68916d5a316ebc4ccc4
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=		dev devonly

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,RECORDPROTO,recordproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

include ${TOPDIR}/mk/pkg-bottom.mk
