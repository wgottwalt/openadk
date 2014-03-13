# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		squid
PKG_VERSION:=		3.4.4
PKG_RELEASE:=		2
PKG_MD5SUM:=		b36ab3696485a86b43d9194ac9b6b7fe
PKG_DESCR:=		squid web and cache proxy
PKG_SECTION:=		proxy
PKG_DEPENDS:=		libopenssl libpthread libstdcxx libltdl
PKG_BUILDDEP:=		autotool openssl libtool
PKG_URL:=		http://www.squid-cache.org/
PKG_SITES:=		http://www.squid-cache.org/Versions/v3/3.4/
PKG_MULTI:=		1
PKG_NEED_CXX:=		1

PKG_SUBPKGS:=		SQUID SQUID_MOD_BASIC_AUTH_GETPWNAM SQUID_MOD_BASIC_AUTH_NCSA
PKG_SUBPKGS+=		SQUID_MOD_BASIC_AUTH_SMB SQUID_MOD_DIGEST_AUTH_FILE
PKG_SUBPKGS+=		SQUID_MOD_EXTERNAL_ACL_FILE_USERIP SQUID_MOD_EXTERNAL_ACL_UNIX_GROUP
PKG_SUBPKGS+=		SQUID_MOD_NTLM_AUTH_FAKE SQUID_MOD_BASIC_AUTH_LDAP

PKGSS_SQUID_MOD_BASIC_AUTH_LDAP:=	libopenldap
PKGSB_SQUID_MOD_BASIC_AUTH_LDAP:=	openldap

PKG_HOST_DEPENDS:=	!netbsd !cygwin

ifneq (${ADK_PACKAGE_SQUID_MOD_BASIC_AUTH_GETPWNAM},)
BASIC_AUTH_HELPERS+=	getpwnam
endif
ifneq (${ADK_PACKAGE_SQUID_MOD_BASIC_AUTH_NCSA},)
BASIC_AUTH_HELPERS+=	NCSA
endif
ifneq (${ADK_PACKAGE_SQUID_MOD_BASIC_AUTH_SMB},)
BASIC_AUTH_HELPERS+=	SMB
endif
ifneq (${ADK_PACKAGE_SQUID_MOD_BASIC_AUTH_LDAP},)
BASIC_AUTH_HELPERS+=	LDAP
endif
ifeq (${ADK_PACKAGE_SQUID_MOD_BASIC_AUTH_SMB}${ADK_PACKAGE_SQUID_MOD_BASIC_AUTH_NCSA}${ADK_PACKAGE_SQUID_MOD_BASIC_AUTH_GETPWNAM},)
BASIC_AUTH_HELPERS:=	none
endif

ifneq (${ADK_PACKAGE_SQUID_MOD_DIGEST_AUTH_FILE},)
DIGEST_AUTH_HELPERS:=	file
else
DIGEST_AUTH_HELPERS:=	none
endif
ifneq (${ADK_PACKAGE_SQUID_MOD_EXTERNAL_ACL_FILE_USERIP},)
EXTERNAL_ACL_HELPERS+=	file_userip
endif
ifneq (${ADK_PACKAGE_SQUID_MOD_EXTERNAL_ACL_UNIX_GROUP},)
EXTERNAL_ACL_HELPERS+=	unix_group
endif
ifeq (${ADK_PACKAGE_SQUID_MOD_EXTERNAL_ACL_IP_USER}${ADK_PACKAGE_SQUID_MOD_EXTERNAL_ACL_UNIX_GROUP},)
EXTERNAL_ACL_HELPERS:=	none
endif

ifneq (${ADK_PACKAGE_SQUID_MOD_NTLM_AUTH_FAKE},)
NTLM_AUTH_HELPERS+=	fake
else
NTLM_AUTH_HELPERS+=	none
endif

include ${TOPDIR}/mk/package.mk

define PKG_mod_template

INSTALL_MODS_$${ADK_PACKAGE_${1}}+=	${2}-install

${2}-install:
	${INSTALL_DIR} $${IDIR_${1}}/usr/lib/squid
	${INSTALL_BIN} ${WRKINST}/usr/lib/squid/${2} \
		$${IDIR_${1}}/usr/lib/squid/
endef

