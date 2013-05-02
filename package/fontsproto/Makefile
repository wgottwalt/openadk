# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		fontsproto
PKG_VERSION:=		2.1.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		642a8c5700519a84efe28944afe5cbdc
PKG_DESCR:=		Fonts extension headers
PKG_SECTION:=		x11/devel
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,FONTSPROTO,fontsproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

post-install:
	${INSTALL_DIR} ${IDIR_FONTSPROTO}/usr/include
	${CP} ${WRKINST}/usr/include/X11 ${IDIR_FONTSPROTO}/usr/include
	${INSTALL_DIR} ${IDIR_FONTSPROTO}/usr/lib/pkgconfig
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/fontsproto.pc \
		${IDIR_FONTSPROTO}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
