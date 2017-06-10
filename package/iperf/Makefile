# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		iperf
PKG_VERSION:=		2.0.9
PKG_RELEASE:=		1
PKG_HASH:=		a5350777b191e910334d3a107b5e5219b72ffa393da4186da1e0a4552aeeded6
PKG_DESCR:=		internet protocol bandwidth measuring tool
PKG_SECTION:=		net/perf
PKG_NEEDS:=		threads c++
PKG_URL:=		http://iperf.fr
PKG_SITES:=		https://iperf.fr/download/source/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}-source.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,IPERF,iperf,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		LIBS="-lc -lm -lpthread"
CONFIGURE_ENV+=		ac_cv_func_malloc_0_nonnull=yes

iperf-install:
	${INSTALL_DIR} ${IDIR_IPERF}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/iperf ${IDIR_IPERF}/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
