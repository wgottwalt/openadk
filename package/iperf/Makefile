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
PKG_NEED_CXX:=		1
PKG_CXX:=		IPERF

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,IPERF,iperf,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CFLAGS:=         $(filter-out -flto,$(TARGET_CFLAGS))
TARGET_CXXFLAGS:=	$(filter-out -flto,$(TARGET_CXXFLAGS))

ifeq ($(ADK_TOOLCHAIN_USE_SSP),y)
TARGET_LDFLAGS+=	-lssp
endif

ifeq ($(ADK_COMPILE_IPERF_WITH_UCLIBCXX),y)
TARGET_CXXFLAGS+=	-fno-builtin -fno-rtti -nostdinc++
TARGET_LDFLAGS+=	-nodefaultlibs
CONFIGURE_ENV+=		LIBS="-luClibc++ -lc -lm -lgcc_s -lpthread"
else
CONFIGURE_ENV+=		LIBS="-lc -lm -lgcc_s -lpthread"
endif

iperf-install:
	${INSTALL_DIR} ${IDIR_IPERF}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/iperf ${IDIR_IPERF}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
