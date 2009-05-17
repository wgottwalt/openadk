# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		srelay
PKG_VERSION:=		0.4.6
PKG_RELEASE:=		9
PKG_MD5SUM:=		4a9f3298b38d8588f0ffde31b946a47f
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=socks-relay/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SRELAY,srelay,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--disable-thread
BUILD_STYLE:=		auto

do-install:
	${INSTALL_DIR} ${IDIR_SRELAY}/usr/bin
	${INSTALL_DIR} ${IDIR_SRELAY}/etc/init.d
	${INSTALL_BIN} ${WRKBUILD}/srelay ${IDIR_SRELAY}/usr/bin/
	${INSTALL_BIN} ./files/srelay.init \
		${IDIR_SRELAY}/etc/init.d/${PKG_NAME}
	${INSTALL_DATA} ./files/srelay.conf ${IDIR_SRELAY}/etc

include ${TOPDIR}/mk/pkg-bottom.mk
