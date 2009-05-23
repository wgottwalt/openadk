# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		reaim
PKG_VERSION:=		0.8
PKG_RELEASE:=		9
PKG_MD5SUM:=		647d2ab72ec454f89294accfb3182c09
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=reaim/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,REAIM,reaim,${PKG_VERSION}-${PKG_RELEASE}))

BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_REAIM}/etc/init.d
	${INSTALL_DIR} ${IDIR_REAIM}/usr/sbin
	${INSTALL_BIN} ./files/reaim.init \
		${IDIR_REAIM}/etc/init.d/reaim
	${INSTALL_BIN} ${WRKINST}/usr/sbin/reaim ${IDIR_REAIM}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
