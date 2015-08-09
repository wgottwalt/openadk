# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		gpu-viv-g2d
PKG_VERSION:=		3.10.17-1.0.2
PKG_RELEASE:=		1
PKG_HASH:=		585a19071d9801a02178b94434c8f6393fa59cd361e96b2721bb20562d287d28
PKG_DESCR:=		vivante 2d library
PKG_SECTION:=		libs/video
PKG_URL:=		http://www.freescale.com/
PKG_SITES:=		http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/

PKG_SYSTEM_DEPENDS:=	solidrun-imx6

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.bin

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,GPU_VIV_G2D,gpu-viv-g2d,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

gpu-viv-g2d-install:
	$(INSTALL_DIR) $(IDIR_GPU_VIV_G2D)/usr/lib
	$(CP) $(WRKBUILD)/usr/lib/lib*.so* \
		$(IDIR_GPU_VIV_G2D)/usr/lib
	$(INSTALL_DIR) $(STAGING_TARGET_DIR)/usr/include
	$(CP) $(WRKBUILD)/usr/include/* \
		$(STAGING_TARGET_DIR)/usr/include

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
