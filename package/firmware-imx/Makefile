# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		firmware-imx
PKG_VERSION:=		3.10.17-1.0.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		29a54f6e5bf889a00cd8ca85080af223
PKG_DESCR:=		IMX firmware (Freescale)
PKG_SECTION:=		sys/firmware
PKG_URL:=		http://www.freescale.com/
PKG_SITES:=		http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/

PKG_SYSTEM_DEPENDS:=	solidrun-imx6

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.bin

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,FIRMWARE_IMX,firmware-imx,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

firmware-imx-install:
	$(INSTALL_DIR) $(IDIR_FIRMWARE_IMX)/lib/firmware
	${CP} ${WRKBUILD}/firmware/{sdma,vpu} \
		$(IDIR_FIRMWARE_IMX)/lib/firmware

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
