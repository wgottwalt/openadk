# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xproto
PKG_VERSION:=		7.0.23
PKG_RELEASE:=		1
PKG_DESCR:=		X Window System Core Protocol headers
PKG_SECTION:=		x11/devel
PKG_MD5SUM:=		7ab1239930563a352cb3552fd2db4140
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XPROTO,xproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

post-install:
	${INSTALL_DIR} ${IDIR_XPROTO}/usr/include
	${CP} ${WRKINST}/usr/include/X11 ${IDIR_XPROTO}/usr/include
	${INSTALL_DIR} ${IDIR_XPROTO}/usr/lib/pkgconfig
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/xproto.pc \
		${IDIR_XPROTO}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
