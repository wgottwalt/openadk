# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		mysql
PKG_VERSION:=		5.1.61
PKG_RELEASE:=		1
PKG_MD5SUM:=		4efd10c69c4c99dbdb8fae3834a6d7b8
PKG_DESCR:=		MySQL client library
PKG_SECTION:=		db
PKG_DEPENDS:=		libncurses zlib
PKG_BUILDDEP:=		ncurses zlib readline
PKG_URL:=		http://www.mysql.com/
PKG_SITES=		${MASTER_SITE_MYSQL:=Downloads/MySQL-5.1/}

PKG_SUBPKGS:=		LIBMYSQLCLIENT LIBMYSQLCLIENT_DEV
PKG_HOST_DEPENDS:=	!cygwin

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBMYSQLCLIENT,libmysqlclient,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBMYSQLCLIENT_DEV,libmysqlclient-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

CONFIGURE_ENV+=		OPTIMIZE_CFLAGS="${TARGET_CFLAGS}" \
			OPTIMIZE_CXXFLAGS="${TARGET_CXXFLAGS}" \
			ac_cv_lib_nsl_gethostbyname_r=no \
			ac_cv_lib_nsl_yp_get_default_domain=no \
			ac_cv_sys_restartable_syscalls=yes \
			mysql_cv_sys_os=Linux \
			mysql_cv_compress=yes \
			ac_cv_sys_restartable_syscalls=no \
			ac_cv_conv_longlong_to_float=yes \
			mysql_cv_gcc_atomic_builtins=yes \
			mysql_cv_gethostname_style=glibc2
CONFIGURE_ARGS+=	--disable-assembler \
			--with-pthread \
			--with-atomic-ops=rwlocks \
			--with-unix-socket-path=/tmp/.mysql.sock \
			--with-named-thread-libs=-lpthread \
			--without-libwrap \
			--without-pstack \
			--with-low-memory \
			--without-server \
			--without-embedded-server \
			--without-query-cache \
			--without-ssl \
			--without-docs \
			--without-readline \
			--with-machine-type=${CPU_ARCH}
BUILD_LFLAGS=		CC="${CC_FOR_BUILD}" \
			CXX='${CXX_FOR_BUILD}' \
			CFLAGS='${CFLAGS_FOR_BUILD} -DHOSTCOMPILE=1' \
			CXXFLAGS='${CXXFLAGS_FOR_BUILD}' \
			LDFLAGS='${LDFLAGS_FOR_BUILD}' \
			CPPFLAGS='${CPPFLAGS_FOR_BUILD}' \
			CXXLINK='${CXX_FOR_BUILD} ${CFLAGS_FOR_BUILD} ${LDFLAGS_FOR_BUILD} -o $$@' \
			LINK='${CC_FOR_BUILD} ${CFLAGS_FOR_BUILD} ${LDFLAGS_FOR_BUILD} -o $$@'
ifneq (${OStype},Linux)
BUILD_FLAGS+=		LIBS='-lm -lz'
endif

do-build:
	${MAKE} -C "${WRKBUILD}" \
		SUBDIRS="include" \
		DESTDIR="${WRKINST}" \
		all install
	${MAKE} -C "${WRKBUILD}/libmysql" \
		LINK="${CC_FOR_BUILD} -o conf_to_src -lc" \
		${BUILD_FLAGS} \
		conf_to_src
	${MAKE} -C "${WRKBUILD}" \
		CFLAGS="${TARGET_CFLAGS}" \
		SUBDIRS="libmysql" \
		DESTDIR="${WRKINST}" \
		all install
	${MAKE} -C "${WRKBUILD}" \
		CFLAGS="${TARGET_CFLAGS}" \
		SUBDIRS="scripts" \
		DESTDIR="${WRKINST}" \
		bin_SCRIPTS="mysql_config" \
		all install

libmysqlclient-install:
	${INSTALL_DIR} ${IDIR_LIBMYSQLCLIENT}/usr/lib
	${CP} ${WRKINST}/usr/lib/mysql/libmysqlclient.so* \
	    ${IDIR_LIBMYSQLCLIENT}/usr/lib
	$(SED) "s,\(^pkgincludedir='\)\(.*\),\1${STAGING_TARGET_DIR}\2," \
		${WRKINST}/usr/bin/mysql_config

libmysqlclient-dev-install:
	${INSTALL_DIR} ${IDIR_LIBMYSQLCLIENT_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_LIBMYSQLCLIENT_DEV}/usr/include
	${INSTALL_DIR} ${IDIR_LIBMYSQLCLIENT_DEV}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/mysql_config \
		${IDIR_LIBMYSQLCLIENT_DEV}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
