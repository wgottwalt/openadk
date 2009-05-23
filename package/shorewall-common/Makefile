# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		shorewall-common
PKG_VERSION:=		4.0.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		2df43356b1fdbc91920d48c5595aa101
MASTER_SITES:=		http://www1.shorewall.net/pub/shorewall/4.0/shorewall-${PKG_VERSION}/
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SHOREWALL,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE}))

do-install:
	PREFIX="${WRKINST}" ${WRKBUILD}/install.sh -n

	# remove configfiles folder
	${RM} -R ${WRKINST}/usr/share/shorewall/configfiles

ifeq ($(ADK_PACKAGE_SHOREWALL_STRIPCONF),y)
	${BASH} ./files/downstrip ${WRKINST}/etc/shorewall 
endif

ifeq ($(ADK_PACKAGE_SHOREWALL_STRIPSHARED),y)
	${BASH} ./files/downstrip ${WRKINST}/usr/share/shorewall
	${BASH} ./files/downstrip ${WRKINST}/sbin
	gzip -9 ${WRKINST}/usr/share/shorewall/*.template
endif

post-install:
	${INSTALL_DIR} ${IDIR_SHOREWALL}/etc/init.d
	${INSTALL_DIR} ${IDIR_SHOREWALL}/etc/shorewall
	${INSTALL_DIR} ${IDIR_SHOREWALL}/usr/share/shorewall
	${INSTALL_DIR} ${IDIR_SHOREWALL}/sbin

	${INSTALL_BIN} ./files/shorewall.init ${IDIR_SHOREWALL}/etc/init.d/shorewall

	${INSTALL_DATA} ${WRKINST}/etc/shorewall/* ${IDIR_SHOREWALL}/etc/shorewall/
	${INSTALL_DATA} ${WRKINST}/usr/share/shorewall/actions.std ${IDIR_SHOREWALL}/usr/share/shorewall/
	${INSTALL_DATA} ${WRKINST}/usr/share/shorewall/configpath ${IDIR_SHOREWALL}/usr/share/shorewall/
	${INSTALL_DATA} ${WRKINST}/usr/share/shorewall/modules ${IDIR_SHOREWALL}/usr/share/shorewall/
	${INSTALL_DATA} ${WRKINST}/usr/share/shorewall/rfc1918 ${IDIR_SHOREWALL}/usr/share/shorewall/
	${INSTALL_DATA} ${WRKINST}/usr/share/shorewall/version ${IDIR_SHOREWALL}/usr/share/shorewall/
	${INSTALL_DATA} ${WRKINST}/usr/share/shorewall/action.* ${IDIR_SHOREWALL}/usr/share/shorewall/
	${INSTALL_DATA} ${WRKINST}/usr/share/shorewall/macro.* ${IDIR_SHOREWALL}/usr/share/shorewall/
	${INSTALL_DATA} ${WRKINST}/usr/share/shorewall/lib.* ${IDIR_SHOREWALL}/usr/share/shorewall/

	${INSTALL_BIN} ${WRKINST}/usr/share/shorewall/firewall ${IDIR_SHOREWALL}/usr/share/shorewall/
	${INSTALL_BIN} ${WRKINST}/usr/share/shorewall/functions ${IDIR_SHOREWALL}/usr/share/shorewall/
	${INSTALL_BIN} ${WRKINST}/usr/share/shorewall/wait4ifup ${IDIR_SHOREWALL}/usr/share/shorewall/
	${INSTALL_BIN} ${WRKINST}/sbin/shorewall ${IDIR_SHOREWALL}/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
