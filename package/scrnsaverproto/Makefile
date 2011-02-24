# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		scrnsaverproto
PKG_VERSION:=		1.2.1
PKG_RELEASE:=		1
PKG_DESCR:=		X11 screensaver headers
PKG_SECTION:=		x11/devel
PKG_MD5SUM:=		c09bd61d39ad0e472b0dfd8bfadd5f2d
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,SCRNSAVERPROTO,scrnsaverproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

post-install:
	${INSTALL_DIR} ${IDIR_SCRNSAVERPROTO}/usr/include
	${CP} ${WRKINST}/usr/include/X11 ${IDIR_SCRNSAVERPROTO}/usr/include
	${INSTALL_DIR} ${IDIR_SCRNSAVERPROTO}/usr/lib/pkgconfig
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/scrnsaverproto.pc \
		${IDIR_SCRNSAVERPROTO}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
