# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xf86-input-evdev
PKG_VERSION:=		2.6.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		95d35eea1dad1c4828d0027f3be5325c
PKG_DESCR:=		X11 driver for Event driver
PKG_SECTION:=		x11/drivers
PKG_DEPENDS:=		xorg-server kmod-input-evdev
PKG_BUILDDEP:=		xorg-server
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_CFLINE_XF86_INPUT_EVDEV:= depends on ADK_TARGET_WITH_INPUT

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XF86_INPUT_EVDEV,${PKG_NAME},$(PKG_VERSION)-$(PKG_RELEASE),${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	${INSTALL_DIR} ${IDIR_XF86_INPUT_EVDEV}/usr/lib/xorg/modules/input
	${CP} ${WRKINST}/usr/lib/xorg/modules/input/evdev_drv.so \
		${IDIR_XF86_INPUT_EVDEV}/usr/lib/xorg/modules/input/

include ${TOPDIR}/mk/pkg-bottom.mk
