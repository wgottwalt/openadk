# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		hdparm
PKG_VERSION:=		6.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		ecea69f775396e4ab6112dcf9066239f
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=hdparm/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,HDPARM,hdparm,${PKG_VERSION}-${PKG_RELEASE}))

BUILD_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_HDPARM}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/hdparm ${IDIR_HDPARM}/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
