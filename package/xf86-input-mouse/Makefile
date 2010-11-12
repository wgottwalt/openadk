# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xf86-input-mouse
PKG_VERSION:=		1.5.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		a662883fd9709c3dad7fb113ad8d2908
PKG_DESCR:=		X11 driver for mouse
PKG_SECTION:=		x11/drivers
PKG_DEPENDS:=		xorg-server
PKG_BUILDDEP:=		xorg-server
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XF86_INPUT_MOUSE,${PKG_NAME},$(PKG_VERSION)-$(PKG_RELEASE),${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	${INSTALL_DIR} ${IDIR_XF86_INPUT_MOUSE}/usr/lib/xorg/modules/input
	${CP} ${WRKINST}/usr/lib/xorg/modules/input/mouse_drv.so \
		${IDIR_XF86_INPUT_MOUSE}/usr/lib/xorg/modules/input/

include ${TOPDIR}/mk/pkg-bottom.mk
