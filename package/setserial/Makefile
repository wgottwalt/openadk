# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		setserial
PKG_VERSION:=		2.17
PKG_RELEASE:=		2
PKG_MD5SUM:=		c4867d72c41564318e0107745eb7a0f2
PKG_DESCR:=		configuration utility for serial ports
PKG_SECTION:=		sys/serial
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=setserial/}
PKG_BB:=		1

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SETSERIAL,setserial,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

INSTALL_STYLE:=         manual
TARGET_CPPFLAGS+=	-DFIOQSIZE=1

do-install:
	${INSTALL_DIR} ${IDIR_SETSERIAL}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/setserial ${IDIR_SETSERIAL}/usr/sbin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
