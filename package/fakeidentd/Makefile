# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		fakeidentd
PKG_VERSION:=		2.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		ebf398bd1843a1fd8c71f5fcf4a6e4f7
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2
MASTER_SITES:=		http://distfiles.gentoo.org/distfiles/

WRKDIST=		${WRKDIR}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,FAKEIDENTD,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE}))

do-build:
	${TARGET_CC} -o ${WRKBUILD}/${PKG_NAME} ${WRKBUILD}/identd.c

do-install:
	${INSTALL_DIR} ${IDIR_FAKEIDENTD}/usr/sbin
	${INSTALL_DIR} ${IDIR_FAKEIDENTD}/etc/init.d
	${INSTALL_BIN} ${WRKBUILD}/fakeidentd ${IDIR_FAKEIDENTD}/usr/sbin/
	${CP} ./files/${PKG_NAME}.init \
		${IDIR_FAKEIDENTD}/etc/init.d/${PKG_NAME}

include ${TOPDIR}/mk/pkg-bottom.mk
