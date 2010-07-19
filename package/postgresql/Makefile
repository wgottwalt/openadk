# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		postgresql
PKG_VERSION:=		8.4.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		ae7f305eb9388b187e8f07dee0cec55c
PKG_DESCR:=		PostgreSQL database library
PKG_SECTION:=		db
PKG_BUILDDEP+=		zlib
PKG_URL:=		http://www.postgresql.org
PKG_SITES:=		ftp://ftp7.de.postgresql.org/pub/ftp.postgresql.org/source/v${PKG_VERSION}/ \
			ftp://ftp8.de.postgresql.org/pub/ftp.postgresql.org/source/v${PKG_VERSION}/ \
			ftp://ftp.be.postgresql.org/pub/postgresql/source/v${PKG_VERSION}/ \
			ftp://ftp.tw.postgresql.org/pub/postgresql/source/v${PKG_VERSION}/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBPQ,libpq,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

BUILD_STYLE:=           manual
INSTALL_STYLE:=         manual

PKG_CONFIGURE_ARGS:=\
			--disable-integer-datetimes \
			--without-krb5 \
			--without-openssl \
			--without-pam \
			--without-perl \
			--without-python \
			--without-readline \
			--without-bonjour \
			--without-tcl \
			--with-system-tzdata=${STAGING_DIR} \
			--with-zlib="yes"
CONFIGURE_ARGS+=	${PKG_CONFIGURE_ARGS}

pre-configure:
	(cd ${WRKBUILD}; rm -rf config.{cache,status} ; \
		./configure \
		--prefix=/usr \
		${PKG_CONFIGURE_ARGS} \
	);
	${MAKE} -C "${WRKBUILD}/src/bin/pg_config" \
		CC="${HOSTCC}" \
		DESTDIR="${WRKINST}" \
		all install

do-build:
	${MAKE} -C "${WRKBUILD}/src/include" \
		DESTDIR="${WRKINST}" \
		all install
	${MAKE} -C "${WRKBUILD}/src/interfaces/libpq" \
		DESTDIR="${WRKINST}" \
		all install

do-install:
	${INSTALL_DIR} ${IDIR_LIBPQ}/usr/lib
	${CP} ${WRKINST}/usr/lib/libpq.so* ${IDIR_LIBPQ}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
