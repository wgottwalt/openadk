# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		squid
PKG_VERSION:=		3.0.STABLE15
PKG_RELEASE:=		1
PKG_MD5SUM:=		4c41585af1d90ccbcf1d23ec0dda6f8d
PKG_DESCR:=		squid web and cache proxy
PKG_SECTION:=		net
PKG_DEPENDS:=		libopenssl libpthread
PKG_URL:=		http://www.squid-cache.org
PKG_SITES:=		http://www.squid-cache.org/Versions/v3/3.0/

AUTH_MODULES:=		basic digest ntlm
ifneq (${ADK_PACKAGE_SQUID_MOD_BASIC_AUTH_GETPWNAM},)
BASIC_AUTH_HELPERS+=	getpwnam
endif
ifneq (${ADK_PACKAGE_SQUID_MOD_BASIC_AUTH_NCSA},)
BASIC_AUTH_HELPERS+=	NCSA
endif
ifneq (${ADK_PACKAGE_SQUID_MOD_BASIC_AUTH_SMB},)
BASIC_AUTH_HELPERS+=	SMB
endif
ifneq (${ADK_PACKAGE_SQUID_MOD_DIGEST_AUTH_PASSWORD},)
DIGEST_AUTH_HELPERS:=	password
endif
ifneq (${ADK_PACKAGE_SQUID_MOD_EXTERNAL_ACL_IP_USER},)
EXTERNAL_ACL_HELPERS+=	ip_user
endif
ifneq (${ADK_PACKAGE_SQUID_MOD_EXTERNAL_ACL_UNIX_GROUP},)
EXTERNAL_ACL_HELPERS+=	unix_group
endif
ifneq (${ADK_PACKAGE_SQUID_MOD_NTLM_AUTH_FAKEAUTH},)
NTLM_AUTH_HELPERS+=	fakeauth
endif
ifneq (${ADK_PACKAGE_SQUID_MOD_NTLM_AUTH_SMB_AUTH},)
NTLM_AUTH_HELPERS+=	SMB
endif

include ${TOPDIR}/mk/package.mk

define PKG_mod_template

INSTALL_MODS_$${ADK_PACKAGE_${1}}+=	${2}-install

${2}-install:
	${INSTALL_DIR} $${IDIR_${1}}/usr/lib/squid
	${INSTALL_BIN} ${WRKINST}/usr/lib/squid/${2} \
		$${IDIR_${1}}/usr/lib/squid/
endef

$(eval $(call PKG_template,SQUID,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,SQUID_MOD_BASIC_AUTH_GETPWNAM,${PKG_NAME}-mod-basic-auth-getpwnam,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,SQUID_MOD_BASIC_AUTH_NCSA,${PKG_NAME}-mod-basic-auth-ncsa,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,SQUID_MOD_BASIC_AUTH_SMB,${PKG_NAME}-mod-basic-auth-smb,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,SQUID_MOD_DIGEST_AUTH_PASSWORD,${PKG_NAME}-mod-digest-auth-password,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,SQUID_MOD_EXTERNAL_ACL_IP_USER,${PKG_NAME}-mod-external-acl-ip-user,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,SQUID_MOD_EXTERNAL_ACL_UNIX_GROUP,${PKG_NAME}-mod-external-acl-unix-group,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,SQUID_MOD_NTLM_AUTH_FAKEAUTH,${PKG_NAME}-mod-ntlm-auth-fakeauth,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,SQUID_MOD_NTLM_AUTH_SMB_AUTH,${PKG_NAME}-mod-ntlm-auth-smb-auth,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

$(eval $(call PKG_mod_template,SQUID_MOD_BASIC_AUTH_GETPWNAM,getpwname_auth))
$(eval $(call PKG_mod_template,SQUID_MOD_BASIC_AUTH_LDAP,ldap))
$(eval $(call PKG_mod_template,SQUID_MOD_BASIC_AUTH_NCSA,ncsa_auth))
$(eval $(call PKG_mod_template,SQUID_MOD_BASIC_AUTH_SMB,smb_auth))
$(eval $(call PKG_mod_template,SQUID_MOD_DIGEST_AUTH_PASSWORD,digest_pw_auth))
$(eval $(call PKG_mod_template,SQUID_MOD_EXTERNAL_ACL_IP_USER,ip_user_check))
$(eval $(call PKG_mod_template,SQUID_MOD_EXTERNAL_ACL_LDAP_GROUP,ldap_auth))
$(eval $(call PKG_mod_template,SQUID_MOD_EXTERNAL_ACL_UNIX_GROUP,squid_unix_group))
$(eval $(call PKG_mod_template,SQUID_MOD_NTLM_AUTH_FAKEAUTH,fakeauth_auth))
$(eval $(call PKG_mod_template,SQUID_MOD_NTLM_AUTH_SMB_AUTH,ntlm_auth))

CONFIGURE_STYLE:=	autotool gnu
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
			ac_cv_func_strnstr=no
CONFIGURE_ARGS+=	--datadir=/usr/share/squid \
			--libexecdir=/usr/lib/squid \
			--sysconfdir=/etc/squid \
			--with-gnu-ld \
			--enable-x-accelerator-vary \
			--with-pthreads \
			--with-dl \
			--enable-icmp \
			--enable-kill-parent-hack \
			--enable-arp-acl \
			--enable-ssl \
			--enable-htcp \
			--disable-esi \
			--enable-err-languages=English \
			--enable-default-err-language=English \
			--enable-linux-netfilter \
			--enable-icmp \
			--enable-external-acl-helpers="" \
			--enable-underscores \
			--enable-cache-digests \
			--enable-referer-log \
			--enable-delay-pools \
			--disable-wccp \
			--disable-wccpv2 \
			--enable-useragent-log \
			--with-openssl=${STAGING_DIR}/usr \
			--enable-auth="${AUTH_MODULES}" \
			--enable-basic-auth-helpers="${BASIC_AUTH_HELPERS}" \
			--enable-ntlm-auth-helpers="${NTLM_AUTH_HELPERS}" \
			--enable-digest-auth-helpers="${DIGEST_AUTH_HELPERS}" \
			--enable-external-acl-helpers="${EXTERNAL_ACL_HELPERS}"
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install: ${INSTALL_MODS_y} ${INSTALL_MODS_m}
	${INSTALL_DIR} ${IDIR_SQUID}/etc/squid
	${INSTALL_DATA} ${WRKINST}/etc/squid/mime.conf \
			${WRKINST}/etc/squid/squid.conf ${IDIR_SQUID}/etc/squid/
	${INSTALL_DIR} ${IDIR_SQUID}/usr/share/squid
	${CP} ${WRKINST}/usr/share/squid/* ${IDIR_SQUID}/usr/share/squid/
	${INSTALL_DIR} ${IDIR_SQUID}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/squid ${IDIR_SQUID}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
