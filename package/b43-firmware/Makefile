# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		b43-firmware
PKG_VERSION:=		1.0
PKG_RELEASE:=		1
PKG_HASH:=		d327ceeb9315c45b08388b267f7820472680b88c0d02259939c09fbace740d35
PKG_DESCR:=		firmware for b43 wireless cards
PKG_SECTION:=		sys/firmware
PKG_SITES:=		http://distfiles.openadk.org/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,B43_FIRMWARE,b43-firmware,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
BUILD_STYLE:=           manual
INSTALL_STYLE:=         manual

do-install:
	${INSTALL_DIR} ${IDIR_B43_FIRMWARE}/lib/firmware
	${CP} ${WRKBUILD}/* ${IDIR_B43_FIRMWARE}/lib/firmware/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
