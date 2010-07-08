# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		krb5
PKG_VERSION:=		1.8.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		e29a78b108c4687f7e7937110d1d0415
PKG_DESCR:=		MIT kerberos server
PKG_SECTION:=		crypto
PKG_DEPENDS:=		libkrb5 libncurses libss libcom-err
PKG_BUILDDEP+=		ncurses e2fsprogs
PKG_URL:=		http://web.mit.edu/kerberos
PKG_SITES:=		http://web.mit.edu/kerberos/dist/krb5/1.8/

PKG_NOPARALLEL:=	1

PKG_DESCR_LIB:=		MIT kerberos libraries
PKG_SECTION_LIB:=	libs

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}-signed.tar
WRKSRC=			${WRKDIST}/src

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,KRB5_SERVER,krb5-server,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBKRB5,libkrb5,$(PKG_VERSION)-${PKG_RELEASE},,${PKG_DESCR_LIB},${PKG_SECTION_LIB}))

SUB_INSTALLS-y:=
SUB_INSTALLS-m:=
SUB_INSTALLS-${ADK_PACKAGE_LIBKRB5}+=	libkrb5-install

TCFLAGS+=		-I${STAGING_DIR}/usr/include/et
CONFIGURE_ARGS+=	--disable-static \
			--disable-profiled \
			--with-system-ss \
			--with-system-et \
			--without-tcl
CONFIGURE_ENV+=		krb5_cv_attr_constructor_destructor=yes,yes \
			ac_cv_func_regcomp=yes \
			ac_cv_printf_positional=yes \
			ac_cv_file__etc_environment=no \
			ac_cv_file__etc_TIMEZONE=no

post-extract:
	(cd ${WRKDIR}; tar xzf ${PKG_NAME}-${PKG_VERSION}.tar.gz)

post-install: ${SUB_INSTALLS-m} ${SUB_INSTALLS-y}
	${INSTALL_DIR} ${IDIR_KRB5_SERVER}/etc
	${INSTALL_DIR} ${IDIR_KRB5_SERVER}/etc/krb5kdc
	${INSTALL_DIR} ${IDIR_KRB5_SERVER}/usr/sbin
	${INSTALL_DIR} ${IDIR_KRB5_SERVER}/usr/lib
	${INSTALL_DIR} ${IDIR_KRB5_SERVER}/usr/lib/krb5/plugins/kdb
	${INSTALL_DATA} ./files/kdc.conf ${IDIR_KRB5_SERVER}/etc/krb5kdc
	${INSTALL_BIN} ${WRKINST}/usr/bin/{ktutil,kadmin} \
		${IDIR_KRB5_SERVER}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/{kdb5_util,krb5kdc,kadmind,kadmin.local} \
		${IDIR_KRB5_SERVER}/usr/sbin
	${INSTALL_DATA} ${WRKINST}/usr/lib/krb5/plugins/kdb/db2.so \
		${IDIR_KRB5_SERVER}/usr/lib/krb5/plugins/kdb
	${CP} ${WRKINST}/usr/lib/lib{gssrpc,kadm5clnt,kadm5srv,kdb5}.so* \
		${IDIR_KRB5_SERVER}/usr/lib

libkrb5-install:
	${INSTALL_DIR} ${IDIR_LIBKRB5}/etc
	${INSTALL_DIR} ${IDIR_LIBKRB5}/usr/lib
	${INSTALL_DATA} ./files/krb5.conf ${IDIR_LIBKRB5}/etc
	${CP} ${WRKINST}/usr/lib/lib{gssapi_krb5,k5crypto,krb5,krb5support}.so* \
		${IDIR_LIBKRB5}/usr/lib
	echo '/usr/lib/libgssapi_krb5.so		mechglue_internal_krb5_init' \
		> ${IDIR_LIBKRB5}/etc/gssapi_mech.conf

include ${TOPDIR}/mk/pkg-bottom.mk
