# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		cutter
PKG_VERSION:=		1.03
PKG_RELEASE:=		1
PKG_MD5SUM:=		50093db9b64277643969ee75b83ebbd1
PKG_DESCR:=		Abort TCP/IP connections routed over a firewall
PKG_SECTION:=		net
PKG_URL:=		http://www.lowth.com/cutter/software/
PKG_SITES:=		http://www.lowth.com/cutter/software/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tgz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,CUTTER,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

do-build:
	${TARGET_CC} ${TARGET_CFLAGS} ${WRKBUILD}/cutter.c -o ${WRKBUILD}/cutter

do-install:
	${INSTALL_DIR} ${IDIR_CUTTER}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/cutter ${IDIR_CUTTER}/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
