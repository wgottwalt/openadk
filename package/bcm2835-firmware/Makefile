# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		bcm2835-firmware
# actually 5113ce63be622e50c1b3ec309798e5d091d219ac from 12.10.2013
PKG_VERSION:=		0.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		6f6a186ac50ddcb1a9abe8c4d4432b92
PKG_DESCR:=		firmware for raspberry pi (bcm2835)
PKG_SECTION:=		base
PKG_SITES:=		http://openadk.org/distfiles/

PKG_SYSTEM_DEPENDS:=	raspberry-pi

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,BCM2835_FIRMWARE,bcm2835-firmware,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
BUILD_STYLE:=           manual
INSTALL_STYLE:=         manual

do-install:
	${INSTALL_DIR} ${IDIR_BCM2835_FIRMWARE}/boot
	${CP} ${WRKBUILD}/boot/* ${IDIR_BCM2835_FIRMWARE}/boot/

include ${TOPDIR}/mk/pkg-bottom.mk
