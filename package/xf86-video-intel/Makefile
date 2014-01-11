# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xf86-video-intel
PKG_VERSION:=		2.19.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		a5e655904e8da22acb0d9be1badf9815
PKG_DESCR:=		X11 driver for Intel VGA chip
PKG_SECTION:=		x11/drivers
PKG_DEPENDS:=		xorg-server libdrm mesalib
PKG_BUILDDEP:=		xorg-server libdrm xf86driproto MesaLib
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_NEED_CXX:=		1

PKG_ARCH_DEPENDS:=	!arm !avr32 !m68k
PKG_CFLINE_XF86_VIDEO_INTEL:=depends on ADK_TARGET_WITH_VGA

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XF86_VIDEO_INTEL,xf86-video-intel,$(PKG_VERSION)-$(PKG_RELEASE),${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--enable-dri

xf86-video-intel-install:
	${INSTALL_DIR} ${IDIR_XF86_VIDEO_INTEL}/usr/lib/xorg/modules/drivers
	${CP} ${WRKINST}/usr/lib/xorg/modules/drivers/*.so \
		${IDIR_XF86_VIDEO_INTEL}/usr/lib/xorg/modules/drivers/

include ${TOPDIR}/mk/pkg-bottom.mk
