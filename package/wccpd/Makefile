# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		wccpd
PKG_VERSION:=		0.2
PKG_RELEASE:=		2
PKG_MD5SUM:=		5f15c274de61dfb88e0dbfc1ccbe6b67
PKG_DESCR:=		web cache coordination protocol server daemon
PKG_SECTION:=		net/proxy
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=wccpd/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,WCCPD,wccpd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

# uClibc setpgrp does not take arguments
CONFIGURE_ENV+=		ac_cv_func_setpgrp_void=yes

wccpd-install:
	${INSTALL_DIR} ${IDIR_WCCPD}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/wccpd ${IDIR_WCCPD}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
