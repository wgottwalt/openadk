# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		openldap
PKG_VERSION:=		2.4.22
PKG_RELEASE:=		1
PKG_MD5SUM:=		ef01b52255ce8e3fbf8aa34f6fe7598b
PKG_DESCR:=		OpenLDAP client libraries
PKG_SECTION:=		libs
PKG_DEPENDS:=		libopenssl libsasl2
PKG_BUILDDEP+=		cyrus-sasl openssl libdb
PKG_URL:=		http://www.openldap.org
PKG_SITES:=		ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/

PKG_DESCR_1:=		OpenLDAP utilities
PKG_DEPENDS_1:=		libopenldap
PKG_SECTION_1:=		net/misc
PKG_DESCR_2:=		OpenLDAP server daemon
PKG_DEPENDS_2:=		libopenldap
PKG_SECTION_2:=		net/misc

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tgz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBOPENLDAP,libopenldap,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,OPENLDAP_UTILS,openldap-utils,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS_1},${PKG_DESCR_1},${PKG_SECTION_1}))
$(eval $(call PKG_template,OPENLDAP_SLAPD,openldap-slapd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS_2},${PKG_DESCR_2},${PKG_SECTION_2}))

PKG_CONFIGURE_OPTIONS+=	\
			--enable-slapd \
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

post-install:
	${INSTALL_DIR} ${IDIR_LIBOPENLDAP}/etc/openldap
	${CP} ${WRKINST}/etc/openldap/ldap.conf \
		${IDIR_LIBOPENLDAP}/etc/openldap/
	${INSTALL_DIR} ${IDIR_LIBOPENLDAP}/usr/lib/
	${CP} ${WRKINST}/usr/lib/lib{lber,ldap}*.so* \
		${IDIR_LIBOPENLDAP}/usr/lib/
	${INSTALL_DIR} ${IDIR_OPENLDAP_UTILS}/usr/bin
	${CP} ${WRKINST}/usr/bin/ldap* ${IDIR_OPENLDAP_UTILS}/usr/bin/
	${INSTALL_DIR} ${IDIR_OPENLDAP_SLAPD}/etc/openldap/schema
	${INSTALL_DIR} ${IDIR_OPENLDAP_SLAPD}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/slap* ${IDIR_OPENLDAP_SLAPD}/usr/sbin/
	${INSTALL_DATA} ${WRKINST}/etc/openldap/schema/core.schema \
		${IDIR_OPENLDAP_SLAPD}/etc/openldap/schema
	${INSTALL_DATA} ./files/slapd.conf ${IDIR_OPENLDAP_SLAPD}/etc/openldap

include ${TOPDIR}/mk/pkg-bottom.mk
