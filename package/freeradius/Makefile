# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		freeradius
PKG_VERSION:=		2.1.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		07837a2e78028a0fcf5fc3bb5ca292e9
PKG_DESCR:=		a flexible RADIUS server
PKG_SECTION:=		net
PKG_DEPENDS:=		libltdl libopenssl libpthread
PKG_URL:=		http://www.freeradius.org
PKG_SITES:=		ftp://ftp.freeradius.org/pub/radius/ \
			http://freeradius.portal-to-web.de/ \
			ftp://ftp.uk.freeradius.org/pub/radius/

DISTFILES:=		${PKG_NAME}-server-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/${PKG_NAME}-server-${PKG_VERSION}

PKG_CONFIGURE_OPTIONS:=

ifneq (${ADK_PACKAGE_FREERADIUS_MOD_LDAP},)
PKG_CONFIGURE_LIBS+=   -lcrypto -lssl
PKG_CONFIGURE_OPTIONS+=        \
	--with-rlm_ldap-include-dir="${STAGING_DIR}/usr/include" \
	--with-rlm_ldap-lib-dir="${STAGING_DIR}/usr/lib"
else
PKG_CONFIGURE_OPTIONS+=        --without-rlm_ldap
endif

ifneq (${ADK_PACKAGE_FREERADIUS_MOD_SQL_MYSQL},)
PKG_CONFIGURE_LIBS+=	-lz
PKG_CONFIGURE_OPTIONS+=	\
	--with-mysql-include-dir="${STAGING_DIR}/usr/include" \
	--with-mysql-lib-dir="${STAGING_DIR}/usr/lib/mysql" \
	--without-threads \
	--with-rlm_sql
else
PKG_CONFIGURE_OPTIONS+=	--without-rlm_sql_mysql
endif
ifneq (${ADK_PACKAGE_FREERADIUS_MOD_SQL_PGSQL},)
PKG_CONFIGURE_OPTIONS+=	\
	--with-rlm_sql_postgresql-include-dir="${STAGING_DIR}/usr/include" \
	--with-rlm_sql_postgresql-lib-dir="${STAGING_DIR}/usr/lib" \
	--with-rlm_sql
else
PKG_CONFIGURE_OPTIONS+=	--without-rlm_sql_postgresql
endif

include ${TOPDIR}/mk/package.mk

define PKG_mod_template

INSTALL_MODS_$${ADK_PACKAGE_${1}}+=	${2}-install

${2}-install:
	${INSTALL_DIR} $${IDIR_${1}}/usr/lib/freeradius
	for m in ${2}; do \
		${CP} ${WRKINST}/usr/lib/freeradius/$$$${m}{,-*}.so \
		  $${IDIR_${1}}/usr/lib/freeradius/ ; \
	done
	${INSTALL_DIR} $${IDIR_${1}}/etc/freeradius
	for f in ${3}; do \
		${CP} ${WRKINST}/etc/freeradius/$$$${f} \
		  $${IDIR_${1}}/etc/freeradius/ ; \
	done
endef

