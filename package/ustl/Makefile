# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ustl
PKG_VERSION:=		0.8
PKG_RELEASE:=		1
PKG_MD5SUM:=		dd59483c327f1bd1356273bc5ae4dde0

MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=ustl/}
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}-0.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,USTL,ustl,${PKG_VERSION}-${PKG_RELEASE}))

BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto
XAKE_FLAGS+=		CROSS="${TARGET_CROSS}" \
			OPTFLAGS="${TARGET_CFLAGS}"

do-configure:
	${CP} ./files/config.h ${WRKBUILD}/
	${CP} ./files/Common.mk ${WRKBUILD}/

post-install:
	${INSTALL_DIR} ${IDIR_USTL}/usr/lib
	${CP} ${WRKINST}/usr/lib/libustl.so* ${IDIR_USTL}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
