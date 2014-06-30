# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		bcm2835-bootloader
# actually git checkout from 30.06.2014
# affe5cd9d3e1e8dcc29509f12fc3ed5153f3fb67
PKG_VERSION:=		1.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		f2e8cc4f7093560588f658f472c2eadb
PKG_DESCR:=		bootloader for raspberry pi
PKG_SECTION:=		base/boot
PKG_URL:=		https://github.com/raspberrypi/firmware
PKG_SITES:=		http://openadk.org/distfiles/

PKG_SYSTEM_DEPENDS:=	raspberry-pi

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,BCM2835_BOOTLOADER,bcm2835-bootloader,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
BUILD_STYLE:=           manual
INSTALL_STYLE:=         manual

do-install:
	${INSTALL_DIR} ${IDIR_BCM2835_BOOTLOADER}/boot
	${CP} ${WRKBUILD}/boot/* ${IDIR_BCM2835_BOOTLOADER}/boot/
	printf "gpu_mem=$(ADK_TARGET_GPU_MEM)\n" >> \
		${IDIR_BCM2835_BOOTLOADER}/boot/config.txt

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
