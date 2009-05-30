# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ser2net
PKG_VERSION:=		2.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		5f83a3e8aec18331cb61069dccdfba47
PKG_DESCR:=		a program for allowing network connections to serial ports
PKG_SECTION:=		net
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=ser2net/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SER2NET,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_SER2NET}/etc ${IDIR_SER2NET}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/ser2net ${IDIR_SER2NET}/usr/sbin
	${INSTALL_DATA} ${WRKBUILD}/ser2net.conf ${IDIR_SER2NET}/etc

include ${TOPDIR}/mk/pkg-bottom.mk
