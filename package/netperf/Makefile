# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		netperf
PKG_VERSION:=		2.4.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		391a0d98954c72a6ad7f08b8a115e1ce
PKG_DESCR:=		Program and service to do network performance measurement.
PKG_SECTION:=		net
PKG_URL:=		http://www.netperf.org/netperf/		
PKG_SITES:=		ftp://ftp.netperf.org/netperf/archive/ \
			ftp://ftp.cup.hp.com/dist/networking/benchmarks/netperf/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,NETPERF,${PKG_NAME},${PKG_VERSION}${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

# uClibc setpgrp does not take arguments
CONFIGURE_ENV+=		ac_cv_func_setpgrp_void=yes
CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_NETPERF}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/netperf ${IDIR_NETPERF}/usr/bin/
	${INSTALL_BIN} ${WRKINST}/usr/bin/netserver ${IDIR_NETPERF}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
