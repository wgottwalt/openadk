# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		samba
PKG_VERSION:=		3.6.23
PKG_RELEASE:=		1
PKG_MD5SUM:=		2f7aee1dc5d31aefcb364600915b31dc
PKG_DESCR:=		NetBIOS/SMB file and print server
PKG_SECTION:=		net/fs
PKG_BUILDDEP:=		gettext-tiny util-linux popt
PKG_DEPENDS:=		samba-lib libuuid libpopt
PKG_URL:=		http://www.samba.org/
PKG_SITES:=		http://samba.org/samba/ftp/stable/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_SUBPKGS:=		SAMBA SAMBA_CLIENT SAMBA_PASSWD SAMBA_LIB
PKGSD_SAMBA_CLIENT:=	NetBIOS/SMB client
PKGSS_SAMBA_CLIENT:=	libreadline samba-lib
PKGSD_SAMBA_PASSWD:=	SMB password utility
PKGSD_SAMBA_LIB:=	SMB libraries

PKG_FLAVOURS_SAMBA:=	WITH_WINBIND WITH_LDAP
PKGFD_WITH_WINBIND:=	enable winbind support
PKGFS_WITH_WINBIND:=	libkrb5
PKGFB_WITH_WINBIND:=	krb5
PKGFD_WITH_LDAP:=	enable LDAP support
PKGFS_WITH_LDAP:=	libopenldap
PKGFB_WITH_LDAP:=	openldap

WRKSRC=			${WRKDIST}/source3

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SAMBA,samba,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,SAMBA_CLIENT,samba-client,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_SAMBA_CLIENT},${PKG_SECTION}))
$(eval $(call PKG_template,SAMBA_PASSWD,samba-passwd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_SAMBA_PASSWD},${PKG_SECTION}))
$(eval $(call PKG_template,SAMBA_LIB,samba-lib,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_SAMBA_LIB},${PKG_SECTION}))

ifneq ($(ADK_PACKAGE_SAMBA_WITH_WINBIND),)
CONFIGURE_ARGS+=	--with-winbind \
			--with-krb5="$(STAGING_TARGET_DIR)/usr"
else
CONFIGURE_ARGS+=	--without-winbind
endif

ifneq ($(ADK_PACKAGE_SAMBA_WITH_LDAP),)
CONFIGURE_ARGS+=	--with-ldap
else
CONFIGURE_ARGS+=	--with-ldap=no
endif

CONFIGURE_ENV+=		samba_cv_CC_NEGATIVE_ENUM_VALUES=no \
			samba_cv_USE_SETRESUID=no \
			samba_cv_HAVE_WRFILE_KEYTAB=yes \
			ac_cv_func_ext_krb5_enctype_to_string=yes \
			smb_krb5_cv_enctype_to_string_takes_krb5_context_arg=yes \
			smb_krb5_cv_enctype_to_string_takes_size_t_arg=no \
			ac_cv_lib_ext_nsl_connect=no \
			ac_cv_search_yp_get_default_domain=no \
			ac_cv_lib_ext_nsl_gethostbyname=no \
			ac_cv_file__proc_sys_kernel_core_pattern=yes \
			libreplace_cv_HAVE_GETADDRINFO=no
CONFIGURE_ARGS+=	--libdir=/usr/lib \
			--localstatedir=/var/log/samba \
			--with-configdir=/etc/samba \
			--with-lockdir=/var/run/samba \
			--with-privatedir=/etc/samba \
			--with-libiconv=/dev/null \
			--with-syslog \
			--disable-cups \
			--disable-swat \
			--disable-avahi \
			--with-utmp=no \
			--without-cluster-support \
			--without-sendfile-support

samba-install:
	${INSTALL_DIR} ${IDIR_SAMBA}/etc/samba ${IDIR_SAMBA}/usr/sbin
	${INSTALL_DIR} ${IDIR_SAMBA}/usr/lib/{charset,vfs}
	${INSTALL_DATA} ${WRKINST}/usr/lib/charset/CP850.so \
			${IDIR_SAMBA}/usr/lib/charset
	${INSTALL_DATA} ./files/smb.conf ${IDIR_SAMBA}/etc/samba
	${INSTALL_BIN} ${WRKINST}/usr/sbin/{nmbd,smbd} ${IDIR_SAMBA}/usr/sbin
	${CP} ${WRKINST}/usr/lib/vfs/*.so* ${IDIR_SAMBA}/usr/lib/vfs
	${INSTALL_DATA} ${WRKINST}/usr/lib/*.dat ${IDIR_SAMBA}/usr/lib

samba-passwd-install:
	${INSTALL_DIR} ${IDIR_SAMBA_PASSWD}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/smbpasswd \
		${IDIR_SAMBA_PASSWD}/usr/bin

samba-client-install:
	${INSTALL_DIR} ${IDIR_SAMBA_CLIENT}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/smbclient \
		${IDIR_SAMBA_CLIENT}/usr/bin

samba-lib-install:
	${INSTALL_DIR} ${IDIR_SAMBA_LIB}/usr/lib
	${CP} ${WRKINST}/usr/lib/{libsmbclient,libsmbsharemodes,libnetapi}.so* \
		${IDIR_SAMBA_LIB}/usr/lib
	$(CP) ${WRKINST}/usr/lib/{libtalloc,libtdb,libtevent}.* \
		${IDIR_SAMBA_LIB}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
