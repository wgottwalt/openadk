# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		bigreqsproto
PKG_VERSION:=		1.1.2
PKG_RELEASE:=		2
PKG_DESCR:=		Big Requests Extension headers
PKG_SECTION:=		devel
PKG_MD5SUM:=		9b83369ac7a5eb2bf54c8f34db043a0e
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=		dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,BIGREQSPROTO,bigreqsproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

include ${TOPDIR}/mk/pkg-bottom.mk
