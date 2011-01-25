# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xextproto
PKG_VERSION:=		7.1.2
PKG_RELEASE:=		1
PKG_DESCR:=		X Protocol Extensions headers
PKG_SECTION:=		x11/devel
PKG_MD5SUM:=		1e8a156cd209e66cd8290c96678e777a
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XEXTPROTO,xextproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

post-install:
	${INSTALL_DIR} ${IDIR_XEXTPROTO}/usr/include
	${CP} ${WRKINST}/usr/include/X11 ${IDIR_XEXTPROTO}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
