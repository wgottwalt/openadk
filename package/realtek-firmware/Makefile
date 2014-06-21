# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		realtek-firmware
PKG_VERSION:=		1.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		85a7d1d1386143fad312a5a82c422380
PKG_DESCR:=		firmware for realtek wireless cards
PKG_SECTION:=		sys/firmware
PKG_SITES:=		http://www.openadk.org/distfiles/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,REALTEK_FIRMWARE,realtek-firmware,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
BUILD_STYLE:=           manual
INSTALL_STYLE:=         manual

do-install:
	${INSTALL_DIR} ${IDIR_REALTEK_FIRMWARE}/lib/firmware/rtlwifi
	${CP} ${WRKBUILD}/*.bin \
		${IDIR_REALTEK_FIRMWARE}/lib/firmware/rtlwifi

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
