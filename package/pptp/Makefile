# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		pptp
PKG_VERSION:=		1.8.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		4efce9f263e2c3f38d79d9df222476de
PKG_DESCR:=		a Point-to-Point Tunneling Protocol (PPTP) client
PKG_SECTION:=		ppp
PKG_DEPENDS:=		ppp kmod-net-ipgre
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=pptpclient/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PPTP,pptp,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
INSTALL_STYLE:=         manual

do-install:
	${INSTALL_DIR} ${IDIR_PPTP}/sbin
	${INSTALL_DIR} ${IDIR_PPTP}/usr/sbin
	${INSTALL_DIR} ${IDIR_PPTP}/etc/ppp
	${INSTALL_BIN} ./files/ifup.pptp ${IDIR_PPTP}/sbin/ifup.pptp
	${INSTALL_DATA} ./files/options.pptp ${IDIR_PPTP}/etc/ppp/
	${INSTALL_BIN} ${WRKBUILD}/pptp ${IDIR_PPTP}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
