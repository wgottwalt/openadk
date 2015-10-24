# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		picocom
PKG_VERSION:=		14288582f10e662732c32eb67ab49b64fd6206c2
PKG_RELEASE:=		1
PKG_DESCR:=		minimal dumb-terminal emulation program
PKG_SECTION:=		sys/serial
PKG_URL:=		https://github.com/npat-efault/picocom/
PKG_SITES:=		https://github.com/npat-efault/picocom.git

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
