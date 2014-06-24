# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		comgt
PKG_VERSION:=		0.32
PKG_RELEASE:=		3
PKG_MD5SUM:=		db2452680c3d953631299e331daf49ef
PKG_DESCR:=		3g/gprs datacard control tool
PKG_SECTION:=		sys/hw
PKG_URL:=		http://sourceforge.net/projects/comgt
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=comgt/}

DISTFILES:=		${PKG_NAME}.${PKG_VERSION}.tgz
WRKDIST=		${WRKDIR}/${PKG_NAME}.${PKG_VERSION}

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,COMGT,comgt,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
INSTALL_STYLE:=		manual
ALL_TARGET=		comgt

do-install:
	${INSTALL_DIR} ${IDIR_COMGT}/usr/bin ${IDIR_COMGT}/etc/comgt
	${INSTALL_BIN} ${WRKBUILD}/comgt ${IDIR_COMGT}/usr/bin/comgt
	${INSTALL_DATA} ./files/*.comgt ${IDIR_COMGT}/etc/comgt/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
