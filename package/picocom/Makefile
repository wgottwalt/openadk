# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		picocom
PKG_VERSION:=		1.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		08fcc5f6bb9e7676a2569386d5ea9f70
MASTER_SITES:=		http://efault.net/npat/hacks/picocom/dist/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PICOCOM,picocom,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

BUILD_STYLE:=		auto
ALL_TARGET:=		picocom

do-install:
	${INSTALL_DIR} ${IDIR_PICOCOM}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/picocom ${IDIR_PICOCOM}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
