# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		randrproto
PKG_VERSION:=		1.4.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		af44f250b89783eb4967f1dc5b32ef68
PKG_DESCR:=		Xrandr protcol headers
PKG_SECTION:=		devel
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=		dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,RANDRPROTO,randrproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

include ${TOPDIR}/mk/pkg-bottom.mk
