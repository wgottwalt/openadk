# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		krb5
PKG_VERSION:=		1.12.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		524b1067b619cb5bf780759b6884c3f5
PKG_DESCR:=		MIT kerberos server
PKG_SECTION:=		crypto
PKG_DEPENDS:=		libkrb5 libncurses libss libcom-err keyutils
PKG_DEPENDS+=		libpthread
PKG_BUILDDEP:=		ncurses e2fsprogs gettext-tiny bison-host
PKG_URL:=		http://web.mit.edu/kerberos/
PKG_SITES:=		http://web.mit.edu/kerberos/dist/krb5/1.12/
PKG_NOPARALLEL:=	1
PKG_LIBNAME:=		libkrb5
PKG_OPTS:=		dev

PKG_SUBPKGS:=		KRB5_SERVER KRB5_CLIENT KRB5_UTIL LIBKRB5
PKGSD_LIBKRB5:=		MIT kerberos libraries
PKGSC_LIBKRB5:=		libs
PKGSD_KRB5_CLIENT:=	MIT kerberos client tools
PKGSC_KRB5_CLIENT:=	crypto
PKGSS_KRB5_CLIENT:=	libkrb5 libncurses libss libcom-err
PKGSD_KRB5_UTIL:=	MIT kerberos utility (ktutil)
PKGSC_KRB5_UTIL:=	crypto
PKGSS_KRB5_UTIL:=	libkrb5 libncurses libss libcom-err

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}-signed.tar
WRKSRC=			${WRKDIST}/src

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,KRB5_SERVER,krb5-server,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,KRB5_CLIENT,krb5-client,$(PKG_VERSION)-${PKG_RELEASE},${PKGSS_KRB5_CLIENT},${PKGSD_KRB5_CLIENT},${PKGSC_KRB5_CLIENT}))
$(eval $(call PKG_template,KRB5_UTIL,krb5-util,$(PKG_VERSION)-${PKG_RELEASE},${PKGSS_KRB5_UTIL},${PKGSD_KRB5_UTIL},${PKGSC_KRB5_UTIL}))
$(eval $(call PKG_template,LIBKRB5,libkrb5,$(PKG_VERSION)-${PKG_RELEASE},,${PKGSD_LIBKRB5},${PKGSC_LIBKRB5},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-static \
			--disable-profiled \
			--with-system-ss \
			--with-system-et \
			--without-system-verto \
			--without-tcl
CONFIGURE_ENV+=		krb5_cv_attr_constructor_destructor=yes,yes \
			ac_cv_func_regcomp=yes \
			ac_cv_printf_positional=yes \
			ac_cv_file__etc_environment=no \
			ac_cv_file__etc_TIMEZONE=no

post-extract:
	(cd ${WRKDIR}; tar xzf ${PKG_NAME}-${PKG_VERSION}.tar.gz)

pre-build:
	# fix nm call in script, we need the GNU version of nm
	$(SED) "s#@@NM@@#${NM}#" ${WRKSRC}/util/export-check.pl

krb5-util-install:
	${INSTALL_DIR} ${IDIR_KRB5_UTIL}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/ktutil \
		${IDIR_KRB5_UTIL}/usr/bin

krb5-server-install:
	${INSTALL_DIR} ${IDIR_KRB5_SERVER}/etc/krb5kdc
	${INSTALL_DIR} ${IDIR_KRB5_SERVER}/usr/sbin
	${INSTALL_DIR} ${IDIR_KRB5_SERVER}/usr/lib/krb5/plugins/kdb
	${INSTALL_DATA} ./files/kdc.conf ${IDIR_KRB5_SERVER}/etc/krb5kdc
	${INSTALL_DATA} ./files/kadm5.acl ${IDIR_KRB5_SERVER}/etc/krb5kdc
	${INSTALL_BIN} ${WRKINST}/usr/bin/kadmin \
		${IDIR_KRB5_SERVER}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/{kdb5_util,krb5kdc,kadmind,kadmin.local} \
		${IDIR_KRB5_SERVER}/usr/sbin
	${INSTALL_DATA} ${WRKINST}/usr/lib/krb5/plugins/kdb/db2.so \
		${IDIR_KRB5_SERVER}/usr/lib/krb5/plugins/kdb

krb5-client-install:
	${INSTALL_DIR} ${IDIR_KRB5_CLIENT}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/{kinit,kpasswd,klist,kdestroy} \
		${IDIR_KRB5_CLIENT}/usr/bin

libkrb5-install:
	${INSTALL_DIR} ${IDIR_LIBKRB5}/etc
	${INSTALL_DIR} ${IDIR_LIBKRB5}/usr/lib
	${INSTALL_DATA} ./files/krb5.conf ${IDIR_LIBKRB5}/etc
	${CP} ${WRKINST}/usr/lib/lib{verto,gssrpc,kadm5clnt*,kadm5srv*,kdb5}.so* \
		${IDIR_LIBKRB5}/usr/lib
	${CP} ${WRKINST}/usr/lib/lib{gssapi_krb5,k5crypto,krb5,krb5support}.so* \
		${IDIR_LIBKRB5}/usr/lib
	echo '/usr/lib/libgssapi_krb5.so		mechglue_internal_krb5_init' \
		> ${IDIR_LIBKRB5}/etc/gssapi_mech.conf

include ${TOPDIR}/mk/pkg-bottom.mk
