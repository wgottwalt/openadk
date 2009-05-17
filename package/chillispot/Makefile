# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		chillispot
PKG_VERSION:=		1.1.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		9d2597756af3fa14d7331b4a3651fc9b
MASTER_SITES=		http://www.chillispot.info/download/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,CHILLISPOT,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_CHILLISPOT}/etc/init.d
	${INSTALL_DIR} ${IDIR_CHILLISPOT}/usr/sbin
	${INSTALL_BIN} ./files/chilli.conf \
		${IDIR_CHILLISPOT}/etc/
	${INSTALL_BIN} ./files/${PKG_NAME}.init \
		${IDIR_CHILLISPOT}/etc/init.d/chilli
	${INSTALL_BIN} ${WRKINST}/usr/sbin/chilli ${IDIR_CHILLISPOT}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
