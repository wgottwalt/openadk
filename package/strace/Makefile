# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		strace
PKG_VERSION:=		4.5.18
PKG_RELEASE:=		1
PKG_MD5SUM:=		e9449fcee97e6a8ed73934c883c870e0
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=strace/}
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,STRACE,strace,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto

do-install:
	${INSTALL_DIR} ${IDIR_STRACE}/usr/sbin/
	${INSTALL_BIN} ${WRKBUILD}/${PKG_NAME} ${IDIR_STRACE}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
