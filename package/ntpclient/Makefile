# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ntpclient
PKG_VERSION:=		2007_365
PKG_RELEASE:=		2
PKG_MD5SUM:=		cb98711f11769cdd22fc592844cef414
PKG_DESCR:=		NTP client for setting system time from NTP servers
PKG_SECTION:=		net
PKG_DEPENDS:=		libpthread
PKG_URL:=		http://doolittle.icarus.com/ntpclient
PKG_SITES:=		http://doolittle.icarus.com/ntpclient/

DISTFILES:=		${PKG_NAME}_${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/${PKG_NAME}-2007

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,NTPCLIENT,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
INSTALL_STYLE:=		manual

MAKE_FLAGS+=		CC='${TARGET_CC}' CFLAGS='${TCFLAGS}'
ALL_TARGET:=

do-install:
	${INSTALL_DIR} ${IDIR_NTPCLIENT}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/ntpclient ${IDIR_NTPCLIENT}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
