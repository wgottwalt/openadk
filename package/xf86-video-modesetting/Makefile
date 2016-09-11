# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		xf86-video-modesetting
PKG_VERSION:=		0.8.1
PKG_RELEASE:=		1
PKG_HASH:=		7cb67bc95e83f195bc5f50b6af0b4ff66b5b9ccd16848613d55d732bc1e5fdb6
PKG_DESCR:=		x11 driver for kms
PKG_SECTION:=		x11/drivers
PKG_DEPENDS:=		xorg-server libudev
PKG_BUILDDEP:=		xorg-server eudev
PKG_NEEDS:=		c++
PKG_SITES:=		http://www.x.org/releases/individual/driver/

PKG_SYSTEM_DEPENDS:=	qemu-x86 qemu-x86_64
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XF86_VIDEO_MODESETTING,xf86-video-modesetting,$(PKG_VERSION)-$(PKG_RELEASE),${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

xf86-video-modesetting-install:
	${INSTALL_DIR} ${IDIR_XF86_VIDEO_MODESETTING}/usr/lib/xorg/modules/drivers
	${CP} ${WRKINST}/usr/lib/xorg/modules/drivers/modesetting_*.so \
		${IDIR_XF86_VIDEO_MODESETTING}/usr/lib/xorg/modules/drivers/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
