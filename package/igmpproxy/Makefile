# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		igmpproxy
PKG_VERSION:=		0.1_beta4
PKG_RELEASE:=		1
PKG_MD5SUM:=		0a16178aeca5d1bf54c129cec9597f85
PKG_DESCR:=		IGMPproxy is a simple dynamic Multicast Routing Daemon
PKG_SECTION:=		net
PKG_URL:=		http://sourceforge.net/projects/igmpproxy
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=igmpproxy/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,IGMPPROXY,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_IGMPPROXY}/usr/sbin ${IDIR_IGMPPROXY}/etc
	${INSTALL_BIN} ${WRKINST}/usr/sbin/${PKG_NAME} ${IDIR_IGMPPROXY}/usr/sbin/
	${INSTALL_DATA} ${WRKINST}/etc/${PKG_NAME}.conf ${IDIR_IGMPPROXY}/etc

include ${TOPDIR}/mk/pkg-bottom.mk
