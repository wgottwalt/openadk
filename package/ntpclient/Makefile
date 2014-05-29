# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ntpclient
PKG_VERSION:=		2010_365
PKG_RELEASE:=		2
PKG_MD5SUM:=		a64689398f2df8933ee0d8da246e9eaa
PKG_DESCR:=		client for setting system time from ntp servers
PKG_SECTION:=		net/ntp
PKG_DEPENDS:=		libpthread
PKG_URL:=		http://doolittle.icarus.com/ntpclient/
PKG_SITES:=		http://doolittle.icarus.com/ntpclient/

DISTFILES:=		${PKG_NAME}_${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/${PKG_NAME}-2010

PKG_FLAVOURS_NTPCLIENT:=	STARTUP
PKGFD_STARTUP:=	Fetch time on startup

PKG_FLAVOURS_STRING_NTPCLIENT:=	HOST
PKGFD_HOST:=	Fetch time from this NTP host
PKGFX_HOST:=	pool.ntp.org
PKGFC_HOST:=	depends on ADK_PACKAGE_NTPCLIENT_STARTUP

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,NTPCLIENT,ntpclient,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
INSTALL_STYLE:=		manual

MAKE_FLAGS+=		CC='${TARGET_CC}' CFLAGS='${TARGET_CFLAGS}'
ALL_TARGET:=

do-install:
	${INSTALL_DIR} ${IDIR_NTPCLIENT}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/ntpclient ${IDIR_NTPCLIENT}/usr/sbin/

ifeq (${ADK_PACKAGE_NTPCLIENT_STARTUP},y)
	${INSTALL_DIR} ${IDIR_NTPCLIENT}/etc/init.d
	touch ${IDIR_NTPCLIENT}/etc/init.d/ntpclient
	echo -e "#!/bin/sh\n#INIT 91\nntpclient -h ${ADK_PACKAGE_NTPCLIENT_HOST} -s\nexit 0" > ${IDIR_NTPCLIENT}/etc/init.d/ntpclient
endif

include ${TOPDIR}/mk/pkg-bottom.mk
