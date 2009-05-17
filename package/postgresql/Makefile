# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		postgresql
PKG_VERSION:=		8.3.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		6e36f3b4dd27ae0c352376ea9f843de2

MASTER_SITES:=		ftp://ftp7.de.postgresql.org/pub/ftp.postgresql.org/source/v${PKG_VERSION}/ \
			ftp://ftp8.de.postgresql.org/pub/ftp.postgresql.org/source/v${PKG_VERSION}/ \
			ftp://ftp.be.postgresql.org/pub/postgresql/source/v${PKG_VERSION}/ \
			ftp://ftp.tw.postgresql.org/pub/postgresql/source/v${PKG_VERSION}/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBPQ,libpq,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE=	gnu
PKG_CONFIGURE_ARGS:=\
			--disable-integer-datetimes \
			--without-java \
			--without-krb4 \
			--without-krb5 \
			--without-openssl \
			--without-pam \
			--without-perl \
			--without-python \
			--without-readline \
			--without-rendezvous \
			--without-tcl \
			--without-tk \
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
	${CP} ${WRKINST}/usr/lib/libpq.so.* ${IDIR_LIBPQ}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
