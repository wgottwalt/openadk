# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		apr
PKG_VERSION:=		1.4.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		fc80cb54f158c2674f9eeb47a1f672cd
PKG_DESCR:=		Apache Portable Runtime library
PKG_SECTION:=		libs
PKG_DEPENDS:=		libpthread
PKG_URL:=		http://apr.apache.org/
PKG_SITES:=		http://gd.tuwien.ac.at/infosys/servers/http/apache/dist/${PKG_NAME}/

PKG_FLAVOURS_APR:=	WITH_IPV6
PKGFD_WITH_IPV6:=	enable IPv6 support

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,APR,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

# uClibc setpgrp does not take arguments
CONFIGURE_ENV+=		ac_cv_func_setpgrp_void=yes
CONFIGURE_ENV+=		ac_cv_sizeof_size_t=4
CONFIGURE_ENV+=		ac_cv_sizeof_ssize_t=4
CONFIGURE_ENV+=		ac_cv_file__dev_zero=yes
CONFIGURE_ENV+=		apr_cv_process_shared_works=no
CONFIGURE_ENV+=		ac_cv_lib_nsl_gethostbyname=no
CONFIGURE_ENV+=		apr_cv_tcp_nodelay_with_cork=no
CONFIGURE_ARGS+=	--with-devrandom=/dev/urandom \
			--enable-threads

ifneq (${ADK_PACKAGE_LIBPCAP_WITH_IPV6},)
CONFIGURE_ARGS+=	--enable-ipv6
else
CONFIGURE_ARGS+=	--disable-ipv6
endif

post-install:
	${INSTALL_DIR} ${IDIR_APR}/usr/lib
	${CP} ${WRKINST}/usr/lib/libapr-1.so* ${IDIR_APR}/usr/lib/
	${INSTALL_DIR} ${STAGING_TARGET_DIR}/usr/share/build-1
	${CP} ${WRKINST}/usr/share/build-1/* ${STAGING_TARGET_DIR}/usr/share/build-1/
	# we need to patch paths to get apr-util compiling
	$(SED) "s,\(^installbuilddir=\"\)\(.*\),\1${STAGING_TARGET_DIR}\2," \
		${WRKINST}/usr/bin/apr-1-config
	$(SED) "s,\(^datadir=\"\)\(.*\),\1${STAGING_TARGET_DIR}\2," \
		${WRKINST}/usr/bin/apr-1-config

include ${TOPDIR}/mk/pkg-bottom.mk
