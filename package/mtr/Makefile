# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		mtr
PKG_VERSION:=		0.75
PKG_RELEASE:=		1
PKG_MD5SUM:=		23baca52d0922c2ecba7eba05317868c
MASTER_SITES:=		ftp://ftp.bitwizard.nl/mtr/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MTR,mtr,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE+=	gnu
CONFIGURE_ENV+=		ac_cv_lib_resolv_res_mkquery=yes
CONFIGURE_ARGS+=	--without-gtk
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_MTR}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/mtr ${IDIR_MTR}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
