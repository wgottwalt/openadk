# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		logrotate
PKG_VERSION:=		3.7.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		552639142e163745f6bcd4f1f3816d8a
DISTFILES:=		${PKG_NAME}_${PKG_VERSION}.orig.tar.gz
MASTER_SITES:=		http://ftp.debian.org/debian/pool/main/l/logrotate/

include ${TOPDIR}/mk/package.mk

${eval ${call PKG_template,LOGROTATE,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE}}}

TCFLAGS+=		-D_GNU_SOURCE -DLinux -DVERSION=\"$(VERSION)\"
ALL_TARGET=		logrotate
BUILD_STYLE=		auto

do-install:
	${INSTALL_DIR} ${IDIR_LOGROTATE}/usr/sbin
	${CP} ${WRKBUILD}/logrotate ${IDIR_LOGROTATE}/usr/sbin
	${INSTALL_DIR} ${IDIR_LOGROTATE}/etc/logrotate.d
	${CP} ./files/logrotate.conf ${IDIR_LOGROTATE}/etc

include ${TOPDIR}/mk/pkg-bottom.mk
