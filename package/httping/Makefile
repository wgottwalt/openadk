# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		httping
PKG_VERSION:=		1.2.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		b257586da8acec18185c134ed86d2fdd
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tgz
MASTER_SITES:=		http://www.vanheusden.com/httping/

PKG_DEPEND=libopenssl
ifneq (${ADK_PACKAGE_HTTPING_WITH_SSL},y)
SSL_ENABLE:=".nossl"
PKG_DEPEND:=""
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,HTTPING,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

do-build:
	${MAKE} -C ${WRKBUILD} -f ${WRKBUILD}/Makefile${SSL_ENABLE} \
		CC="${TARGET_CC}" STAGING_DIR=${STAGING_DIR}

do-install:
	${INSTALL_DIR} ${IDIR_HTTPING}/usr/sbin
	echo "Depends: ${PKG_DEPEND}" >> ${IDIR_HTTPING}/CONTROL/control
	${CP} ${WRKBUILD}/${PKG_NAME} ${IDIR_HTTPING}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
