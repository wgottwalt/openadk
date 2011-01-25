# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xf86-video-geode
PKG_VERSION:=		2.11.10
PKG_RELEASE:=		1
PKG_MD5SUM:=		df78ec2c76598b9b3a3f00c7b9215414
PKG_DESCR:=		X11 driver for AMD Geode VGA chip
PKG_SECTION:=		x11/drivers
PKG_DEPENDS:=		xorg-server
PKG_BUILDDEP:=		xorg-server
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_CFLINE_XF86_VIDEO_GEODE:=	depends on ADK_TARGET_WITH_VGA

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XF86_VIDEO_GEODE,${PKG_NAME},$(PKG_VERSION)-$(PKG_RELEASE),${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	${INSTALL_DIR} ${IDIR_XF86_VIDEO_GEODE}/usr/lib/xorg/modules/drivers
	${CP} ${WRKINST}/usr/lib/xorg/modules/drivers/geode_drv.so \
		${IDIR_XF86_VIDEO_GEODE}/usr/lib/xorg/modules/drivers/

include ${TOPDIR}/mk/pkg-bottom.mk
