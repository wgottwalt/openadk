# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		wccpd
PKG_VERSION:=		0.2
PKG_RELEASE:=		2
PKG_MD5SUM:=		5f15c274de61dfb88e0dbfc1ccbe6b67

MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=wccpd/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,WCCPD,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ENV+=		ac_cv_func_setpgrp_void=yes
CONFIGURE_ARGS+=	--enable-static \
			--with-gnu-ld
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_WCCPD}/usr/sbin/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/wccpd ${IDIR_WCCPD}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
