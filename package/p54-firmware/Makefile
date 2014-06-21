# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		p54-firmware
PKG_VERSION:=		1
PKG_RELEASE:=		1
PKG_MD5SUM:=		8e8ab005a4f8f0123bcdc51bc25b47f6
PKG_DESCR:=		firmware for usb prism54 wireless cards
PKG_SECTION:=		sys/firmware
PKG_SITES:=		http://daemonizer.de/prism54/prism54-fw/fw-usb/

DISTFILES:=		2.13.24.0.lm87.arm
WRKDIST=		${WRKDIR}

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,P54_FIRMWARE,p54-firmware,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
BUILD_STYLE:=           manual
INSTALL_STYLE:=         manual

do-install:
	${INSTALL_DIR} ${IDIR_P54_FIRMWARE}/lib/firmware
	${CP} ${WRKBUILD}/*.arm \
		${IDIR_P54_FIRMWARE}/lib/firmware/isl3887usb

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
