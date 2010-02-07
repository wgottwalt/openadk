# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		cbtt
PKG_VERSION:=		20060211
PKG_RELEASE:=		1
PKG_MD5SUM:=		19abea2817c49ccc9438e9671c402984
PKG_DESCR:=		Bittorrent tracker
PKG_SECTION:=		net
PKG_DEPENDS:=		zlib
PKG_BUILDDEP+=		zlib
ifeq (${ADK_COMPILE_CBTT_WITH_UCLIBCXX},y)
PKG_BUILDDEP+=		uclibc++
endif
PKG_URL:=		http://bnbtusermods.sourceforge.net
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=bnbtusermods/}

PKG_HOST_DEPENDS:=	!cygwin

DISTFILES:=		${PKG_NAME}80-${PKG_VERSION}-src.tar.gz
WRKDIST=		${WRKDIR}/${PKG_NAME}80-${PKG_VERSION}-src

include ${TOPDIR}/mk/package.mk

ifeq ($(ADK_TARGET_LIB_UCLIBCXX),y)
PKG_DEPENDS+=		uclibc++
PKG_DEPENDS_1+=		uclibc++
else
PKG_DEPENDS+=		libstdcxx
PKG_DEPENDS_1+=		libstdcxx
endif

$(eval $(call PKG_template,CBTT,cbtt,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
INSTALL_STYLE:=		manual

TLDFLAGS+=		-shared -L. -lz -lpthread -lm -lgcc
ifeq ($(ADK_TARGET_LIB_UCLIBCXX),y)
TLDFLAGS+=		-nodefaultlibs -lz -lpthread \
			-luClibc++ -lc -lm -lgcc
TCFLAGS+=		-fno-builtin -nostdinc++
endif
TCFLAGS+=		-fPIC

do-install:
	${INSTALL_DIR} ${IDIR_CBTT}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/bnbt ${IDIR_CBTT}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
