# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		renderproto
PKG_VERSION:=		0.11.1
PKG_RELEASE:=		1
PKG_DESCR:=		X Rendering Extension headers
PKG_SECTION:=		x11/devel
PKG_MD5SUM:=		9b103359123e375bb7760f7dbae3dece
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,RENDERPROTO,renderproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

post-install:
	${INSTALL_DIR} ${IDIR_RENDERPROTO}/usr/include
	${CP} ${WRKINST}/usr/include/X11 ${IDIR_RENDERPROTO}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
