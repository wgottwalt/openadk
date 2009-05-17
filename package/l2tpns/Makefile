# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		l2tpns
PKG_VERSION:=		2.1.14
PKG_RELEASE:=		1
PKG_MD5SUM:=		2a0ee2a3678160c335f1d68c17c4f871
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=l2tpns/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,L2TPNS,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

BUILD_FLAGS=		auto
INSTALL_STYLE=		auto
XAKE_FLAGS+=		OPTIM="${TARGET_CFLAGS}" \
			STAGING_DIR=${STAGING_DIR} \
			LD="${TARGET_CC}"

post-install:
	${INSTALL_DIR} ${IDIR_L2TPNS}/etc/l2tpns
	${CP} ${WRKINST}/etc/l2tpns/* ${IDIR_L2TPNS}/etc/l2tpns/
	${INSTALL_DIR} ${IDIR_L2TPNS}/usr/lib/l2tpns
	${CP} ${WRKINST}/usr/lib/l2tpns/* ${IDIR_L2TPNS}/usr/lib/l2tpns/
	${INSTALL_DIR} ${IDIR_L2TPNS}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/* ${IDIR_L2TPNS}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
