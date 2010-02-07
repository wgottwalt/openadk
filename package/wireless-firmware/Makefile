# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		wireless-firmware
PKG_VERSION:=		1
PKG_RELEASE:=		1
PKG_MD5SUM:=		d4c690c93b470bc9a681297c2adc6281
PKG_DESCR:=		firmware for rt61/rt2601 wireless cards
PKG_SECTION:=		sys
PKG_SITES:=		http://www.ralinktech.com.tw/data/

DISTFILES:=		RT61_Firmware_V1.2.zip
WRKDIST=		${WRKDIR}/RT61_Firmware_V1.2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,WIRELESS_FIRMWARE_RT61,wireless-firmware-rt61,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
BUILD_STYLE:=           manual
INSTALL_STYLE:=         manual

do-install:
	${INSTALL_DIR} ${IDIR_WIRELESS_FIRMWARE_RT61}/lib/firmware
	${CP} ${WRKBUILD}/rt2*.bin \
		${IDIR_WIRELESS_FIRMWARE_RT61}/lib/firmware

include ${TOPDIR}/mk/pkg-bottom.mk
