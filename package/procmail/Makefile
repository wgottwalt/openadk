# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		procmail
PKG_VERSION:=		3.22
PKG_RELEASE:=		1
PKG_MD5SUM:=		1678ea99b973eb77eda4ecf6acae53f1
MASTER_SITES:=		http://www.procmail.org/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PROCMAIL,procmail,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

do-build:
	${MAKE} -C ${WRKBUILD}/src -f ../Makefile.new  \
		CC="${TARGET_CC}"

do-install:
	${INSTALL_DIR} ${IDIR_PROCMAIL}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/src/procmail ${IDIR_PROCMAIL}/usr/bin/
	${INSTALL_BIN} ${WRKBUILD}/src/formail ${IDIR_PROCMAIL}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
