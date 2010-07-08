# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		strace
PKG_VERSION:=		4.5.20
PKG_RELEASE:=		1
PKG_MD5SUM:=		64dfe10d9db0c1e34030891695ffca4b
PKG_DESCR:=		System call trace program
PKG_SECTION:=		debug
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=strace/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,STRACE,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

INSTALL_STYLE:=		manual

do-install:
	${INSTALL_DIR} ${IDIR_STRACE}/usr/sbin/
	${INSTALL_BIN} ${WRKBUILD}/strace ${IDIR_STRACE}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
