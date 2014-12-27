# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		picocom
PKG_VERSION:=		1.7
PKG_RELEASE:=		1
PKG_HASH:=		d0f31c8f7a215a76922d30c81a52b9a2348c89e02a84935517002b3bc2c1129e
PKG_DESCR:=		minimal dumb-terminal emulation program
PKG_SECTION:=		sys/serial
PKG_URL:=		http://code.google.com/p/picocom
PKG_SITES:=		http://picocom.googlecode.com/files/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PICOCOM,picocom,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
INSTALL_STYLE:=         manual
ALL_TARGET:=		picocom

do-install:
	${INSTALL_DIR} ${IDIR_PICOCOM}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/picocom ${IDIR_PICOCOM}/usr/bin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
