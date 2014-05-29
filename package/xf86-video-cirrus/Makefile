# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xf86-video-cirrus
PKG_VERSION:=		1.4.0
PKG_RELEASE:=		2
PKG_MD5SUM:=		439e3f5e29161f503bcfe23229dc7b17
PKG_DESCR:=		x11 driver for cirrus vga chips
PKG_SECTION:=		x11/drivers
PKG_DEPENDS:=		xorg-server libstdcxx
PKG_BUILDDEP:=		xorg-server autotool util-macros
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_SYSTEM_DEPENDS:=	qemu-x86 qemu-x86_64

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XF86_VIDEO_CIRRUS,xf86-video-cirrus,$(PKG_VERSION)-$(PKG_RELEASE),${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

AUTOTOOL_STYLE:=	autoreconf

xf86-video-cirrus-install:
	${INSTALL_DIR} ${IDIR_XF86_VIDEO_CIRRUS}/usr/lib/xorg/modules/drivers
	${CP} ${WRKINST}/usr/lib/xorg/modules/drivers/cirrus_*.so \
		${IDIR_XF86_VIDEO_CIRRUS}/usr/lib/xorg/modules/drivers/

include ${TOPDIR}/mk/pkg-bottom.mk
