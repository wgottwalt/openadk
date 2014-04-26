# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		picocom
PKG_VERSION:=		1.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		8eaba1d31407e8408674d6e57af447ef
PKG_DESCR:=		minimal dumb-terminal emulation program
PKG_SECTION:=		serial
PKG_URL:=		http://code.google.com/p/picocom
PKG_SITES:=		http://picocom.googlecode.com/files/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PICOCOM,picocom,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
INSTALL_STYLE:=         manual
ALL_TARGET:=		picocom

do-install:
	${INSTALL_DIR} ${IDIR_PICOCOM}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/picocom ${IDIR_PICOCOM}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
