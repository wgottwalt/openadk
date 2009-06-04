# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		mysql
PKG_VERSION:=		5.0.81
PKG_RELEASE:=		1
PKG_MD5SUM:=		2d35e4980f279c839172a6efdb0f0b15
PKG_DESCR:=		MySQL client library
PKG_SECTION:=		libs
PKG_DEPENDS:=		libncurses zlib
PKG_URL:=		http://www.mysql.com
PKG_SITES=		${MASTER_SITE_MYSQL:=Downloads/MySQL-5.0/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBMYSQLCLIENT,libmysqlclient,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ENV+=		OPTIMIZE_CFLAGS="${TARGET_CFLAGS}" \
			OPTIMIZE_CXXFLAGS="${TARGET_CFLAGS}" \
			ac_cv_sys_restartable_syscalls=yes \
			mysql_cv_sys_os=Linux \
			mysql_cv_compress=yes \
			ac_cv_sys_restartable_syscalls=no \
			ac_cv_conv_longlong_to_float=yes \
			mysql_cv_gethostname_style=glibc2
CONFIGURE_ARGS+=	--disable-assembler \
			--with-pthread \
			--without-raid \
			--with-unix-socket-path=/tmp/.mysql.sock \
			--with-named-thread-libs=-lpthread \
			--without-libwrap \
			--without-pstack \
			--with-low-memory \
			--without-server \
			--without-embedded-server \
			--without-query-cache \
			--without-mysqlfs \
			--without-vio \
			--without-openssl \
			--without-docs \
			--without-bench \
			--without-innodb \
			--without-readline \
			--with-machine-type=${CPU_ARCH}
HOSTTOOLFLAGS=		CC="${HOSTCC}" \
			CXX='c++' \
			CFLAGS='${HOSTCFLAGS} -DHOSTCOMPILE=1' \
			CXXFLAGS='${HOSTCFLAGS}' \
			LDFLAGS='${HOSTLDFLAGS}' \
			CPPFLAGS='${HOSTCPPFLAGS}' \
			CXXLINK='c++ ${HOSTCFLAGS} ${HOSTLDFLAGS} -o $$@' \
			LINK='${HOSTCC} ${HOSTCFLAGS} ${HOSTLDFLAGS} -o $$@'
ifneq (${OStype},Linux)
HOSTTOOLFLAGS+=		LIBS='-lm -lz'
endif

do-build:
	${MAKE} -C "${WRKBUILD}" \
		SUBDIRS="include" \
		DESTDIR="${WRKINST}" \
		all install
	${MAKE} -C "${WRKBUILD}/libmysql" \
		LINK="${HOSTCC} -o conf_to_src -lc" \
		${HOSTTOOLFLAGS} \
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

do-install:
	${INSTALL_DIR} ${IDIR_LIBMYSQLCLIENT}/usr/lib/mysql
	${CP} ${WRKINST}/usr/lib/mysql/libmysqlclient.so* \
	    ${IDIR_LIBMYSQLCLIENT}/usr/lib/mysql

include ${TOPDIR}/mk/pkg-bottom.mk
