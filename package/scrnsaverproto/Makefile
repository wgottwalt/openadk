# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		scrnsaverproto
PKG_VERSION:=		1.2.2
PKG_RELEASE:=		1
PKG_DESCR:=		X11 screensaver headers
PKG_SECTION:=		devel
PKG_MD5SUM:=		21704f1bad472d94abd22fea5704bb48
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=		dev devonly

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,SCRNSAVERPROTO,scrnsaverproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

include ${TOPDIR}/mk/pkg-bottom.mk
