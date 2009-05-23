# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		wol
PKG_VERSION:=		0.7.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		c2fa9d7e771134ac8c89d56b8197d4ca

MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=ahh/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,WOL,wol,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	ac_cv_func_malloc_0_nonnull=yes \
			ac_cv_func_realloc_0_nonnull=yes \
			ac_cv_func_mmap_fixed_mapped=yes \
			jm_cv_func_working_malloc=yes \
			ac_cv_func_alloca_works=yes
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_WOL}/usr/bin/
	${INSTALL_BIN} ${WRKINST}/usr/bin/wol ${IDIR_WOL}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
