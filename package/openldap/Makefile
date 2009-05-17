# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		openldap
PKG_VERSION:=		2.4.16
PKG_RELEASE:=		1
PKG_MD5SUM:=		ed5b86e9d2b372d10edfe3bb59fee165
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tgz
MASTER_SITES:=		ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/ \
			ftp://sunsite.cnlab-switch.ch/mirror/OpenLDAP/openldap-release/ \
			ftp://ftp.nl.uu.net/pub/unix/db/openldap/openldap-release/ \
			ftp://ftp.plig.org/pub/OpenLDAP/openldap-release/

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

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBOPENLDAP,libopenldap,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))
$(eval $(call PKG_template,OPENLDAP_UTILS,openldap-utils,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))
$(eval $(call PKG_template,OPENLDAP_SLAPD,openldap-slapd,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

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

CONFIGURE_STYLE=	gnu
CONFIGURE_ENV+=		ac_cv_func_memcmp_working=yes
CONFIGURE_ARGS+=	${PKG_CONFIGURE_OPTIONS}
BUILD_STYLE=		auto
INSTALL_STYLE=		auto
XAKE_FLAGS+=		STRIP=""

post-install:
	${INSTALL_DIR} ${IDIR_LIBOPENLDAP}/etc/openldap
	${CP} ${WRKINST}/etc/openldap/ldap.conf ${IDIR_LIBOPENLDAP}/etc/openldap/
	${INSTALL_DIR} ${IDIR_LIBOPENLDAP}/usr/lib/
	${CP} ${WRKINST}/usr/lib/lib{lber,ldap}*.so.* ${IDIR_LIBOPENLDAP}/usr/lib/
	${INSTALL_DIR} ${IDIR_OPENLDAP_UTILS}/usr/bin
	${CP} ${WRKINST}/usr/bin/ldap* ${IDIR_OPENLDAP_UTILS}/usr/bin/
	${INSTALL_DIR} ${IDIR_OPENLDAP_SLAPD}/etc/openldap/schema
	${INSTALL_DIR} ${IDIR_OPENLDAP_SLAPD}/etc/init.d
	${INSTALL_DIR} ${IDIR_OPENLDAP_SLAPD}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/slap* ${IDIR_OPENLDAP_SLAPD}/usr/sbin/
	${INSTALL_DATA} ${WRKINST}/etc/openldap/schema/core.schema \
		${IDIR_OPENLDAP_SLAPD}/etc/openldap/schema
	${INSTALL_DATA} ./files/slapd.conf ${IDIR_OPENLDAP_SLAPD}/etc/openldap
	${INSTALL_DATA} ./files/slapd.init \
		${IDIR_OPENLDAP_SLAPD}/etc/init.d/slapd

include ${TOPDIR}/mk/pkg-bottom.mk
