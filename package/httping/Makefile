# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		httping
PKG_VERSION:=		1.3.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		41c912a9ecc904e51d7260053fc2195c
PKG_DESCR:=		Httping is like 'ping' but for http-requests
PKG_SECTION:=		net
PKG_DEPENDS:=		libopenssl
PKG_SITES:=		http://www.vanheusden.com/httping/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tgz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,HTTPING,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

MAKE_FLAGS+=		STAGING_DIR=${STAGING_DIR}
BUILD_STYLE:=		auto

do-install:
	${INSTALL_DIR} ${IDIR_HTTPING}/usr/sbin
	${CP} ${WRKBUILD}/${PKG_NAME} ${IDIR_HTTPING}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
