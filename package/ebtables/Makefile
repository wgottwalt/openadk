# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		ebtables
PKG_VERSION:=		2.0.10
PKG_RELEASE:=		1
PKG_HASH:=		dc6f7b484f207dc712bfca81645f45120cb6aee3380e77a1771e9c34a9a4455d
PKG_DESCR:=		ethernet bridging firewall tool
PKG_SECTION:=		net/route
PKG_URL:=		http://ebtables.sourceforge.net
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=ebtables/}

DISTFILES:=		${PKG_NAME}-v${PKG_VERSION}-4.tar.gz
WRKDIST=		${WRKDIR}/${PKG_NAME}-v${PKG_VERSION}-4

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,EBTABLES,ebtables,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual

ebtables-install:
	${INSTALL_DIR} ${IDIR_EBTABLES}/etc
	${INSTALL_DIR} ${IDIR_EBTABLES}/usr/sbin ${IDIR_EBTABLES}/usr/lib
	${INSTALL_DATA} ${WRKINST}/etc/ethertypes ${IDIR_EBTABLES}/etc
	${INSTALL_BIN} ${WRKINST}/usr/sbin/ebtables ${IDIR_EBTABLES}/usr/sbin
	${CP} ${WRKINST}/usr/lib/*.so ${IDIR_EBTABLES}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
