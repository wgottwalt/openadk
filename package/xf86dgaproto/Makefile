# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xf86dgaproto
PKG_VERSION:=		2.1
PKG_RELEASE:=		1
PKG_DESCR:=		XFree86-DGA headers
PKG_SECTION:=		x11/devel
PKG_MD5SUM:=		1fe79dc07857ad3e1fb8b8f2bdd70d1b
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XF86DGAPROTO,xf86dgaproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

post-install:
	${INSTALL_DIR} ${IDIR_XF86DGAPROTO}/usr/include
	${CP} ${WRKINST}/usr/include/X11 ${IDIR_XF86DGAPROTO}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
