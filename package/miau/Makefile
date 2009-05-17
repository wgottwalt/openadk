# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		miau
PKG_VERSION:=		0.6.0.2
PKG_RELEASE:=		6
PKG_MD5SUM:=		1b78d219a03655399c165eeb021cddd8
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=miau/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MIAU,miau,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ENV+=		ac_cv_func_malloc_0_nonnull=yes \
			ac_cv_func_realloc_0_nonnull=yes
CONFIGURE_ARGS+=	--enable-automode \
			--enable-releasenick \
			--enable-uptime \
			--enable-privlog \
			--enable-onconnect
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_MIAU}/usr/bin
	${INSTALL_DIR} ${IDIR_MIAU}/etc/{init.d,miau}
	${INSTALL_BIN} ${WRKINST}/usr/bin/${PKG_NAME} ${IDIR_MIAU}/usr/bin/
	${INSTALL_BIN} ./files/miau.init ${IDIR_MIAU}/etc/init.d/miau
	${INSTALL_DATA} ./files/miaurc ${IDIR_MIAU}/etc/miau/

include ${TOPDIR}/mk/pkg-bottom.mk
