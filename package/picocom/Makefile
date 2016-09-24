# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		picocom
PKG_VERSION:=		2.1
PKG_RELEASE:=		1
PKG_HASH:=		6b152fc5f816eaef6b86336a4cec7cf1496b7c712061e5aea5a36f143a0b09ed
PKG_DESCR:=		minimal dumb-terminal emulation program
PKG_SECTION:=		sys/serial
PKG_URL:=		https://github.com/npat-efault/picocom/
PKG_SITES:=		https://github.com/npat-efault/picocom/archive/

DISTFILES:=		${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PICOCOM,picocom,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
INSTALL_STYLE:=         manual
ALL_TARGET:=		picocom

do-install:
	${INSTALL_DIR} ${IDIR_PICOCOM}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/picocom ${IDIR_PICOCOM}/usr/bin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
