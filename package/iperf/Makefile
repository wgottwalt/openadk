# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		iperf
PKG_VERSION:=		2.0.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		8c5bc14cc2ea55f18f22afe3c23e3dcb
PKG_DESCR:=		internet protocol bandwidth measuring tool
PKG_SECTION:=		net/perf
PKG_DEPENDS:=		libpthread
PKG_URL:=		http://sourceforge.net/projects/iperf
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=iperf/}
PKG_CXX:=		IPERF

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,IPERF,iperf,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ifeq ($(ADK_COMPILE_IPERF_WITH_UCLIBCXX),y)
TARGET_CXXFLAGS+=	-fno-builtin -fno-rtti -nostdinc++
TARGET_LDFLAGS+=	-nodefaultlibs
CONFIGURE_ENV+=		LIBS="-luClibc++ -lc -lm -lpthread"
else
CONFIGURE_ENV+=		LIBS="-lc -lm -lpthread"
endif

iperf-install:
	${INSTALL_DIR} ${IDIR_IPERF}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/iperf ${IDIR_IPERF}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
