# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		shorewall-shell
PKG_VERSION:=		4.0.14.1
PKG_RELEASE:=		1
PKG_HASH:=		ff8e1eaf98f06e8fca611c83fd5bcacda464d80fb1c208e984160a839f0c23a6
PKG_DESCR:=		shell compiler for shorewall
PKG_SECTION:=		net/firewall
PKG_URL:=		http://www.shorewall.net
PKG_SITES:=		http://www1.shorewall.net/pub/shorewall/4.0/shorewall-4.0.14/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SHOREWALL_SHELL,shorewall-shell,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-build:
	PREFIX="${WRKINST}" ${WRKBUILD}/install.sh -n

ifeq ($(ADK_PACKAGE_SHOREWALL_STRIPSHARED),y)
	${BASH} ./files/downstrip ${WRKINST}/usr/share/${PKG_NAME}
endif

do-install:
	${INSTALL_DIR} ${IDIR_SHOREWALL_SHELL}/usr/share/${PKG_NAME}
	${INSTALL_DATA} ${WRKINST}/usr/share/${PKG_NAME}/version \
		${IDIR_SHOREWALL_SHELL}/usr/share/${PKG_NAME}/
	${INSTALL_DATA} ${WRKINST}/usr/share/${PKG_NAME}/lib.* \
		${IDIR_SHOREWALL_SHELL}/usr/share/${PKG_NAME}/
	${INSTALL_DATA} ${WRKINST}/usr/share/${PKG_NAME}/prog.* \
		${IDIR_SHOREWALL_SHELL}/usr/share/${PKG_NAME}/
	${INSTALL_BIN} ${WRKINST}/usr/share/${PKG_NAME}/compiler \
		${IDIR_SHOREWALL_SHELL}/usr/share/${PKG_NAME}/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
