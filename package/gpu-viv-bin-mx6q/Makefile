# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		gpu-viv-bin-mx6q
PKG_VERSION:=		3.10.17-1.0.2
PKG_RELEASE:=		1
PKG_HASH:=		d480546638b39d37b7e571d131b480a2f2f0380299ea6b2b691a02b2173ea273
PKG_DESCR:=		imx vivante gpu library
PKG_SECTION:=		libs/video
PKG_DEPENDS:=		libfslvpuwrap imx-lib imx-vpu gpu-viv-g2d
PKG_BUILDDEP:=		libfslvpuwrap imx-lib imx-vpu gpu-viv-g2d
PKG_URL:=		http://www.freescale.com/
PKG_SITES:=		http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/

PKG_SYSTEM_DEPENDS:=	solidrun-imx6

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}-hfp.bin
WRKDIST=		${WRKDIR}/${PKG_NAME}-${PKG_VERSION}-hfp

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,GPU_VIV_BIN_MX6Q,gpu-viv-bin-mx6q,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

gpu-viv-bin-mx6q-install:
	$(INSTALL_DIR) $(IDIR_GPU_VIV_BIN_MX6Q)/usr/lib
	$(CP) $(WRKBUILD)/usr/lib/lib*.so* \
		$(IDIR_GPU_VIV_BIN_MX6Q)/usr/lib
	$(INSTALL_DIR) $(STAGING_TARGET_DIR)/usr/include
	$(CP) $(WRKBUILD)/usr/include/* \
		$(STAGING_TARGET_DIR)/usr/include
	-rm -r $(IDIR_GPU_VIV_BIN_MX6Q)/usr/lib/libGL.so*

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
