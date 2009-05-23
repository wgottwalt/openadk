# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libupnp
PKG_VERSION:=		1.6.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		8918dcf7428cd119d0c8275765ff2833
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=pupnp/}
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBUPNP,libupnp,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE:=	autotool gnu
CONFIGURE_ARGS+=	--disable-samples
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto confprog

post-build:
	sed -i -e 's#^libdir=.*#libdir=#' ${WRKBUILD}/threadutil/libthreadutil.la

post-install:
	${INSTALL_DIR} ${IDIR_LIBUPNP}/usr/lib
	${CP} ${WRKINST}/usr/lib/lib*.so* ${IDIR_LIBUPNP}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
