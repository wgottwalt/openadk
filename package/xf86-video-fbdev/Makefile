# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xf86-video-fbdev
PKG_VERSION:=		0.4.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		2b5e6dd218243cf96c1a4090596a6bba
PKG_DESCR:=		x11 driver for framebuffer devices
PKG_SECTION:=		x11/drivers
PKG_DEPENDS:=		xorg-server libstdcxx
PKG_BUILDDEP:=		xorg-server
PKG_SITES:=		${MASTER_SITE_XORG}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_ARCH_DEPENDS:=      !m68k
PKG_CFLINE_XF86_VIDEO_FBDEV:=	depends on ADK_TARGET_WITH_VGA

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XF86_VIDEO_FBDEV,xf86-video-fbdev,$(PKG_VERSION)-$(PKG_RELEASE),${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

xf86-video-fbdev-install:
	${INSTALL_DIR} ${IDIR_XF86_VIDEO_FBDEV}/usr/lib/xorg/modules/drivers
	${CP} ${WRKINST}/usr/lib/xorg/modules/drivers/fbdev_*.so \
		${IDIR_XF86_VIDEO_FBDEV}/usr/lib/xorg/modules/drivers/

include ${TOPDIR}/mk/pkg-bottom.mk
