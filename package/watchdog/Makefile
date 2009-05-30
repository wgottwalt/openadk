# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		watchdog
PKG_VERSION:=		5.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		66480128b9dabcced2e4c8db3e60fa50
PKG_DESCR:=		watchdog daemon
PKG_SECTION:=		sys
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=watchdog/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,WATCHDOG,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
XAKE_FLAGS+=		CCOPT="${TARGET_CFLAGS}" \
			INCLS="-I. -I${STAGING_DIR}/usr/include" \
			LIBS="-L${STAGING_DIR}/usr/lib"
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_WATCHDOG}/usr/sbin ${IDIR_WATCHDOG}/etc/
	${INSTALL_DATA} ${WRKINST}/etc/watchdog.conf ${IDIR_WATCHDOG}/etc/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/watchdog \
		       ${WRKINST}/usr/sbin/wd_keepalive ${IDIR_WATCHDOG}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
