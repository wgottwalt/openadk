# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		dvb-firmware
PKG_VERSION:=		1
PKG_RELEASE:=		1
PKG_HASH:=		481f113c505ed186049287bd8e9ad8fcb8dbbb32f3bb718f04e4dc148b63c8e4
PKG_DESCR:=		firmware for dvb cards
PKG_SECTION:=		sys/firmware

NO_DISTFILES:=		1

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,DVB_FIRMWARE,dvb-firmware,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
BUILD_STYLE:=           manual
INSTALL_STYLE:=         manual

do-install:
	${INSTALL_DIR} ${IDIR_DVB_FIRMWARE}/lib/firmware
	${CP} ${WRKBUILD}/dvb-demod-si2165.fw \
		${IDIR_DVB_FIRMWARE}/lib/firmware

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
