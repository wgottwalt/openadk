# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		pixman
PKG_VERSION:=		0.16.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		02bd3669f53c404c19980d5efb6f86fb
PKG_DESCR:=		Pixel manipulation library
PKG_SECTION:=		x11
PKG_SITES:=		http://www.cairographics.org/releases/

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,PIXMAN,${PKG_NAME},$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

post-install:
	${INSTALL_DIR} ${IDIR_PIXMAN}/usr/lib
	${CP} ${WRKINST}/usr/lib/libpixman-1.so* ${IDIR_PIXMAN}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
