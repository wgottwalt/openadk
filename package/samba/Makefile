# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		samba
PKG_VERSION:=		3.5.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		7c8d2a34b649380d5df838c3e030dbec
PKG_DESCR:=		NetBIOS/SMB file and print server
PKG_SECTION:=		net
PKG_URL:=		http://www.samba.org
PKG_SITES:=		http://samba.org/samba/ftp/stable/

WRKSRC=			${WRKDIST}/source3

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SAMBA,samba,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,SAMBA_CLIENT,samba-client,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,SAMBA_PASSWD,samba-passwd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TLDFLAGS+=		-Wl,-rpath -Wl,/usr/lib/samba -lintl
CONFIGURE_ENV+=		samba_cv_CC_NEGATIVE_ENUM_VALUES=no \
			samba_cv_USE_SETRESUID=no \
			ac_cv_lib_ext_nsl_connect=no \
			ac_cv_search_yp_get_default_domain=no \
			ac_cv_lib_ext_nsl_gethostbyname=no
CONFIGURE_ARGS+=	--libdir=/usr/lib/samba \
			--localstatedir=/var/log/samba \
			--with-configdir=/etc/samba \
			--with-lockdir=/var/run/samba \
			--with-privatedir=/etc/samba \
			--with-libiconv=/dev/null \
			--with-syslog \
			--without-winbind \
			--disable-cups \
			--disable-swat \
			--disable-avahi \
			--with-utmp=no \
			--with-ldap=no \
			--without-cluster-support \
			--without-sendfile-support

post-install:
	${INSTALL_DIR} ${IDIR_SAMBA}/etc/samba ${IDIR_SAMBA}/usr/sbin
	${INSTALL_DIR} ${IDIR_SAMBA}/usr/lib/samba/{charset,vfs}
	${INSTALL_DATA} ${WRKINST}/usr/lib/samba/charset/CP850.so \
			${IDIR_SAMBA}/usr/lib/samba/charset
	${INSTALL_DATA} ./files/smb.conf ${IDIR_SAMBA}/etc/samba/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/{nmbd,smbd} ${IDIR_SAMBA}/usr/sbin
	${CP} ${WRKINST}/usr/lib/samba/*.so* ${IDIR_SAMBA}/usr/lib/samba
	${CP} ${WRKINST}/usr/lib/samba/vfs/*.so* ${IDIR_SAMBA}/usr/lib/samba/vfs
	${INSTALL_DATA} ${WRKINST}/usr/lib/samba/*.dat ${IDIR_SAMBA}/usr/lib/samba
	${INSTALL_DIR} ${IDIR_SAMBA_PASSWD}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/smbpasswd \
		${IDIR_SAMBA_PASSWD}/usr/bin/
	${INSTALL_DIR} ${IDIR_SAMBA_CLIENT}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/smbclient \
		${IDIR_SAMBA_CLIENT}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
