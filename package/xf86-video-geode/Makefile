# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		xf86-video-geode
PKG_VERSION:=		2.11.19
PKG_RELEASE:=		1
PKG_HASH:=		46ef4e23eaf91abc48ffad394ec6479bf60b2482eded8803d6af93f4ccf51aed
PKG_DESCR:=		x11 driver for amd geode vga chip
PKG_SECTION:=		x11/drivers
PKG_DEPENDS:=		xorg-server
PKG_BUILDDEP:=		xorg-server
PKG_NEEDS:=		c++
PKG_SITES:=		http://www.x.org/releases/individual/driver/

PKG_ARCH_DEPENDS:=	x86

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XF86_VIDEO_GEODE,xf86-video-geode,$(PKG_VERSION)-$(PKG_RELEASE),${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--with-pic

xf86-video-geode-install:
	${INSTALL_DIR} ${IDIR_XF86_VIDEO_GEODE}/usr/lib/xorg/modules/drivers
	${CP} ${WRKINST}/usr/lib/xorg/modules/drivers/geode_drv.so \
		${IDIR_XF86_VIDEO_GEODE}/usr/lib/xorg/modules/drivers/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
