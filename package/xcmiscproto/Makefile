# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xcmiscproto
PKG_VERSION:=		1.2.1
PKG_RELEASE:=		1
PKG_DESCR:=		XC-MISC Extension headers
PKG_SECTION:=		x11/devel
PKG_MD5SUM:=		9a8da85301db41e8435099ffefb4ac74
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XCMISCPROTO,xcmiscproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

post-install:
	${INSTALL_DIR} ${IDIR_XCMISCPROTO}/usr/include
	${CP} ${WRKINST}/usr/include/X11 ${IDIR_XCMISCPROTO}/usr/include
	${INSTALL_DIR} ${IDIR_XCMISCPROTO}/usr/lib/pkgconfig
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/xcmiscproto.pc \
		${IDIR_XCMISCPROTO}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
