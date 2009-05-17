# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		tmsnc
PKG_VERSION:=		0.3.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		337dae91d4775e03b6681f61db56d2a7
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=tmsnc/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,TMSNC,tmsnc,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ENV+=		ac_cv_func_malloc_0_nonnull=yes \
			ac_cv_func_realloc_0_nonnull=yes
CONFIGURE_ARGS+=	--with-libiconv-prefix=${STAGING_DIR}/usr \
			--with-openssl=${STAGING_DIR}/usr \
			--with-ncurses=${STAGING_DIR}
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_TMSNC}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/tmsnc ${IDIR_TMSNC}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
