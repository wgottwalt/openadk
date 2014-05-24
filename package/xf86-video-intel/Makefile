# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xf86-video-intel
PKG_VERSION:=		2.99.911
PKG_RELEASE:=		1
PKG_MD5SUM:=		de51db2408a222ef1c52725f5aa2f185
PKG_DESCR:=		x11 driver for Intel VGA chips
PKG_SECTION:=		x11/drivers
PKG_DEPENDS:=		xorg-server libdrm mesalib libstdcxx
PKG_BUILDDEP:=		xorg-server libdrm xf86driproto MesaLib
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_SYSTEM_DEPENDS:=	ibm-x40
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XF86_VIDEO_INTEL,xf86-video-intel,$(PKG_VERSION)-$(PKG_RELEASE),${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--enable-dri

xf86-video-intel-install:
	${INSTALL_DIR} ${IDIR_XF86_VIDEO_INTEL}/usr/lib/xorg/modules/drivers
	${CP} ${WRKINST}/usr/lib/xorg/modules/drivers/*.so \
		${IDIR_XF86_VIDEO_INTEL}/usr/lib/xorg/modules/drivers/

include ${TOPDIR}/mk/pkg-bottom.mk
