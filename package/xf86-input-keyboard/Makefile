# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xf86-input-keyboard
PKG_VERSION:=		1.8.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		4f3e135e04939916f37f91a111c6f70b
PKG_DESCR:=		X11 driver for keyboard
PKG_SECTION:=		x11/drivers
PKG_DEPENDS:=		xorg-server
PKG_BUILDDEP:=		xorg-server
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_NEED_CXX:=		1

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_ARCH_DEPENDS:=      !m68k
PKG_CFLINE_XF86_INPUT_KEYBOARD:=	depends on ADK_TARGET_WITH_INPUT

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XF86_INPUT_KEYBOARD,xf86-input-keyboard,$(PKG_VERSION)-$(PKG_RELEASE),${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

xf86-input-keyboard-install:
	${INSTALL_DIR} ${IDIR_XF86_INPUT_KEYBOARD}/usr/lib/xorg/modules/input
	${CP} ${WRKINST}/usr/lib/xorg/modules/input/kbd_drv.so \
		${IDIR_XF86_INPUT_KEYBOARD}/usr/lib/xorg/modules/input/

include ${TOPDIR}/mk/pkg-bottom.mk
