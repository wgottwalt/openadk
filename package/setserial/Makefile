# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		setserial
PKG_VERSION:=		2.17
PKG_RELEASE:=		2
PKG_MD5SUM:=		c4867d72c41564318e0107745eb7a0f2
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=setserial/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SETSERIAL,setserial,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto

do-install:
	${INSTALL_DIR} ${IDIR_SETSERIAL}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/setserial ${IDIR_SETSERIAL}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
