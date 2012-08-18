# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		b43-firmware
PKG_VERSION:=		1.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		b53e1234c596c49f9ee0c11d04d989ed
PKG_DESCR:=		firmware for b43 wireless cards
PKG_SECTION:=		wifi
PKG_SITES:=		http://openadk.org/distfiles/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,B43_FIRMWARE,b43-firmware,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
BUILD_STYLE:=           manual
INSTALL_STYLE:=         manual

do-install:
	${INSTALL_DIR} ${IDIR_B43_FIRMWARE}/lib/firmware
	${CP} ${WRKBUILD}/* ${IDIR_B43_FIRMWARE}/lib/firmware/

include ${TOPDIR}/mk/pkg-bottom.mk
