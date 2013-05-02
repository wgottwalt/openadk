# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xbitmaps
PKG_VERSION:=		1.1.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		288bbe310db67280a9e2e5ebc5602595
PKG_DESCR:=		prerequiste for xsetroot
PKG_SECTION:=		x11/libs
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XBITMAPS,xbitmaps,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

post-install:
	${INSTALL_DIR} ${IDIR_XBITMAPS}/usr/include
	${CP} ${WRKINST}/usr/include/X11 ${IDIR_XBITMAPS}/usr/include
	${INSTALL_DIR} ${IDIR_XBITMAPS}/usr/lib/pkgconfig
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/xbitmaps.pc \
		${IDIR_XBITMAPS}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
