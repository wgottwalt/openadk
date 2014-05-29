# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		fixesproto
PKG_VERSION:=		5.0
PKG_RELEASE:=		1
PKG_DESCR:=		xfixes extension headers
PKG_SECTION:=		dev/header
PKG_MD5SUM:=		1b3115574cadd4cbea1f197faa7c1de4
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=              dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,FIXESPROTO,fixesproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

include ${TOPDIR}/mk/pkg-bottom.mk
