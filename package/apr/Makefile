# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		apr
PKG_VERSION:=		1.6.3
PKG_RELEASE:=		1
PKG_HASH:=		131f06d16d7aabd097fa992a33eec2b6af3962f93e6d570a9bd4d85e95993172
PKG_DESCR:=		apache portable runtime library
PKG_SECTION:=		libs/misc
PKG_NEEDS:=		threads
PKG_URL:=		http://apr.apache.org/
PKG_SITES:=		http://www.apache.org/dist/apr/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

PKG_FLAVOURS_APR:=	WITH_IPV6
PKGFD_WITH_IPV6:=	enable IPv6 support

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,APR,apr,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

# uClibc setpgrp does not take arguments
CONFIGURE_ENV+=		ac_cv_func_setpgrp_void=yes
CONFIGURE_ENV+=		ac_cv_sizeof_size_t=4
CONFIGURE_ENV+=		ac_cv_sizeof_ssize_t=4
CONFIGURE_ENV+=		ac_cv_file__dev_zero=yes
CONFIGURE_ENV+=		apr_cv_process_shared_works=no
CONFIGURE_ENV+=		ac_cv_lib_nsl_gethostbyname=no
CONFIGURE_ENV+=		apr_cv_tcp_nodelay_with_cork=no
CONFIGURE_ENV+=		supports_anon_versioning=no
CONFIGURE_ARGS+=	--with-devrandom=/dev/urandom \
			--enable-threads

ifneq (${ADK_PACKAGE_APR_WITH_IPV6},)
CONFIGURE_ARGS+=	--enable-ipv6
else
CONFIGURE_ARGS+=	--disable-ipv6
endif

pre-build:
	# we need to patch paths to get apr-util compiling
	$(SED) "s,\(^installbuilddir=\"\)\(.*\),\1${STAGING_TARGET_DIR}\2," \
		${WRKBUILD}/apr-1-config
	$(SED) "s,\(^datadir=\"\)\(.*\),\1${STAGING_TARGET_DIR}\2," \
		${WRKBUILD}/apr-1-config

apr-install:
	${INSTALL_DIR} ${IDIR_APR}/usr/lib
	${CP} ${WRKINST}/usr/lib/libapr-1.so* ${IDIR_APR}/usr/lib/
	${INSTALL_DIR} ${STAGING_TARGET_DIR}/usr/share/build-1
	${CP} ${WRKINST}/usr/share/build-1/* ${STAGING_TARGET_DIR}/usr/share/build-1/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
