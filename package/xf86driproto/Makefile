# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xf86driproto
PKG_VERSION:=		2.1.0
PKG_RELEASE:=		1
PKG_DESCR:=		X DRI Protocol headers
PKG_SECTION:=		x11/devel
PKG_MD5SUM:=		309d552732666c3333d7dc63e80d042f
PKG_SITES:=		${MASTER_SITE_XORG}

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XF86DRIPROTO,xf86driproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

post-install:
	${INSTALL_DIR} ${IDIR_XF86DRIPROTO}/usr/include
	${CP} ${WRKINST}/usr/include/* \
		${IDIR_XF86DRIPROTO}/usr/include
	${INSTALL_DIR} ${IDIR_XF86DRIPROTO}/usr/lib/pkgconfig
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/xf86driproto.pc \
		${IDIR_XF86DRIPROTO}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
