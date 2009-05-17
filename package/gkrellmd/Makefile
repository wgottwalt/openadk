# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME=		gkrellmd
PKG_VERSION=		2.2.10
PKG_RELEASE=		7
PKG_MD5SUM=		518666ce4c2ef5a7db637683778fe18b
MASTER_SITES=		http://members.dslextreme.com/users/billw/gkrellm/
DISTFILES=		gkrellm-${PKG_VERSION}.tar.gz

WRKDIST=${WRKDIR}/gkrellm-${PKG_VERSION}/server

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GKRELLMD,gkrellmd,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

BUILD_STYLE=	auto
MAKE_FLAGS+=	GLIB12_INCLUDE="-I${STAGING_DIR}/usr/include/glib-1.2 -I${STAGING_DIR}/usr/lib/glib/include" \
		GLIB12_LIB="-L${STAGING_DIR}/usr/lib -lglib -lgmodule" \
		glib12=1

do-install:
	${INSTALL_DIR} ${IDIR_GKRELLMD}/usr/bin
	${INSTALL_DIR} ${IDIR_GKRELLMD}/etc/init.d
	${INSTALL_BIN} ${WRKBUILD}/gkrellmd ${IDIR_GKRELLMD}/usr/bin/
	${INSTALL_DATA} ${WRKSRC}/gkrellmd.conf ${IDIR_GKRELLMD}/etc
	${INSTALL_BIN} ./files/gkrellmd.init ${IDIR_GKRELLMD}/etc/init.d/gkrellmd

include ${TOPDIR}/mk/pkg-bottom.mk
