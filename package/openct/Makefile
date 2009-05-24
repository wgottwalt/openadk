# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		openct
PKG_VERSION:=		0.6.15
PKG_RELEASE:=		1
PKG_MD5SUM:=		70205beac03974e266fc259b6c9feaa8
MASTER_SITES:=		http://www.opensc-project.org/files/openct/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,OPENCT,openct,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_OPENCT}/etc
	${INSTALL_DIR} ${IDIR_OPENCT}/usr/bin
	${INSTALL_DIR} ${IDIR_OPENCT}/usr/sbin
	${INSTALL_DIR} ${IDIR_OPENCT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libopenct.so.* \
		${IDIR_OPENCT}/usr/lib
	${INSTALL_BIN} ${WRKINST}/usr/sbin/openct-control \
		${IDIR_OPENCT}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/ifd* \
		${IDIR_OPENCT}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/bin/openct-tool \
		${IDIR_OPENCT}/usr/bin
	${INSTALL_DATA} ${WRKBUILD}/etc/openct.conf \
		${IDIR_OPENCT}/etc

		
include ${TOPDIR}/mk/pkg-bottom.mk
