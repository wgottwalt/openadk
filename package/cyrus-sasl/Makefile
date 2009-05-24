# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		cyrus-sasl
PKG_VERSION:=		2.1.22
PKG_RELEASE:=		1
PKG_MD5SUM:=		45dde9d19193ae9dd388eb68b2027bc9
MASTER_SITES:=		http://ftp.andrew.cmu.edu/pub/cyrus-mail/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBSASL2,libsasl2,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--disable-sample \
			--enable-staticdlopen \
			--disable-java \
			--disable-alwaystrue \
			--disable-checkapop \
			--enable-cram \
			--enable-digest \
			--disable-otp \
			--disable-srp \
			--disable-srp-setpass \
			--disable-krb4 \
			--disable-gssapi \
			--disable-gss_mutexes \
			--enable-plain \
			--enable-anon \
			--disable-login \
			--disable-ntlm \
			--disable-sql \
			--without-dblib \
			--without-gdbm \
			--with-devrandom="/dev/urandom" \
			--without-pam \
			--without-saslauthd \
			--without-authdaemond \
			--without-pwcheck \
			--with-ipctype=unix \
			--with-openssl="${STAGING_DIR}/usr" \
			--without-des \
			--without-opie \
			--without-ldap \
			--without-mysql \
			--without-pgsql \
			--without-sqlite \
			--without-rc4 \
			--without-dmalloc \
			--without-sfio \
			--disable-static
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

pre-build:
	${MAKE} -C ${WRKBUILD}/include \
		CC="${HOSTCC}" \
		LINK="${HOSTCC} -o makemd5 -lc" \
		LIBS="" \
		CFLAGS="" \
		LDFLAGS="" \
		CPPFLAGS="" \
		makemd5

post-install:
	${INSTALL_DIR} ${IDIR_LIBSASL2}/usr/lib/sasl2
	${CP} ${WRKINST}/usr/lib/libsasl2.so.* ${IDIR_LIBSASL2}/usr/lib/
	${CP} ${WRKINST}/usr/lib/sasl2/lib*.so.* ${IDIR_LIBSASL2}/usr/lib/sasl2/

include ${TOPDIR}/mk/pkg-bottom.mk
