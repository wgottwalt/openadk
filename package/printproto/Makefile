# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		printproto
PKG_VERSION:=		1.0.5
PKG_RELEASE:=		1
PKG_DESCR:=		X Print Extension headers
PKG_SECTION:=		x11/devel
PKG_MD5SUM:=		5afeb3a7de8a14b417239a14ea724268
PKG_SITES:=		http://xorg.freedesktop.org/releases/individual/proto/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,PRINTPROTO,printproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

post-install:
	${INSTALL_DIR} ${IDIR_PRINTPROTO}/usr/include
	${CP} ${WRKINST}/usr/include/X11 ${IDIR_PRINTPROTO}/usr/include
	${INSTALL_DIR} ${IDIR_PRINTPROTO}/usr/lib/pkgconfig
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/*.pc \
		${IDIR_PRINTPROTO}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
