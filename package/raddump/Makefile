# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		raddump
PKG_VERSION:=		0.3.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		f8c29c67141ea78bb6ae8b97d5149480
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=raddump/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,RADDUMP,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	ac_cv_c_bigendian=no \
			ac_cv_func_malloc_0_nonnull=yes \
			ac_cv_func_realloc_0_nonnull=yes
INSTALL_STYLE:=		auto

post-install:
	${CP} ${WRKINST}/* ${IDIR_RADDUMP}/

include ${TOPDIR}/mk/pkg-bottom.mk
