# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xf86-video-intel
PKG_VERSION:=		2.13.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		df7e3644a34e97ead09f083ab48d4457
PKG_DESCR:=		X11 driver for Intel VGA chip
PKG_SECTION:=		x11/drivers
PKG_DEPENDS:=		xorg-server libdrm
PKG_BUILDDEP:=		xorg-server libdrm
PKG_SITES:=		http://xorg.freedesktop.org/archive/individual/driver/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XF86_VIDEO_INTEL,${PKG_NAME},$(PKG_VERSION)-$(PKG_RELEASE),${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--enable-dri

post-install:
	${INSTALL_DIR} ${IDIR_XF86_VIDEO_INTEL}/usr/lib/xorg/modules/drivers
	${CP} ${WRKINST}/usr/lib/xorg/modules/drivers/*.so \
		${IDIR_XF86_VIDEO_INTEL}/usr/lib/xorg/modules/drivers/

include ${TOPDIR}/mk/pkg-bottom.mk
