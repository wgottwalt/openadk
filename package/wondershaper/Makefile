# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		wondershaper
PKG_VERSION:=		1.1a
PKG_RELEASE:=		7
PKG_MD5SUM:=		bbc5a3a4485ab286e337ce8550e7b990
PKG_DESCR:=		tc based traffic shaping tool
PKG_SECTION:=		net/firewall
PKG_URL:=		http://lartc.org/wondershaper/
PKG_SITES:=		http://lartc.org/wondershaper/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,WONDERSHAPER,wondershaper,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
BUILD_STYLE:=           manual
INSTALL_STYLE:=         manual

do-install:
	${INSTALL_DIR} ${IDIR_WONDERSHAPER}/usr/sbin ${IDIR_WONDERSHAPER}/etc
	${INSTALL_BIN} ${WRKBUILD}/wshaper.htb \
		${IDIR_WONDERSHAPER}/usr/sbin/wshaper
	${INSTALL_DATA} ${WRKBUILD}/wshaper.conf ${IDIR_WONDERSHAPER}/etc/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
