# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		iperf
PKG_VERSION:=		2.0.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		8c5bc14cc2ea55f18f22afe3c23e3dcb
PKG_DESCR:=		Internet Protocol bandwidth measuring tool
PKG_SECTION:=		net
PKG_DEPENDS:=		libpthread
PKG_URL:=		http://sourceforge.net/projects/iperf
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=iperf/}

include ${TOPDIR}/mk/package.mk

ifeq ($(ADK_COMPILE_IPERF_WITH_UCLIBCXX),y)
PKG_DEPENDS+=		uclibc++
else
PKG_DEPENDS+=		libstdcxx
endif

$(eval $(call PKG_template,IPERF,iperf,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

ifeq ($(ADK_COMPILE_IPERF_WITH_UCLIBCXX),y)
TCXXFLAGS+=		-fno-builtin -fno-rtti -nostdinc++
TLDFLAGS+=		-nodefaultlibs
CONFIGURE_ENV+=		LIBS="-luClibc++ -lc -lm -lgcc_s -lpthread"
else
CONFIGURE_ENV+=		LIBS="-lc -lm -lgcc_s -lpthread"
endif

post-install:
	${INSTALL_DIR} ${IDIR_IPERF}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/iperf ${IDIR_IPERF}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
