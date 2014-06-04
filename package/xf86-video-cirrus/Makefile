# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xf86-video-cirrus
PKG_VERSION:=		1.5.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		a00cf7eb9a9e27e9738cdbe716012b61
PKG_DESCR:=		x11 driver for cirrus vga chips
PKG_SECTION:=		x11/drivers
PKG_DEPENDS:=		xorg-server libstdcxx
PKG_BUILDDEP:=		xorg-server
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_SYSTEM_DEPENDS:=	qemu-x86 qemu-x86_64
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XF86_VIDEO_CIRRUS,xf86-video-cirrus,$(PKG_VERSION)-$(PKG_RELEASE),${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

xf86-video-cirrus-install:
	${INSTALL_DIR} ${IDIR_XF86_VIDEO_CIRRUS}/usr/lib/xorg/modules/drivers
	${CP} ${WRKINST}/usr/lib/xorg/modules/drivers/cirrus_*.so \
		${IDIR_XF86_VIDEO_CIRRUS}/usr/lib/xorg/modules/drivers/

include ${TOPDIR}/mk/pkg-bottom.mk