$(eval $(call PKG_template,FREERADIUS,freeradius,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,FREERADIUS_DEMOCERTS,freeradius-democerts,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,FREERADIUS_MOD_CHAP,freeradius-mod-chap,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,FREERADIUS_MOD_DETAIL,freeradius-mod-detail,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,FREERADIUS_MOD_DIGEST,freeradius-mod-digest,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,FREERADIUS_MOD_EAP,freeradius-mod-eap,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,FREERADIUS_MOD_EAP_GTC,freeradius-mod-eap-gtc,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,FREERADIUS_MOD_EAP_MD5,freeradius-mod-eap-md5,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,FREERADIUS_MOD_EAP_MSCHAPV2,freeradius-mod-eap-mschapv2,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,FREERADIUS_MOD_EAP_PEAP,freeradius-mod-eap-peap,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,FREERADIUS_MOD_EAP_TLS,freeradius-mod-eap-tls,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,FREERADIUS_MOD_EAP_TTLS,freeradius-mod-eap-ttls,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,FREERADIUS_MOD_FILES,freeradius-mod-files,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,FREERADIUS_MOD_LDAP,freeradius-mod-ldap,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,FREERADIUS_MOD_MSCHAP,freeradius-mod-mschap,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,FREERADIUS_MOD_PAP,freeradius-mod-pap,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,FREERADIUS_MOD_PREPROCESS,freeradius-mod-preprocess,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,FREERADIUS_MOD_REALM,freeradius-mod-realm,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,FREERADIUS_MOD_SQL,freeradius-mod-sql,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,FREERADIUS_MOD_SQL_MYSQL,freeradius-mod-sql-mysql,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,FREERADIUS_MOD_SQL_PGSQL,freeradius-mod-sql-pgsql,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,FREERADIUS_UTILS,freeradius-utils,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

$(eval $(call PKG_mod_template,FREERADIUS_MOD_CHAP,rlm_chap,))
$(eval $(call PKG_mod_template,FREERADIUS_MOD_DETAIL,rlm_detail,))
$(eval $(call PKG_mod_template,FREERADIUS_MOD_DIGEST,rlm_digest,))
$(eval $(call PKG_mod_template,FREERADIUS_MOD_EAP,libeap rlm_eap,eap.conf))
$(eval $(call PKG_mod_template,FREERADIUS_MOD_EAP_GTC,rlm_eap_gtc,))
$(eval $(call PKG_mod_template,FREERADIUS_MOD_EAP_MD5,rlm_eap_md5,))
$(eval $(call PKG_mod_template,FREERADIUS_MOD_EAP_MSCHAPV2,rlm_eap_mschapv2,))
$(eval $(call PKG_mod_template,FREERADIUS_MOD_EAP_PEAP,rlm_eap_peap,))
$(eval $(call PKG_mod_template,FREERADIUS_MOD_EAP_TLS,rlm_eap_tls,))
$(eval $(call PKG_mod_template,FREERADIUS_MOD_EAP_TTLS,rlm_eap_ttls,))
$(eval $(call PKG_mod_template,FREERADIUS_MOD_FILES,rlm_files,acct_users preproxy_users users))
$(eval $(call PKG_mod_template,FREERADIUS_MOD_MSCHAP,rlm_mschap,))
$(eval $(call PKG_mod_template,FREERADIUS_MOD_LDAP,rlm_ldap,ldap.attrmap))
$(eval $(call PKG_mod_template,FREERADIUS_MOD_PAP,rlm_pap,))
$(eval $(call PKG_mod_template,FREERADIUS_MOD_PREPROCESS,rlm_preprocess,hints huntgroups))
$(eval $(call PKG_mod_template,FREERADIUS_MOD_REALM,rlm_realm,proxy.conf))
$(eval $(call PKG_mod_template,FREERADIUS_MOD_SQL,rlm_sql,sql.conf))
$(eval $(call PKG_mod_template,FREERADIUS_MOD_SQL_MYSQL,rlm_sql_mysql,))
$(eval $(call PKG_mod_template,FREERADIUS_MOD_SQL_PGSQL,rlm_sql_postgresql,))

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	${PKG_CONFIGURE_OPTIONS} \
			--with-openssl-includes=${STAGING_DIR}/usr/include \
			--with-openssl-libraries=${STAGING_DIR}/usr/lib \
			--enable-strict-dependencies \
			--with-raddbdir=/etc/freeradius \
			--without-edir \
			--without-snmp \
			--with-experimental-modules \
			--without-rlm_attr-rewrite \
			--without-rlm_checkval \
			--without-rlm_counter \
			--without-rlm_dbm \
			--without-rlm_eap_sim \
			--without-rlm_example \
			--without-rlm_ippool \
			--without-rlm_krb5 \
			--without-rlm_otp \
			--without-rlm_smsotp \
			--without-rlm_pam \
			--without-rlm_perl \
			--without-rlm_python \
			--without-rlm_radutmp \
			--without-rlm_smb \
			--without-rlm_sqlcounter \
			--without-rlm_sql_db2 \
			--without-rlm_sql_freetds \
			--without-rlm_sql_iodbc \
			--without-rlm_sql_oracle \
			--without-rlm_sql_sybase \
			--without-rlm_sql_unixodbc \
			--without-rlm_sql_log \
			--without-rlm_unix \
			--without-rlm_eap_ikev2 \
			--without-rlm_eap_tnc \
			--without-rlm_opendirectory \
			--without-rlm_sql_firebird \
			--without-rlm_sql_sqlite \
			--libdir=/usr/lib/freeradius \
			--libexecdir=/usr/lib/freeradius
BUILD_STYLE=		auto
INSTALL_STYLE=		auto
FAKE_FLAGS+=		R="${WRKINST}" \
			INSTALLSTRIP=""

post-install: ${INSTALL_MODS_y} ${INSTALL_MODS_m}
	${INSTALL_DIR} ${IDIR_FREERADIUS}/etc/freeradius
	${CP} ./files/users ${IDIR_FREERADIUS}/etc/freeradius/
	${INSTALL_DATA} ./files/radiusd.conf ${IDIR_FREERADIUS}/etc/freeradius
	${INSTALL_DATA} ./files/clients.conf ${IDIR_FREERADIUS}/etc/freeradius
	for f in dictionary; do \
		${CP} ${WRKINST}/etc/freeradius/$${f} \
		  ${IDIR_FREERADIUS}/etc/freeradius/ ; \
	done
	${INSTALL_DIR} ${IDIR_FREERADIUS}/usr/share/freeradius
	${CP} ${WRKINST}/usr/share/freeradius/dictionary \
		${IDIR_FREERADIUS}/usr/share/freeradius/
	for f in freeradius freeradius.internal rfc2865 rfc2866 rfc2867 rfc2868 rfc2869 rfc3162 rfc3576 rfc3580 rfc4072 rfc4372 rfc4675 rfc4679 rfc5176; do \
		cp ${WRKINST}/usr/share/freeradius/dictionary.$${f} \
		    ${IDIR_FREERADIUS}/usr/share/freeradius/ ; \
	done
	${INSTALL_DIR} ${IDIR_FREERADIUS}/usr/lib/freeradius
	${CP} ${WRKINST}/usr/lib/freeradius/libfreeradius-radius{,-*}.so \
	  ${IDIR_FREERADIUS}/usr/lib
	${INSTALL_DIR} ${IDIR_FREERADIUS}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/radiusd \
	  ${IDIR_FREERADIUS}/usr/sbin/
	${INSTALL_DIR} ${IDIR_FREERADIUS_DEMOCERTS}/etc/freeradius
	${CP} ${WRKINST}/etc/freeradius/certs \
	  ${IDIR_FREERADIUS_DEMOCERTS}/etc/freeradius/
	rm -rf ${IDIR_FREERADIUS_DEMOCERTS}/etc/freeradius/certs/README
	rm -rf ${IDIR_FREERADIUS_DEMOCERTS}/etc/freeradius/certs/new*
	rm -rf ${IDIR_FREERADIUS_DEMOCERTS}/etc/freeradius/certs/demoCA/index*
	rm -rf ${IDIR_FREERADIUS_DEMOCERTS}/etc/freeradius/certs/demoCA/serial*
	${INSTALL_DIR} ${IDIR_FREERADIUS_UTILS}/usr/bin
	for f in radclient; do \
	  ${CP} ${WRKINST}/usr/bin/$${f} \
	    ${IDIR_FREERADIUS_UTILS}/usr/bin/ ; \
	done

include ${TOPDIR}/mk/pkg-bottom.mk
