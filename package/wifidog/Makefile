# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		wifidog
PKG_VERSION:=		1.1.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		abe5f7123179a0f08c493ce59fb3cb31
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=${PKG_NAME}/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,WIFIDOG,wifidog,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ENV+=		ac_cv_func_malloc_0_nonnull=yes \
			ac_cv_func_memcmp_working=yes \
			ac_cv_func_setvbuf_reversed=no
BUILD_STYLE+=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_WIFIDOG}/etc/init.d/
	${INSTALL_BIN} ./files/${PKG_NAME}.init \
		       ${IDIR_WIFIDOG}/etc/init.d/wifidog
	${INSTALL_DATA} ./files/wifidog.conf ${IDIR_WIFIDOG}/etc/
	${INSTALL_DIR} ${IDIR_WIFIDOG}/usr/bin
	${INSTALL_DIR} ${IDIR_WIFIDOG}/usr/lib
	${INSTALL_BIN} ${WRKBUILD}/scripts/init.d/wifidog ${IDIR_WIFIDOG}/usr/bin/wifidog-init
	${INSTALL_BIN} ${WRKINST}/usr/bin/wifidog \
		       ${WRKINST}/usr/bin/wdctl ${IDIR_WIFIDOG}/usr/bin/
	${CP} ${WRKINST}/usr/lib/libhttpd.so* ${IDIR_WIFIDOG}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
