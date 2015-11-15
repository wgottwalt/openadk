# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		iperf
PKG_VERSION:=		2.0.5
PKG_RELEASE:=		1
PKG_HASH:=		636b4eff0431cea80667ea85a67ce4c68698760a9837e1e9d13096d20362265b
PKG_DESCR:=		internet protocol bandwidth measuring tool
PKG_SECTION:=		net/perf
PKG_NEEDS:=		threads c++
PKG_URL:=		http://sourceforge.net/projects/iperf
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=iperf/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,IPERF,iperf,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		LIBS="-lc -lm -lpthread"
CONFIGURE_ENV+=		ac_cv_func_malloc_0_nonnull=yes

iperf-install:
	${INSTALL_DIR} ${IDIR_IPERF}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/iperf ${IDIR_IPERF}/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
