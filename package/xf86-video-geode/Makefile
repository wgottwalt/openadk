# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xf86-video-geode
PKG_VERSION:=		2.11.15
PKG_RELEASE:=		1
PKG_MD5SUM:=		a38a23055fcabed87dbd5e7c9e32bc05
PKG_DESCR:=		X11 driver for AMD Geode VGA chip
PKG_SECTION:=		x11/drivers
PKG_DEPENDS:=		xorg-server
PKG_BUILDDEP:=		xorg-server
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_NEED_CXX:=		1

PKG_ARCH_DEPENDS:=	x86
PKG_CFLINE_XF86_VIDEO_GEODE:=	depends on ADK_TARGET_WITH_VGA
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XF86_VIDEO_GEODE,xf86-video-geode,$(PKG_VERSION)-$(PKG_RELEASE),${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--with-pic

xf86-video-geode-install:
	${INSTALL_DIR} ${IDIR_XF86_VIDEO_GEODE}/usr/lib/xorg/modules/drivers
	${CP} ${WRKINST}/usr/lib/xorg/modules/drivers/geode_drv.so \
		${IDIR_XF86_VIDEO_GEODE}/usr/lib/xorg/modules/drivers/

include ${TOPDIR}/mk/pkg-bottom.mk
