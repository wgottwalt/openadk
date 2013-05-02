# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		inputproto
PKG_VERSION:=		2.2
PKG_RELEASE:=		1
PKG_DESCR:=		X Input Extension headers
PKG_SECTION:=		x11/devel
PKG_MD5SUM:=		e0047823230413e67d74e92af77fbe58
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,INPUTPROTO,inputproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

post-install:
	${INSTALL_DIR} ${IDIR_INPUTPROTO}/usr/include
	${CP} ${WRKINST}/usr/include/X11 ${IDIR_INPUTPROTO}/usr/include
	${INSTALL_DIR} ${IDIR_INPUTPROTO}/usr/lib/pkgconfig
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/inputproto.pc \
		${IDIR_INPUTPROTO}/usr/lib/pkgconfig	

include ${TOPDIR}/mk/pkg-bottom.mk
