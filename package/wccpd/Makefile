# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		wccpd
PKG_VERSION:=		0.2
PKG_RELEASE:=		2
PKG_HASH:=		397cc932a3222b33c1501168084920f0b848f7c4c6109bbc4a99c4ccc1f03a92
PKG_DESCR:=		web cache coordination protocol server daemon
PKG_SECTION:=		net/proxy
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=wccpd/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,WCCPD,wccpd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

# uClibc setpgrp does not take arguments
CONFIGURE_ENV+=		ac_cv_func_setpgrp_void=yes

wccpd-install:
	${INSTALL_DIR} ${IDIR_WCCPD}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/wccpd ${IDIR_WCCPD}/usr/sbin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
