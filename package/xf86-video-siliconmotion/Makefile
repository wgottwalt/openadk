# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xf86-video-siliconmotion
PKG_VERSION:=		1.7.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		39da891cd368960443613e7a61398216
PKG_DESCR:=		X11 driver for Silicon Motion VGA chips
PKG_SECTION:=		x11/drivers
PKG_DEPENDS:=		xorg-server
PKG_BUILDDEP+=		xorg-server
PKG_SITES:=		http://xorg.freedesktop.org/releases/individual/driver/

PKG_TARGET_DEPENDS:=	lemote native

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XF86_VIDEO_SILICONMOTION,${PKG_NAME},$(PKG_VERSION)-$(PKG_RELEASE),${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	${INSTALL_DIR} ${IDIR_XF86_VIDEO_SILICONMOTION}/usr/lib/xorg/modules/drivers
	${CP} ${WRKINST}/usr/lib/xorg/modules/drivers/siliconmotion_*.so \
		${IDIR_XF86_VIDEO_SILICONMOTION}/usr/lib/xorg/modules/drivers/

include ${TOPDIR}/mk/pkg-bottom.mk
