# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ez-ipupdate
PKG_VERSION:=		3.0.11b8
PKG_RELEASE:=		10
PKG_MD5SUM:=		000211add4c4845ffa4211841bff4fb0
PKG_DESCR:=		a client for dynamic DNS services
PKG_SECTION:=		net
PKG_URL:=		http://ez-ipupdate.com
PKG_SITES:=		http://ftp.debian.org/debian/pool/main/e/ez-ipupdate/ \
			http://ftp.de.debian.org/debian/pool/main/e/ez-ipupdate/

DISTFILES:=		${PKG_NAME}_${PKG_VERSION}.orig.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,EZIPUPDATE,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto

do-install:
	${INSTALL_DIR} ${IDIR_EZIPUPDATE}/etc ${IDIR_EZIPUPDATE}/usr/sbin
	install -m0600 ./files/${PKG_NAME}.conf ${IDIR_EZIPUPDATE}/etc/
	${INSTALL_BIN} ${WRKBUILD}/${PKG_NAME} ${IDIR_EZIPUPDATE}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
