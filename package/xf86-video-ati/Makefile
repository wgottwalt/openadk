# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xf86-video-ati
PKG_VERSION:=		6.14.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		6bb71cff9ad9c5c7b258b2b6c56fdc95
PKG_DESCR:=		X11 driver for ATI VGA chip
PKG_SECTION:=		x11/drivers
PKG_BUILDDEP:=		xorg-server libdrm xf86driproto MesaLib udev
PKG_DEPENDS:=		xorg-server libdrm mesalib udev
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_NEED_CXX:=		1

PKG_ARCH_DEPENDS:=      !avr32 !arm
PKG_CFLINE_XF86_VIDEO_ATI:=depends on ADK_TARGET_WITH_VGA

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XF86_VIDEO_ATI,${PKG_NAME},$(PKG_VERSION)-$(PKG_RELEASE),${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--enable-dri

post-install:
	${INSTALL_DIR} ${IDIR_XF86_VIDEO_ATI}/usr/lib/xorg/modules/drivers
	${CP} ${WRKINST}/usr/lib/xorg/modules/drivers/*.so \
		${IDIR_XF86_VIDEO_ATI}/usr/lib/xorg/modules/drivers/

include ${TOPDIR}/mk/pkg-bottom.mk
