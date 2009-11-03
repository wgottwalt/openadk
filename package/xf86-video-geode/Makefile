# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xf86-video-geode
PKG_VERSION:=		2.11.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		a673c0f88037d12fbb96d9fefc82785b
PKG_DESCR:=		X11 driver for AMD Geode VGA chip
PKG_SECTION:=		x11
PKG_DEPENDS:=		xorg-server
PKG_SITES:=		http://xorg.freedesktop.org/releases/individual/driver/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XF86_VIDEO_GEODE,${PKG_NAME},$(PKG_VERSION)-$(PKG_RELEASE),${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_XF86_VIDEO_GEODE}/usr/lib/xorg/modules/drivers
	${CP} ${WRKINST}/usr/lib/xorg/modules/drivers/geode_drv.so \
		${IDIR_XF86_VIDEO_GEODE}/usr/lib/xorg/modules/drivers/

include ${TOPDIR}/mk/pkg-bottom.mk
