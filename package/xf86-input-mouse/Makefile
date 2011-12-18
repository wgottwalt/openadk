# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xf86-input-mouse
PKG_VERSION:=		1.6.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		31bce890613901ad2692403a0ea3f7c5
PKG_DESCR:=		X11 driver for mouse
PKG_SECTION:=		x11/drivers
PKG_DEPENDS:=		xorg-server
PKG_BUILDDEP:=		xorg-server
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_NEED_CXX:=		1

PKG_ARCH_DEPENDS:=      !avr32
PKG_CFLINE_XF86_INPUT_MOUSE:=	depends on ADK_TARGET_WITH_INPUT

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XF86_INPUT_MOUSE,${PKG_NAME},$(PKG_VERSION)-$(PKG_RELEASE),${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	${INSTALL_DIR} ${IDIR_XF86_INPUT_MOUSE}/usr/lib/xorg/modules/input
	${CP} ${WRKINST}/usr/lib/xorg/modules/input/mouse_drv.so \
		${IDIR_XF86_INPUT_MOUSE}/usr/lib/xorg/modules/input/

include ${TOPDIR}/mk/pkg-bottom.mk
