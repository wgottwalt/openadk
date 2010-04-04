# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xf86-video-fbdev
PKG_VERSION:=		0.4.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		c297e40b93b3636a72189cfac43d1a87
PKG_DESCR:=		X11 driver for Linux Framebuffer devices
PKG_SECTION:=		x11
PKG_DEPENDS:=		xorg-server
PKG_BUILDDEP+=		xorg-server
PKG_SITES:=		http://xorg.freedesktop.org/releases/individual/driver/

PKG_TARGET_DEPENDS:=	alix1c lemote

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XF86_VIDEO_FBDEV,${PKG_NAME},$(PKG_VERSION)-$(PKG_RELEASE),${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	${INSTALL_DIR} ${IDIR_XF86_VIDEO_FBDEV}/usr/lib/xorg/modules/drivers
	${CP} ${WRKINST}/usr/lib/xorg/modules/drivers/fbdev_*.so \
		${IDIR_XF86_VIDEO_FBDEV}/usr/lib/xorg/modules/drivers/

include ${TOPDIR}/mk/pkg-bottom.mk
