# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		bcm2835-bootloader
# actually 04ba1c03780ae708c9289bce14f56933e55e9c20 from 13.04.2014
PKG_VERSION:=		0.8
PKG_RELEASE:=		1
PKG_MD5SUM:=		08beaa7d66e7dd6b0ab58483d0f4ce40
PKG_DESCR:=		bootloader for raspberry pi (bcm2835)
PKG_SECTION:=		base/boot
PKG_URL:=		https://github.com/raspberrypi/firmware
PKG_SITES:=		http://openadk.org/distfiles/

PKG_SYSTEM_DEPENDS:=	raspberry-pi

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,BCM2835_BOOTLOADER,bcm2835-bootloader,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
BUILD_STYLE:=           manual
INSTALL_STYLE:=         manual

do-install:
	${INSTALL_DIR} ${IDIR_BCM2835_BOOTLOADER}/boot
	${CP} ${WRKBUILD}/boot/* ${IDIR_BCM2835_BOOTLOADER}/boot/

include ${TOPDIR}/mk/pkg-bottom.mk
