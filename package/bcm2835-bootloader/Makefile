# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		bcm2835-bootloader
# actually 9953ce0847c04b587b694c79c5b5a4ac63f5c369 from 25.03.2014
# https://github.com/raspberrypi/firmware
PKG_VERSION:=		0.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		7ad7e5d3ad311d88d1e82fc729042d87
PKG_DESCR:=		bootloader for raspberry pi (bcm2835)
PKG_SECTION:=		boot
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
