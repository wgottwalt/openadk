# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		cyrus-sasl
PKG_VERSION:=		2.1.23
PKG_RELEASE:=		2
PKG_MD5SUM:=		2eb0e48106f0e9cd8001e654f267ecbc
PKG_DESCR:=		a general purpose authentication library
PKG_SECTION:=		libs
PKG_BUILDDEP:=		openssl
PKG_DEPENDS:=		libopenssl
PKG_URL:=		http://asg.web.cmu.edu/sasl/
PKG_SITES:=		http://ftp.andrew.cmu.edu/pub/cyrus-mail/
PKG_NOPARALLEL:=	1
PKG_LIBNAME:=		libsasl2
PKG_OPTS:=		dev

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBSASL2,libsasl2,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--enable-staticdlopen \
			--enable-cram \
			--enable-plain \
			--enable-anon \
			--enable-digest \
			--with-ipctype=unix \
			--with-devrandom="/dev/urandom" \
			--with-openssl="${STAGING_TARGET_DIR}/usr" \
			--disable-sample \
			--disable-java \
			--disable-alwaystrue \
			--disable-checkapop \
			--disable-otp \
			--disable-srp \
			--disable-srp-setpass \
			--disable-krb4 \
			--disable-gssapi \
			--disable-gss_mutexes \
			--disable-login \
			--disable-ntlm \
			--disable-sql \
			--disable-static \
			--without-dblib \
			--without-gdbm \
			--without-pam \
			--without-saslauthd \
			--without-authdaemond \
			--without-pwcheck \
			--without-des \
			--without-opie \
			--without-ldap \
			--without-mysql \
			--without-pgsql \
			--without-sqlite \
			--without-rc4 \
			--without-dmalloc \
			--without-sfio

pre-build:
	${MAKE} -C ${WRKBUILD}/include \
		CC="${CC_FOR_BUILD}" \
		LINK="${CC_FOR_BUILD} -o makemd5 -lc" \
		LIBS="" \
		CFLAGS="${CFLAGS_FOR_BUILD}" \
		LDFLAGS="" \
		CPPFLAGS="" \
		makemd5

libsasl2-install:
	${INSTALL_DIR} ${IDIR_LIBSASL2}/usr/lib/sasl2
	${CP} ${WRKINST}/usr/lib/libsasl2.so* ${IDIR_LIBSASL2}/usr/lib
	${CP} ${WRKINST}/usr/lib/sasl2/lib*.so* \
		${IDIR_LIBSASL2}/usr/lib/sasl2

include ${TOPDIR}/mk/pkg-bottom.mk
