# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		scsi-spin
PKG_VERSION:=		1.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		d0c32bfc500e94cc1905d9457a99cdbb
PKG_DESCR:=		Utility to spin down scsi disks
PKG_SECTION:=		misc

NO_DISTFILES:=		1

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SCSI_SPIN,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-build:
	${TARGET_CC} -Wall ${TCPPFLAGS} ${TCFLAGS} -o ${WRKBUILD}/scsi-spin \
		${WRKBUILD}/scsi-spin.c

do-install:
	${INSTALL_DIR} ${IDIR_SCSI_SPIN}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/scsi-spin ${IDIR_SCSI_SPIN}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
