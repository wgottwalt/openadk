# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		strace
PKG_VERSION:=		4.5.19
PKG_RELEASE:=		1
PKG_MD5SUM:=		2415e435d61e40315a298c80aced0cda
PKG_DESCR:=		System call trace program
PKG_SECTION:=		misc
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=strace/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,STRACE,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto

do-install:
	${INSTALL_DIR} ${IDIR_STRACE}/usr/sbin/
	${INSTALL_BIN} ${WRKBUILD}/${PKG_NAME} ${IDIR_STRACE}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
