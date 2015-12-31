# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		xf86-video-siliconmotion
PKG_VERSION:=		1.7.8
PKG_RELEASE:=		1
PKG_HASH:=		134a6c6f2f5d4cf2fabe5fe18e862a3f74b662b85c796b99da70b26a3f594611
PKG_DESCR:=		x11 driver for silicon motion vga chips
PKG_SECTION:=		x11/drivers
PKG_DEPENDS:=		xorg-server
PKG_BUILDDEP:=		xorg-server
PKG_NEEDS:=		c++
PKG_SITES:=		http://www.x.org/releases/individual/driver/

PKG_SYSTEM_DEPENDS:=	lemote-yeelong
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XF86_VIDEO_SILICONMOTION,xf86-video-siliconmotion,$(PKG_VERSION)-$(PKG_RELEASE),${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-xaa

xf86-video-siliconmotion-install:
	${INSTALL_DIR} ${IDIR_XF86_VIDEO_SILICONMOTION}/usr/lib/xorg/modules/drivers
	${CP} ${WRKINST}/usr/lib/xorg/modules/drivers/siliconmotion_*.so \
		${IDIR_XF86_VIDEO_SILICONMOTION}/usr/lib/xorg/modules/drivers/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
