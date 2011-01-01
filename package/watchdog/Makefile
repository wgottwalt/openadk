# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		watchdog
PKG_VERSION:=		5.7
PKG_RELEASE:=		2
PKG_MD5SUM:=		31766450ecfc9aff70fe966c0b9df06d
PKG_DESCR:=		watchdog daemon
PKG_SECTION:=		utils
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=watchdog/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,WATCHDOG,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	${INSTALL_DIR} ${IDIR_WATCHDOG}/sbin ${IDIR_WATCHDOG}/etc/
	${INSTALL_DATA} ./files/watchdog.conf ${IDIR_WATCHDOG}/etc/
	${INSTALL_BIN} ${WRKINST}/sbin/watchdog \
		       ${IDIR_WATCHDOG}/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
