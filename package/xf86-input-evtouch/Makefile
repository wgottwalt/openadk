# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		xf86-input-evtouch
PKG_VERSION:=		0.8.8
PKG_RELEASE:=		1
PKG_HASH:=		eafc4a09729a4b2b6120430c71e1954c5cac299ad6adf2f9a40aee8a7b51e476
PKG_DESCR:=		x11 driver for touchscreens
PKG_SECTION:=		x11/drivers
PKG_DEPENDS:=		xorg-server
PKG_BUILDDEP:=		xorg-server
PKG_SITES:=		http://www.conan.de/touchscreen/

PKG_CFLINE_XF86_INPUT_EVTOUCH:=	depends on ADK_BROKEN

DISTFILES:= 		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XF86_INPUT_EVTOUCH,xf86-input-evtouch,$(PKG_VERSION)-$(PKG_RELEASE),${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

xf86-input-evtouch-install:
	${INSTALL_DIR} ${IDIR_XF86_INPUT_EVTOUCH}/usr/lib/xorg/modules/input
	${CP} ${WRKINST}/usr/lib/xorg/modules/input/evtouch_drv.so \
		${IDIR_XF86_INPUT_EVTOUCH}/usr/lib/xorg/modules/input/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
