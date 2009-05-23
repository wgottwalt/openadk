# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		scsi-spin
PKG_VERSION:=		1.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		d0c32bfc500e94cc1905d9457a99cdbb
NO_DISTFILES:=		1

WRKDIST=		${WRKDIR}/scsi-spin

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SCSI_SPIN,scsi-spin,${PKG_VERSION}-${PKG_RELEASE}))

do-build:
	${TARGET_CC} ${TCFLAGS} -o ${WRKBUILD}/scsi-spin files/scsi-spin.c

do-install:
	${INSTALL_DIR} ${IDIR_SCSI_SPIN}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/scsi-spin ${IDIR_SCSI_SPIN}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
