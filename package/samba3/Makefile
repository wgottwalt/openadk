# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		samba
PKG_VERSION:=		3.6.25
PKG_RELEASE:=		1
PKG_HASH:=		8f2c8a7f2bd89b0dfd228ed917815852f7c625b2bc0936304ac3ed63aaf83751
PKG_DESCR:=		smb file and print server
PKG_SECTION:=		net/fs
PKG_BUILDDEP:=		gettext-tiny util-linux popt
PKG_DEPENDS:=		samba-lib libuuid libpopt
PKG_URL:=		http://www.samba.org/
PKG_SITES:=		http://samba.org/samba/ftp/stable/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

WRKSRC=			${WRKDIST}/source3

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SAMBA,samba,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		samba_cv_CC_NEGATIVE_ENUM_VALUES=no \
			samba_cv_USE_SETRESUID=yes \
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
			--with-pam=no \
			--without-cluster-support \
			--without-sendfile-support \
			--without-winbind \
			--with-ldap=no

samba-install:
	${INSTALL_DIR} ${IDIR_SAMBA}/etc/samba 
	${INSTALL_DIR} ${IDIR_SAMBA}/usr/sbin
	${INSTALL_DIR} ${IDIR_SAMBA}/usr/bin
	${INSTALL_DIR} ${IDIR_SAMBA}/usr/lib/{charset,vfs}
	${INSTALL_DATA} ${WRKINST}/usr/lib/charset/*.so \
			${IDIR_SAMBA}/usr/lib/charset
	${INSTALL_DATA} ./files/smb.conf ${IDIR_SAMBA}/etc/samba
	${INSTALL_BIN} ${WRKINST}/usr/sbin/{nmbd,smbd} ${IDIR_SAMBA}/usr/sbin
	${CP} ${WRKINST}/usr/lib/vfs/*.so* ${IDIR_SAMBA}/usr/lib/vfs
	${INSTALL_DATA} ${WRKINST}/usr/lib/*.dat ${IDIR_SAMBA}/usr/lib
	${INSTALL_BIN} ${WRKINST}/usr/bin/smbpasswd \
		${IDIR_SAMBA}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/smbclient \
		${IDIR_SAMBA}/usr/bin
	${CP} ${WRKINST}/usr/lib/{libsmbclient,libsmbsharemodes,libnetapi}.so* \
		${IDIR_SAMBA}/usr/lib
	$(CP) ${WRKINST}/usr/lib/{libtalloc,libtdb,libtevent}.so* \
		${IDIR_SAMBA}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
