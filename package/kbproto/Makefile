# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		kbproto
PKG_VERSION:=		1.0.6
PKG_RELEASE:=		1
PKG_DESCR:=		X11 keyboard protocol headers
PKG_SECTION:=		x11/devel
PKG_MD5SUM:=		9c650b7947fe59b3f144518400e8d029
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,KBPROTO,kbproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

post-install:
	${INSTALL_DIR} ${IDIR_KBPROTO}/usr/include
	${CP} ${WRKINST}/usr/include/X11 ${IDIR_KBPROTO}/usr/include
	${INSTALL_DIR} ${IDIR_KBPROTO}/usr/lib/pkgconfig
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/kbproto.pc \
		${IDIR_KBPROTO}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
