# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		sysstat
PKG_VERSION:=		7.0.3
PKG_RELEASE:=		3
PKG_MD5SUM:=		732904b006a0224b0a9ce4d312946277
PKG_DESCR:=		utilities for system monitoring and performance analysis
PKG_SECTION:=		sys/utils
PKG_SITES:=		http://perso.orange.fr/sebastien.godard/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SYSSTAT,sysstat,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual

do-configure:
	${CP} ./files/CONFIG ${WRKBUILD}/build/

sysstat-install:
	${INSTALL_DIR} ${IDIR_SYSSTAT}/usr/lib/sa
	${INSTALL_BIN} ${WRKINST}/usr/lib/sa/sa1 ${IDIR_SYSSTAT}/usr/lib/sa
	${INSTALL_BIN} ${WRKINST}/usr/lib/sa/sa2 ${IDIR_SYSSTAT}/usr/lib/sa
	${INSTALL_BIN} ${WRKINST}/usr/lib/sa/sadc ${IDIR_SYSSTAT}/usr/lib/sa
	${INSTALL_DIR} ${IDIR_SYSSTAT}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/sar ${IDIR_SYSSTAT}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/sadf ${IDIR_SYSSTAT}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/iostat ${IDIR_SYSSTAT}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/mpstat ${IDIR_SYSSTAT}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
