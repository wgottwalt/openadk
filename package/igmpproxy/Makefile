# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		igmpproxy
PKG_VERSION:=		0.1
PKG_RELEASE:=		3
PKG_MD5SUM:=		c56f41ec195bc1fe016369bf74efc5a1
PKG_DESCR:=		a simple dynamic Multicast Routing Daemon
PKG_SECTION:=		proxy
PKG_URL:=		http://sourceforge.net/projects/igmpproxy/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=igmpproxy/}

CFLINE_IGMPPROXY=	select ADK_KERNEL_IP_MULTICAST\n\tselect ADK_KERNEL_IP_MROUTE

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,IGMPPROXY,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TCFLAGS+=		-std=gnu99

post-install:
	${INSTALL_DIR} ${IDIR_IGMPPROXY}/usr/sbin ${IDIR_IGMPPROXY}/etc
	${INSTALL_BIN} ${WRKINST}/usr/sbin/igmpproxy \
		 ${IDIR_IGMPPROXY}/usr/sbin/
	${INSTALL_DATA} ${WRKINST}/etc/igmpproxy.conf ${IDIR_IGMPPROXY}/etc

include ${TOPDIR}/mk/pkg-bottom.mk
