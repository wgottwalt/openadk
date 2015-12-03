# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		igmpproxy
PKG_VERSION:=		0.1
PKG_RELEASE:=		3
PKG_HASH:=		ee18ff3d8c3ae3a29dccb7e5eedf332337330020168bd95a11cece8d7d7ee6ae
PKG_DESCR:=		simple dynamic multicast routing daemon
PKG_SECTION:=		net/route
PKG_KDEPENDS:=		ip-multicast ip-mroute
PKG_URL:=		http://sourceforge.net/projects/igmpproxy/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=igmpproxy/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,IGMPPROXY,igmpproxy,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CFLAGS+=		-std=gnu99

igmpproxy-install:
	${INSTALL_DIR} ${IDIR_IGMPPROXY}/usr/sbin ${IDIR_IGMPPROXY}/etc
	${INSTALL_BIN} ${WRKINST}/usr/sbin/igmpproxy ${IDIR_IGMPPROXY}/usr/sbin
	${INSTALL_DATA} ${WRKINST}/etc/igmpproxy.conf ${IDIR_IGMPPROXY}/etc

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
