# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		xf86-video-ati
PKG_VERSION:=		7.8.0
PKG_RELEASE:=		1
PKG_HASH:=		da8c721f04c0cdb0b05b084581d2c1457543351a98de4aa0de3e3852512389b6
PKG_DESCR:=		x11 driver for ati vga chip
PKG_SECTION:=		x11/drivers
PKG_DEPENDS:=		xorg-server libdrm mesa libudev
PKG_BUILDDEP:=		xorg-server libdrm xf86driproto mesa eudev
PKG_NEEDS:=		c++
PKG_SITES:=		http://www.x.org/releases/individual/driver/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_ARCH_DEPENDS:=      !arm !m68k
PKG_CFLINE_XF86_VIDEO_ATI:=depends on ADK_TARGET_WITH_VGA

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XF86_VIDEO_ATI,xf86-video-ati,$(PKG_VERSION)-$(PKG_RELEASE),${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--enable-dri \
			--disable-glamor

xf86-video-ati-install:
	${INSTALL_DIR} ${IDIR_XF86_VIDEO_ATI}/usr/lib/xorg/modules/drivers
	${CP} ${WRKINST}/usr/lib/xorg/modules/drivers/*.so \
		${IDIR_XF86_VIDEO_ATI}/usr/lib/xorg/modules/drivers/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
