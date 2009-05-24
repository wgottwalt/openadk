# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		iperf
PKG_VERSION:=		2.0.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		8c5bc14cc2ea55f18f22afe3c23e3dcb
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=iperf/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,IPERF,iperf,${PKG_VERSION}-${PKG_RELEASE}))

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
