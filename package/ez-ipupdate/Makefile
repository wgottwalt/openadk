# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ez-ipupdate
PKG_VERSION:=		3.0.11b8
PKG_RELEASE:=		10
PKG_MD5SUM:=		000211add4c4845ffa4211841bff4fb0
DISTFILES:=		${PKG_NAME}_${PKG_VERSION}.orig.tar.gz
MASTER_SITES:=		http://ftp.debian.org/debian/pool/main/e/ez-ipupdate/ \
			http://ftp.de.debian.org/debian/pool/main/e/ez-ipupdate/

include ${TOPDIR}/mk/package.mk

${eval ${call PKG_template,EZIPUPDATE,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE}}}

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto

do-install:
	${INSTALL_DIR} ${IDIR_EZIPUPDATE}/etc
	install -m0600 ./files/${PKG_NAME}.conf ${IDIR_EZIPUPDATE}/etc/
	${INSTALL_DIR} ${IDIR_EZIPUPDATE}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/${PKG_NAME} ${IDIR_EZIPUPDATE}/usr/sbin/
	${INSTALL_DIR} ${IDIR_EZIPUPDATE}/etc/init.d
	${INSTALL_SCRIPT} ./files/ez-ipupdate.init \
	    ${IDIR_EZIPUPDATE}/etc/init.d/ez-ipupdate

include ${TOPDIR}/mk/pkg-bottom.mk
