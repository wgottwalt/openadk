# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		firmware-imx
PKG_VERSION:=		3.14.28-1.0.0
PKG_RELEASE:=		1
PKG_HASH:=		1f09acd4d605efc78a0672068a658cb16274811d2f444cf3ae7aaa075266746f
PKG_DESCR:=		imx vpu firmware
PKG_SECTION:=		sys/firmware
PKG_URL:=		http://www.freescale.com/
PKG_SITES:=		http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/

PKG_SYSTEM_DEPENDS:=	phytec-imx6 solidrun-imx6

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.bin

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,FIRMWARE_IMX,firmware-imx,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

firmware-imx-install:
	$(INSTALL_DIR) $(IDIR_FIRMWARE_IMX)/lib/firmware/vpu
	${CP} ${WRKBUILD}/firmware/vpu/vpu_fw_imx6* \
		$(IDIR_FIRMWARE_IMX)/lib/firmware/vpu

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
