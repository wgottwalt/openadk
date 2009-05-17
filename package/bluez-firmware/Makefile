# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		bluez-firmware
PKG_VERSION:=		1.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		1cc3cefad872e937e05de5a0a2b390dd
MASTER_SITES:=		http://bluez.sourceforge.net/download/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,BLUEZ_FIRMWARE,bluez-firmware,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--libdir=/lib
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_BLUEZ_FIRMWARE}/lib/firmware
	${CP} ${WRKINST}/lib/firmware/BCM* \
		${IDIR_BLUEZ_FIRMWARE}/lib/firmware

include ${TOPDIR}/mk/pkg-bottom.mk
