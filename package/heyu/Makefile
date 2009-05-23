# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		heyu
PKG_VERSION:=		2.3.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		af3eeeaa8c432e5b3510f4df6dd39f4f
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tgz
MASTER_SITES:=		http://heyu.tanj.com/download/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,HEYU,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE}))

do-build:
	(cd ${WRKBUILD} && ${BASH} ./Configure);
	${MAKE} -C ${WRKBUILD} \
		CC="${TARGET_CC}" LD=${TARGET_CROSS}ld \
		CFLAGS="${TARGET_CFLAGS} -I${WRKBUILD} -DSYSV -DPOSIX -DHAS_ITIMER -DLINUX -DHASSELECT -DHASTZ"

do-install:
	${INSTALL_DIR} ${IDIR_HEYU}/etc/${PKG_NAME}
	${INSTALL_DATA} ./files/x10.conf ${IDIR_HEYU}/etc/${PKG_NAME}/x10.conf
	${INSTALL_DIR} ${IDIR_HEYU}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/heyu ${IDIR_HEYU}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
