# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ebtables
PKG_VERSION:=		2.0.10
PKG_RELEASE:=		1
PKG_MD5SUM:=		6df055d6476d3ce6bd7eed302a39c40c
PKG_DESCR:=		ethernet bridging firewall tool
PKG_SECTION:=		firewall
PKG_URL:=		http://ebtables.sourceforge.net
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=ebtables/}

PKG_ARCH_DEPENDS:=	!avr32

DISTFILES:=		${PKG_NAME}-v${PKG_VERSION}-3.tar.gz
WRKDIST=		${WRKDIR}/${PKG_NAME}-v${PKG_VERSION}-3

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,EBTABLES,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual

post-install:
	${INSTALL_DIR} ${IDIR_EBTABLES}/etc
	${INSTALL_DIR} ${IDIR_EBTABLES}/usr/sbin ${IDIR_EBTABLES}/usr/lib
	${INSTALL_DATA} ${WRKINST}/etc/ethertypes ${IDIR_EBTABLES}/etc
	${INSTALL_BIN} ${WRKINST}/usr/sbin/ebtables ${IDIR_EBTABLES}/usr/sbin
	${CP} ${WRKINST}/usr/lib/*.so ${IDIR_EBTABLES}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
