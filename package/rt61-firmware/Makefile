# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		rt61-firmware
PKG_VERSION:=		1
PKG_RELEASE:=		1
PKG_MD5SUM:=		d4c690c93b470bc9a681297c2adc6281
PKG_DESCR:=		firmware for rt61/rt2601 wireless cards
PKG_SECTION:=		sys/firmware
PKG_SITES:=		http://www.openadk.org/distfiles/

DISTFILES:=		RT61_Firmware_V1.2.zip
WRKDIST=		${WRKDIR}/RT61_Firmware_V1.2

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,RT61_FIRMWARE,rt61-firmware,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
BUILD_STYLE:=           manual
INSTALL_STYLE:=         manual

do-install:
	${INSTALL_DIR} ${IDIR_RT61_FIRMWARE}/lib/firmware
	${CP} ${WRKBUILD}/rt2*.bin \
		${IDIR_RT61_FIRMWARE}/lib/firmware

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
