# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		inputproto
PKG_VERSION:=		2.0.1
PKG_RELEASE:=		1
PKG_DESCR:=		X Input Extension headers
PKG_SECTION:=		x11/devel
PKG_MD5SUM:=		796829adecc14a78bfef8e119e6e9c63
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,INPUTPROTO,inputproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

post-install:
	${INSTALL_DIR} ${IDIR_INPUTPROTO}/usr/include
	${CP} ${WRKINST}/usr/include/X11 ${IDIR_INPUTPROTO}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
