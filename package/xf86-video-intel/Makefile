# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xf86-video-intel
PKG_VERSION:=		2.9.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		b1926dc68cc10209fc2200729fb6162b
PKG_DESCR:=		X11 driver for Intel VGA chip
PKG_SECTION:=		x11/drivers
PKG_DEPENDS:=		xorg-server libdrm
PKG_BUILDDEP+=		xorg-server libdrm
PKG_SITES:=		http://www.x.org/releases/X11R7.5/src/driver/

PKG_TARGET_DEPENDS:=	ibmx40

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XF86_VIDEO_INTEL,${PKG_NAME},$(PKG_VERSION)-$(PKG_RELEASE),${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	${INSTALL_DIR} ${IDIR_XF86_VIDEO_INTEL}/usr/lib/xorg/modules/drivers
	${CP} ${WRKINST}/usr/lib/xorg/modules/drivers/intel_drv.so \
		${IDIR_XF86_VIDEO_INTEL}/usr/lib/xorg/modules/drivers/

include ${TOPDIR}/mk/pkg-bottom.mk
