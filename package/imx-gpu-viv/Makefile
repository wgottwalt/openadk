# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		imx-gpu-viv
PKG_VERSION:=		5.0.11.p4.4
PKG_RELEASE:=		1
PKG_HASH:=		92654c185835e139cc9485806ad184fdac21f4d640ec9d0e493669235d21de9b
PKG_DESCR:=		imx vivante gpu library
PKG_SECTION:=		libs/video
PKG_URL:=		http://www.freescale.com/
PKG_SITES:=		http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}-hfp.bin
WRKDIST=		${WRKDIR}/${PKG_NAME}-${PKG_VERSION}-hfp

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,IMX_GPU_VIV,imx-gpu-viv,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

imx-gpu-viv-install:
	$(INSTALL_DIR) $(IDIR_IMX_GPU_VIV)/usr/lib
	$(CP) $(WRKBUILD)/gpu-core/usr/lib/lib*.so* \
		$(IDIR_IMX_GPU_VIV)/usr/lib
	$(CP) $(WRKBUILD)/g2d/usr/lib/lib*.so* \
		$(IDIR_IMX_GPU_VIV)/usr/lib
	$(INSTALL_DIR) $(STAGING_TARGET_DIR)/usr/include
	$(CP) $(WRKBUILD)/gpu-core/usr/include/* \
		$(STAGING_TARGET_DIR)/usr/include
	$(CP) $(WRKBUILD)/g2d/usr/include/* \
		$(STAGING_TARGET_DIR)/usr/include

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
