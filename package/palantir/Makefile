# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		palantir
PKG_VERSION:=		2.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		3a5b1fb340857f6d8e357bf39b77583e
PKG_DESCR:=		A multichannel interactive streaming solution
PKG_SECTION:=		net
PKG_DEPENDS:=		libjpeg libpthread
PKG_URL:=		http://www.fastpath.it/products/palantir
PKG_SITES:=		http://www.fastpath.it/products/palantir/pub/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tgz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PALANTIR,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

do-build:
	mkdir -p ${WRKINST}/usr
	${MAKE} -C ${WRKBUILD}/server/libgsm \
		${TARGET_CONFIGURE_OPTS} \
		CCINC="${TCPPFLAGS}" \
		lib/libgsm.a
	${MAKE} -C ${WRKBUILD}/server \
		${TARGET_CONFIGURE_OPTS} \
		CFLAGS="-Wall -D_REENTRANT ${TCFLAGS} ${TCPPFLAGS} ${TLDFLAGS}" \
		palantir

do-install:
	${INSTALL_DIR} ${IDIR_PALANTIR}/etc
	${INSTALL_DIR} ${IDIR_PALANTIR}/usr/sbin
	${INSTALL_DATA} ${WRKBUILD}/server/palantir-mips.conf.sample \
	                ${IDIR_PALANTIR}/etc/palantir.conf
	${INSTALL_BIN} ${WRKBUILD}/server/palantir ${IDIR_PALANTIR}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
