# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		openldap
PKG_VERSION:=		2.4.24
PKG_RELEASE:=		1
PKG_MD5SUM:=		116fe1e23a7b67686d5e62274367e6c0
PKG_DESCR:=		OpenLDAP client libraries
PKG_SECTION:=		libs
PKG_DEPENDS:=		libopenssl libsasl2
PKG_BUILDDEP:=		cyrus-sasl openssl db
PKG_URL:=		http://www.openldap.org/
PKG_SITES:=		ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/
PKG_NEED_CXX:=		1

PKG_SUBPKGS:=		LIBOPENLDAP LIBOPENLDAP_DEV OPENLDAP_UTILS OPENLDAP_SLAPD
PKGSD_OPENLDAP_UTILS:=	OpenLDAP utilities
PKGSS_OPENLDAP_UTILS:=	libopenldap
PKGSC_OPENLDAP_UTILS:=	net/misc
PKGSD_OPENLDAP_SLAPD:=	OpenLDAP server daemon
PKGSS_OPENLDAP_SLAPD:=	libopenldap
PKGSC_OPENLDAP_SLAPD:=	net/misc

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tgz

PKG_FLAVOURS_OPENLDAP_SLAPD:=	WITH_IPV6
PKGFD_WITH_IPV6:=		enable IPv6 support

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBOPENLDAP,libopenldap,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBOPENLDAP_DEV,libopenldap-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,OPENLDAP_UTILS,openldap-utils,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_OPENLDAP_UTILS},${PKGSD_OPENLDAP_UTILS},${PKGSC_OPENLDAP_UTILS}))
$(eval $(call PKG_template,OPENLDAP_SLAPD,openldap-slapd,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_OPENLDAP_SLAPD},${PKGSD_OPENLDAP_SLAPD},${PKGSC_OPENLDAP_SLAPD}))

PKG_CONFIGURE_OPTIONS+= --enable-slapd \
			--libexecdir=/usr/sbin \
			--enable-bdb \
			--disable-hdb \
			--disable-relay \
			--enable-dynamic \
			--enable-syslog \
			--enable-local \
			--disable-syncprov \
			--disable-slurpd \
			--without-gssapi \
			--without-fetch \
			--with-cyrus-sasl \
			--with-threads \
			--with-tls \
			--with-yielding_select="yes" \

ifneq (${ADK_PACKAGE_OPENLDAP_SLAPD_WITH_IPV6},)
CONFIGURE_ARGS+=	--enable-ipv6
else
CONFIGURE_ARGS+=	--disable-ipv6
endif

CONFIGURE_ENV+=		ac_cv_func_memcmp_working=yes
CONFIGURE_ARGS+=	${PKG_CONFIGURE_OPTIONS}
XAKE_FLAGS+=		STRIP="" CPPFLAGS="-D_GNU_SOURCE"

pre-configure:
	(cd ${WRKBUILD}; rm -rf config.{cache,status} ; \
		CPPFLAGS=-D_GNU_SOURCE ./configure \
		   ${PKG_CONFIGURE_OPTIONS} \
		  --disable-slapd \
		  --without-cyrus-sasl \
		  --without-threads \
		  --without-tls \
	);
	${MAKE} -C ${WRKBUILD} depend
	${MAKE} -C ${WRKBUILD}/libraries/liblutil
	${MAKE} -C ${WRKBUILD}/libraries/liblber
	${MAKE} -C ${WRKBUILD}/libraries/liblunicode
	${MAKE} -C ${WRKBUILD}/libraries/liblber clean
	${MAKE} -C ${WRKBUILD}/libraries/liblutil clean
	${MAKE} -C ${WRKBUILD}/libraries/liblunicode clean

libopenldap-install:
	${INSTALL_DIR} ${IDIR_LIBOPENLDAP}/etc/openldap
	${CP} ${WRKINST}/etc/openldap/ldap.conf \
		${IDIR_LIBOPENLDAP}/etc/openldap
	${INSTALL_DIR} ${IDIR_LIBOPENLDAP}/usr/lib
	${CP} ${WRKINST}/usr/lib/lib{lber,ldap}*.so* \
		${IDIR_LIBOPENLDAP}/usr/lib

libopenldap-dev-install:
	${INSTALL_DIR} ${IDIR_LIBOPENLDAP_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* \
		${IDIR_LIBOPENLDAP_DEV}/usr/include

openldap-utils-install:
	${INSTALL_DIR} ${IDIR_OPENLDAP_UTILS}/usr/bin
	${CP} ${WRKINST}/usr/bin/ldap* ${IDIR_OPENLDAP_UTILS}/usr/bin/

openldap-slapd-install:
	${INSTALL_DIR} ${IDIR_OPENLDAP_SLAPD}/etc/openldap/schema
	${INSTALL_DIR} ${IDIR_OPENLDAP_SLAPD}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/slap* ${IDIR_OPENLDAP_SLAPD}/usr/sbin
	${INSTALL_DATA} ${WRKINST}/etc/openldap/schema/core.schema \
		${IDIR_OPENLDAP_SLAPD}/etc/openldap/schema
	${INSTALL_DATA} ./files/slapd.conf ${IDIR_OPENLDAP_SLAPD}/etc/openldap

include ${TOPDIR}/mk/pkg-bottom.mk
