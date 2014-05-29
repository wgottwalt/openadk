# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		brcm-bluetooth
PKG_VERSION:=		1.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		85a7d1d1386143fad312a5a82c422380
PKG_DESCR:=		firmware for broadcom bluetooth chips
PKG_SECTION:=		sys/firmware

NO_DISTFILES:=		1

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,BRCM_BLUETOOTH,brcm-bluetooth,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
BUILD_STYLE:=           manual
INSTALL_STYLE:=         manual

do-build:
	${TARGET_CC} ${TARGET_CPPFLAGS} ${TARGET_CFLAGS} ${TARGET_LDFLAGS} \
		-o ${WRKBUILD}/brcm_patchram ${WRKBUILD}/brcm_patchram.c

do-install:
	${INSTALL_DIR} ${IDIR_BRCM_BLUETOOTH}/lib/firmware/brcm
	${CP} ${WRKBUILD}/*.hcd ${IDIR_BRCM_BLUETOOTH}/lib/firmware/brcm
	${INSTALL_DIR} ${IDIR_BRCM_BLUETOOTH}/sbin
	${INSTALL_BIN} ${WRKBUILD}/brcm_patchram \
		${IDIR_BRCM_BLUETOOTH}/sbin/brcm_patchram

include ${TOPDIR}/mk/pkg-bottom.mk
