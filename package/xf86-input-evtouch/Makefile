# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xf86-input-evtouch
PKG_VERSION:=		0.8.8
PKG_RELEASE:=		1
PKG_MD5SUM:=		4d8e092356d8353002f60a4907046c13
PKG_DESCR:=		X11 driver for touchscreen
PKG_SECTION:=		x11/drivers
PKG_DEPENDS:=		xorg-server
PKG_BUILDDEP:=		xorg-server
PKG_SITES:=		http://www.conan.de/touchscreen/
PKG_NEED_CXX:=		1

PKG_ARCH_DEPENDS:=      !arm !m68k
PKG_CFLINE_XF86_INPUT_EVTOUCH:=	depends on ADK_TARGET_WITH_INPUT

DISTFILES:= 		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XF86_INPUT_EVTOUCH,xf86-input-evtouch,$(PKG_VERSION)-$(PKG_RELEASE),${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

xf86-input-evtouch-install:
	${INSTALL_DIR} ${IDIR_XF86_INPUT_EVTOUCH}/usr/lib/xorg/modules/input
	${CP} ${WRKINST}/usr/lib/xorg/modules/input/evtouch_drv.so \
		${IDIR_XF86_INPUT_EVTOUCH}/usr/lib/xorg/modules/input/

include ${TOPDIR}/mk/pkg-bottom.mk
