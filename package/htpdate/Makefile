# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		htpdate
PKG_VERSION:=		0.9.0
PKG_RELEASE:=		9
PKG_MD5SUM:=		12cf883c5619cf4c13a62f77f1a55b54
MASTER_SITES:=		http://www.clevervest.com/htp/archive/c/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,HTPDATE,htpdate,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

BUILD_STYLE=		auto

do-install:
	${INSTALL_DIR} ${IDIR_HTPDATE}/etc/init.d/
	${INSTALL_BIN} ./files/htpdate.init \
		${IDIR_HTPDATE}/etc/init.d/htpdate
	${INSTALL_DIR} ${IDIR_HTPDATE}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/htpdate ${IDIR_HTPDATE}/usr/sbin/


include ${TOPDIR}/mk/pkg-bottom.mk
