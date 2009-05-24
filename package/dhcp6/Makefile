# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		dhcp6
PKG_VERSION:=		1.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		86193dfa62137db3ea459543db4f1102
DISTFILES:=		dhcpv6-linux-${PKG_VERSION}.zip
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=dhcpv6-linux/}
WRKDIST=		${WRKDIR}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,DHCP6,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE}))

do-build:
	${MAKE} CC="${TARGET_CC}" STAGING_DIR=${STAGING_DIR} -C ${WRKBUILD}/server
	${MAKE} CC="${TARGET_CC}" STAGING_DIR=${STAGING_DIR} -C ${WRKBUILD}/client

do-install:
	${INSTALL_DIR} ${IDIR_DHCP6}/usr/sbin
	${INSTALL_DIR} ${IDIR_DHCP6}/etc/dhcp{d6,6}
	${INSTALL_BIN} ${WRKBUILD}/client/cli ${IDIR_DHCP6}/usr/sbin/dhcp6client
	${INSTALL_BIN} ${WRKBUILD}/server/serv ${IDIR_DHCP6}/usr/sbin/dhcpd6
	${CP} ${WRKBUILD}/server/*.conf ${IDIR_DHCP6}/etc/dhcpd6/
	${CP} ${WRKBUILD}/client/*.conf ${IDIR_DHCP6}/etc/dhcp6/

include ${TOPDIR}/mk/pkg-bottom.mk
