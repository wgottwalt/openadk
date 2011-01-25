# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		glproto
PKG_VERSION:=		1.4.12
PKG_RELEASE:=		1
PKG_DESCR:=		OpenGL headers
PKG_SECTION:=		x11/devel
PKG_MD5SUM:=		c528c5903bb836b33a35863f97613c64
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,GLPROTO,glproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

post-install:
	${INSTALL_DIR} ${IDIR_GLPROTO}/usr/include
	${CP} ${WRKINST}/usr/include/GL ${IDIR_GLPROTO}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
