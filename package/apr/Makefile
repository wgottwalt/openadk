# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		apr
PKG_VERSION:=		0.9.17
PKG_RELEASE:=		1
PKG_MD5SUM:=		ca1e22d98081a03a33c2a0b8684eb192
PKG_DESCR:=		Apache Portable Runtime library
PKG_SECTION:=		libs
PKG_URL:=		http://apr.apache.org
PKG_SITES:=		http://gd.tuwien.ac.at/infosys/servers/http/apache/dist/${PKG_NAME}/

include ${TOPDIR}/mk/package.mk

ifeq (${ADK_PACKAGE_APR_THREADING},y)
PKG_DEPENDS:=		libpthread
endif

$(eval $(call PKG_template,APR,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ENV+=		ac_cv_func_setpgrp_void=no
CONFIGURE_ENV+=		ac_cv_sizeof_size_t=4
CONFIGURE_ENV+=		ac_cv_sizeof_ssize_t=4
CONFIGURE_ENV+=		ac_cv_file__dev_zero=yes
CONFIGURE_ENV+=		apr_cv_process_shared_works=no
CONFIGURE_ARGS+=	--with-devrandom=/dev/urandom

ifeq (${ADK_PACKAGE_APR_THREADING},y)
CONFIGURE_ARGS+=	--enable-threads
else
CONFIGURE_ARGS+=	--disable-threads
endif

BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_APR}/usr/lib
	${CP} ${WRKINST}/usr/lib/libapr-0.so* ${IDIR_APR}/usr/lib/
	${INSTALL_DIR} ${STAGING_DIR}/usr/share/build
	${CP} ${WRKINST}/usr/share/build/* ${STAGING_DIR}/usr/share/build/
	# we need to patch paths to get apr-util compiling
	$(SED) "s,\(^installbuilddir=\"\)\(.*\),\1${STAGING_DIR}\2," ${WRKINST}/usr/bin/apr-config
	$(SED) "s,\(^datadir=\"\)\(.*\),\1${STAGING_DIR}\2," ${WRKINST}/usr/bin/apr-config

include ${TOPDIR}/mk/pkg-bottom.mk
