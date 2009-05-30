# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		krb5
PKG_VERSION:=		1.6.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		2dc1307686eb1c2bf1ab08ea805dad46
PKG_DESCR:=		MIT kerberos server
PKG_SECTION:=		net
PKG_DEPENDS:=		krb5-libs
PKG_URL:=		http://web.mit.edu/kerberos
PKG_SITES:=		http://web.mit.edu/kerberos/dist/krb5/1.6/

PKG_DESCR_1:=		MIT kerberos libraries
PKG_SECTION_1:=		libs

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}-signed.tar
WRKSRC=			${WRKDIST}/src

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,KRB5_SERVER,krb5-server,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,KRB5_LIBS,krb5-libs,$(PKG_VERSION)-${PKG_RELEASE},,${PKG_DESCR_1},${PKG_SECTION_1}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--without-krb4 --disable-static --without-tcl
CONFIGURE_ENV+=		krb5_cv_attr_constructor_destructor=yes,yes \
			ac_cv_func_regcomp=yes \
			ac_cv_printf_positional=yes \
			ac_cv_file__etc_environment=no \
			ac_cv_file__etc_TIMEZONE=no
BUILD_STYLE=		auto
INSTALL_STYLE=		auto confprog

post-extract:
	(cd ${WRKDIR}; tar xzf ${PKG_NAME}-${PKG_VERSION}.tar.gz)

post-install:
	${INSTALL_DIR} ${IDIR_KRB5_SERVER}/etc
	${INSTALL_DIR} ${IDIR_KRB5_SERVER}/etc/krb5kdc
	${INSTALL_DIR} ${IDIR_KRB5_SERVER}/usr/sbin
	${INSTALL_DIR} ${IDIR_KRB5_SERVER}/usr/lib
	${INSTALL_DIR} ${IDIR_KRB5_SERVER}/usr/lib/krb5/plugins/kdb
	${INSTALL_DATA} ./files/kdc.conf ${IDIR_KRB5_SERVER}/etc/krb5kdc
	${INSTALL_BIN} ${WRKINST}/usr/sbin/{ktutil,kdb5_util,krb5kdc,kadmind,kadmin.local,kadmin} \
		${IDIR_KRB5_SERVER}/usr/sbin
	${INSTALL_DATA} ${WRKINST}/usr/lib/krb5/plugins/kdb/db2.so \
		${IDIR_KRB5_SERVER}/usr/lib/krb5/plugins/kdb
	${CP} ${WRKINST}/usr/lib/lib{des425,gssrpc,kadm5clnt,kadm5srv,kdb5}.so* \
		${IDIR_KRB5_SERVER}/usr/lib
	# krb5-libs
	${INSTALL_DIR} ${IDIR_KRB5_LIBS}/etc
	${INSTALL_DIR} ${IDIR_KRB5_LIBS}/usr/lib
	${INSTALL_DATA} ./files/krb5.conf ${IDIR_KRB5_LIBS}/etc
	${CP} ${WRKINST}/usr/lib/lib{com_err,gssapi_krb5,k5crypto,krb5,krb5support}.so* \
		${IDIR_KRB5_LIBS}/usr/lib
	echo '/usr/lib/libgssapi_krb5.so		mechglue_internal_krb5_init' > ${IDIR_KRB5_LIBS}/etc/gssapi_mech.conf

include ${TOPDIR}/mk/pkg-bottom.mk
