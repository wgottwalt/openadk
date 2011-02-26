# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xf86-video-cirrus
PKG_VERSION:=		1.3.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		c63a29917c48d0c317445991fc36d09a
PKG_DESCR:=		X11 driver for Cirrus VGA chips
PKG_SECTION:=		x11/drivers
PKG_DEPENDS:=		xorg-server
PKG_BUILDDEP:=		xorg-server
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_NEED_CXX:=		1

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XF86_VIDEO_CIRRUS,${PKG_NAME},$(PKG_VERSION)-$(PKG_RELEASE),${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	${INSTALL_DIR} ${IDIR_XF86_VIDEO_CIRRUS}/usr/lib/xorg/modules/drivers
	${CP} ${WRKINST}/usr/lib/xorg/modules/drivers/cirrus_*.so \
		${IDIR_XF86_VIDEO_CIRRUS}/usr/lib/xorg/modules/drivers/

include ${TOPDIR}/mk/pkg-bottom.mk
