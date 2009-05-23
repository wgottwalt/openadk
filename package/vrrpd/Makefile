# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		vrrpd
PKG_VERSION:=		1.0
PKG_RELEASE:=		9
PKG_MD5SUM:=		6d5066ea1a6ced817376ca0f54765447

MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=vrrpd/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,VRRPD,vrrpd,${PKG_VERSION}-${PKG_RELEASE}))

BUILD_STYLE:=		auto
MAKE_FLAGS:=		CC="${TARGET_CC}" \
			DBG_OPT="" \
			MAIN_OPT="${TARGET_CFLAGS}"
ALL_TARGET:=		vrrpd

do-install:
	${INSTALL_DIR} ${IDIR_VRRPD}/etc/init.d/
	${INSTALL_BIN} ./files/vrrpd.init \
		${IDIR_VRRPD}/etc/init.d/vrrpd
	${INSTALL_DIR} ${IDIR_VRRPD}/usr/sbin/
	${INSTALL_BIN} ${WRKBUILD}/vrrpd ${IDIR_VRRPD}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