$(eval $(call PKG_template,SQUID,squid,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,SQUID_MOD_BASIC_AUTH_GETPWNAM,squid-mod-basic-auth-getpwnam,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,SQUID_MOD_BASIC_AUTH_NCSA,squid-mod-basic-auth-ncsa,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,SQUID_MOD_BASIC_AUTH_SMB,squid-mod-basic-auth-smb,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,SQUID_MOD_BASIC_AUTH_LDAP,squid-mod-basic-auth-ldap,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,SQUID_MOD_DIGEST_AUTH_FILE,squid-mod-digest-auth-file,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,SQUID_MOD_EXTERNAL_ACL_FILE_USERIP,squid-mod-external-acl-file-userip,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,SQUID_MOD_EXTERNAL_ACL_UNIX_GROUP,squid-mod-external-acl-unix-group,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,SQUID_MOD_NTLM_AUTH_FAKE,squid-mod-ntlm-auth-fake,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

$(eval $(call PKG_mod_template,SQUID_MOD_BASIC_AUTH_GETPWNAM,basic_getpwnam_auth))
$(eval $(call PKG_mod_template,SQUID_MOD_BASIC_AUTH_LDAP,basic_ldap_auth))
$(eval $(call PKG_mod_template,SQUID_MOD_BASIC_AUTH_NCSA,basic_ncsa_auth))
$(eval $(call PKG_mod_template,SQUID_MOD_BASIC_AUTH_SMB,basic_smb_auth))
$(eval $(call PKG_mod_template,SQUID_MOD_DIGEST_AUTH_FILE,digest_file_auth))
$(eval $(call PKG_mod_template,SQUID_MOD_EXTERNAL_ACL_FILE_USERIP,ext_file_userip_acl))
$(eval $(call PKG_mod_template,SQUID_MOD_EXTERNAL_ACL_LDAP_GROUP,ldap_auth))
$(eval $(call PKG_mod_template,SQUID_MOD_EXTERNAL_ACL_UNIX_GROUP,ext_unix_group_acl))
$(eval $(call PKG_mod_template,SQUID_MOD_NTLM_AUTH_FAKE,ntlm_fake_auth))

AUTOTOOL_STYLE:=	autoreconf
TARGET_LDFLAGS+=	-lpthread
CONFIGURE_ENV+=		ac_cv_sizeof_void_p=4 \
			ac_cv_sizeof_short=2 \
			ac_cv_sizeof_int=4 \
			ac_cv_sizeof_long=4 \
			ac_cv_sizeof_long_long=8 \
			ac_cv_sizeof___int64=0 \
			ac_cv_sizeof_int16_t=2 \
			ac_cv_sizeof_uint16_t=2 \
			ac_cv_sizeof_u_int16_t=2 \
			ac_cv_sizeof_int32_t=4 \
			ac_cv_sizeof_uint32_t=4 \
			ac_cv_sizeof_u_int32_t=4 \
			ac_cv_sizeof_int64_t=8 \
			ac_cv_sizeof_uint64_t=8 \
			ac_cv_sizeof_u_int64_t=8 \
			ac_cv_func_setresuid=no \
			ac_cv_func_va_copy=no \
			ac_cv_func___va_copy=no \
			ac_cv_epoll_works=yes \
			ac_cv_lib_nsl_main=no \
			ac_cv_func_strnstr=no \
			squid_cv_pf_inet6=yes \
			ac_cv_have_squid=yes
XAKE_FLAGS+=		MKDIR_P="mkdir -p"
XAKE_FLAGS+=		GCC_HONOUR_COPTS=s
CONFIGURE_ARGS+=	--datadir=/usr/share/squid \
			--libexecdir=/usr/lib/squid \
			--sysconfdir=/etc/squid \
			--with-gnu-ld \
			--enable-x-accelerator-vary \
			--with-pthreads \
			--with-dl \
			--disable-debug-cbdata \
			--enable-kill-parent-hack \
			--enable-arp-acl \
			--enable-ssl \
			--enable-err-languages=English \
			--enable-default-err-language=English \
			--enable-linux-netfilter \
			--enable-icmp \
			--enable-underscores \
			--enable-cache-digests \
			--enable-referer-log \
			--enable-delay-pools \
			--without-libcap \
			--disable-snmp \
			--disable-esi \
			--disable-htcp \
			--disable-wccp \
			--disable-wccpv2 \
			--enable-useragent-log \
			--with-openssl=${STAGING_TARGET_DIR}/usr \
			--without-krb5-config \
			--enable-negotiate-auth-helpers=no \
			--enable-auth \
			--enable-auth-basic="${BASIC_AUTH_HELPERS}" \
			--enable-auth-ntlm="${NTLM_AUTH_HELPERS}" \
			--enable-auth-digest="${DIGEST_AUTH_HELPERS}" \
			--enable-external-acl-helpers="${EXTERNAL_ACL_HELPERS}"

post-install: ${INSTALL_MODS_y} ${INSTALL_MODS_m}
	${INSTALL_DIR} ${IDIR_SQUID}/etc/squid
	${INSTALL_DATA} ${WRKINST}/etc/squid/mime.conf \
		${IDIR_SQUID}/etc/squid/
	${INSTALL_DATA} ./files/squid.conf ${IDIR_SQUID}/etc/squid/
	${INSTALL_DIR} ${IDIR_SQUID}/usr/share/squid/errors
	${CP} ${WRKINST}/usr/share/squid/errors/en \
		${IDIR_SQUID}/usr/share/squid/errors
	${CP} ${WRKINST}/usr/share/squid/errors/templates \
		${IDIR_SQUID}/usr/share/squid/errors
	${CP} ${WRKINST}/usr/share/squid/icons ${IDIR_SQUID}/usr/share/squid/
	${INSTALL_DIR} ${IDIR_SQUID}/usr/sbin ${IDIR_SQUID}/usr/lib/squid
	${INSTALL_BIN} ${WRKINST}/usr/sbin/squid ${IDIR_SQUID}/usr/sbin/
	${INSTALL_BIN} ${WRKINST}/usr/lib/squid/log_file_daemon \
		${IDIR_SQUID}/usr/lib/squid
	${INSTALL_BIN} ${WRKINST}/usr/lib/squid/unlinkd \
		${IDIR_SQUID}/usr/lib/squid

include ${TOPDIR}/mk/pkg-bottom.mk
