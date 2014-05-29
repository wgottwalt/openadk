# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		pipacs
PKG_VERSION:=		0.1
PKG_RELEASE:=		2
PKG_DESCR:=		unix socket accounting/viewer program
PKG_SECTION:=		net/misc

NO_DISTFILES:=		1

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PIPACS,pipacs,${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
INSTALL_STYLE:=         manual

do-install:
	${INSTALL_DIR} ${IDIR_PIPACS}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/pipacs ${IDIR_PIPACS}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
