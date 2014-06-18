# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		postgresql
PKG_VERSION:=		9.3.4
PKG_RELEASE:=		2
PKG_MD5SUM:=		d9be740a612f8a0b9ea61dd524abfa4c
PKG_DESCR:=		postgresql database library
PKG_SECTION:=		libs/db
PKG_BUILDDEP:=		zlib
PKG_URL:=		http://www.postgresql.org/
PKG_SITES:=		http://ftp.postgresql.org/pub/source/v9.3.4/
PKG_LIBNAME:=		libpq
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBPQ,libpq,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

BUILD_STYLE:=           manual
INSTALL_STYLE:=         manual
PKG_CONFIGURE_ARGS:=	--disable-integer-datetimes \
			--without-krb5 \
			--without-openssl \
			--without-pam \
			--without-perl \
			--without-python \
			--without-readline \
			--without-bonjour \
			--without-tcl \
			--with-system-tzdata=${STAGING_TARGET_DIR} \
			--with-zlib="yes"
CONFIGURE_ARGS+=	${PKG_CONFIGURE_ARGS}

pre-configure:
	(cd ${WRKBUILD}; rm -rf config.{cache,status} ; \
		./configure \
		--prefix=/usr \
		${PKG_CONFIGURE_ARGS} \
	);
	${MAKE} -C "${WRKBUILD}/src/bin/pg_config" \
		CC="${HOST_CC}" \
		DESTDIR="${WRKINST}" \
		all install

do-build:
	${MAKE} -C "${WRKBUILD}/src/include" \
		DESTDIR="${WRKINST}" \
		all install
	${MAKE} -C "${WRKBUILD}/src/interfaces/libpq" \
		DESTDIR="${WRKINST}" \
		all install

libpq-install:
	${INSTALL_DIR} ${IDIR_LIBPQ}/usr/lib
	${CP} ${WRKINST}/usr/lib/libpq.so* ${IDIR_LIBPQ}/usr/lib
	# workaround for dev subpackage
	${INSTALL_DIR} ${IDIR_LIBPQ_DEV}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/pg_config \
		${IDIR_LIBPQ_DEV}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
