# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		cbtt
PKG_VERSION:=		20060211
PKG_RELEASE:=		1
PKG_MD5SUM:=		19abea2817c49ccc9438e9671c402984
DISTFILES:=		${PKG_NAME}80-${PKG_VERSION}-src.tar.gz
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=bnbtusermods/}
WRKDIST=		${WRKDIR}/${PKG_NAME}80-${PKG_VERSION}-src

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,CBTT,cbtt,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,CBTT_MYSQL,cbtt-mysql,${PKG_VERSION}-${PKG_RELEASE}))

BUILD_STYLE=		auto
TLDFLAGS+=		-shared -L. -L${STAGING_DIR}/usr/lib/mysql \
			-lmysqlclient -lz -lpthread -lm -lgcc
ifeq ($(ADK_TARGET_LIB_UCLIBCXX),y)
TLDFLAGS+=		-nodefaultlibs -lz -lpthread \
			-luClibc++ -lc -lm -lgcc
TCFLAGS+=		-fno-builtin -nostdinc++
endif

do-install:
	${INSTALL_DIR} ${IDIR_CBTT}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/bnbt ${IDIR_CBTT}/usr/bin/
	${INSTALL_DIR} ${IDIR_CBTT_MYSQL}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/bnbtmysql ${IDIR_CBTT_MYSQL}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
