# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		damageproto
PKG_VERSION:=		1.2.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		bf8c47b7f48625230cff155180f8ddce
PKG_DESCR:=		X DAMAGE Extension headers
PKG_SECTION:=		devel
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=              dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,DAMAGEPROTO,damageproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

include ${TOPDIR}/mk/pkg-bottom.mk
