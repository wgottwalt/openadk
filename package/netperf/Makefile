# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		netperf
PKG_VERSION:=		2.3pl1
PKG_RELEASE:=		8
PKG_MD5SUM:=		b74314d78af31cb13516fb9a372d2e86
MASTER_SITES:=		ftp://ftp.netperf.org/netperf/archive/ \
			ftp://ftp.cup.hp.com/dist/networking/benchmarks/netperf/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,NETPERF,netperf,${PKG_VERSION}${PKG_RELEASE}))

BUILD_STYLE:=		auto
MAKE_FLAGS+=		TARGET_NETPERF_HOME="/etc/netperf.conf" \
			TARGET_CC=${TARGET_CROSS}gcc \
			TARGET_CFLAGS="${TCFLAGS}" \
			TARGET_LIBS=""
MAKE_FILE:=		makefile

do-install:
	${INSTALL_DIR} ${IDIR_NETPERF}/etc/init.d
	${INSTALL_DIR} ${IDIR_NETPERF}/usr/bin
	${INSTALL_BIN} ./files/netserver.init \
		${IDIR_NETPERF}/etc/init.d/netserver
	${INSTALL_BIN} ${WRKBUILD}/netperf ${IDIR_NETPERF}/usr/bin/
	${INSTALL_BIN} ${WRKBUILD}/netserver ${IDIR_NETPERF}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
