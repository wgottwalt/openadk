# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		firmware-imx
PKG_VERSION:=		3.10.31-1.1.0-beta
PKG_RELEASE:=		1
PKG_HASH:=		8fcfc713321c4ffaafee248feb392b7bc9b913b7abee5020fceaca1d1a49ac99
PKG_DESCR:=		IMX VPU firmware (Freescale)
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
	$(INSTALL_DIR) $(IDIR_FIRMWARE_IMX)/lib/firmware/vpu
	${CP} ${WRKBUILD}/firmware/vpu/vpu_fw_imx6* \
		$(IDIR_FIRMWARE_IMX)/lib/firmware/vpu

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
