# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		xf86-video-cirrus
PKG_VERSION:=		1.5.3
PKG_RELEASE:=		1
PKG_HASH:=		4ff2024c1645f30931f0871f36484aed85ef35aa04852faa7082dbf4ee2c83a5
PKG_DESCR:=		x11 driver for cirrus vga chips
PKG_SECTION:=		x11/drivers
PKG_DEPENDS:=		xorg-server
PKG_BUILDDEP:=		xorg-server
PKG_NEEDS:=		c++
PKG_SITES:=		http://www.x.org/releases/individual/driver/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XF86_VIDEO_CIRRUS,xf86-video-cirrus,$(PKG_VERSION)-$(PKG_RELEASE),${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

xf86-video-cirrus-install:
	${INSTALL_DIR} ${IDIR_XF86_VIDEO_CIRRUS}/usr/lib/xorg/modules/drivers
	${CP} ${WRKINST}/usr/lib/xorg/modules/drivers/cirrus_*.so \
		${IDIR_XF86_VIDEO_CIRRUS}/usr/lib/xorg/modules/drivers/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
