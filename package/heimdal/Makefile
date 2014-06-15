# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		heimdal
PKG_VERSION:=		1.5.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		30b379e3de12f332fbd201131f02ffca
PKG_DESCR:=		kerberos server
PKG_SECTION:=		app/crypto
PKG_BUILDDEP:=		autotool openssl ncurses e2fsprogs readline heimdal-host
PKG_DEPENDS:=		libheimdal libncurses libcom-err libreadline libopenssl
HOST_BUILDDEP:=		bison-host
PKG_URL:=		http://www.h5l.org/
PKG_SITES:=		http://www.h5l.org/dist/src/
PKG_NOPARALLEL:=	1
PKG_LIBNAME:=		libheimdal
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_SUBPKGS:=		HEIMDAL_SERVER LIBHEIMDAL
PKGSD_LIBHEIMDAL:=	kerberos libraries
PKGSC_LIBHEIMDAL:=	libs/crypto

PKG_FLAVOURS_HEIMDAL_SERVER:=	WITH_PKINIT
PKGFD_WITH_PKINIT:		Enable PK-INIT

PKG_CHOICES_HEIMDAL_SERVER:=	WITH_LDAP WITH_BDB
PKGCD_WITH_LDAP:=		use OpenLDAP as database backend
PKGCS_WITH_LDAP:=		libopenldap
PKGCB_WITH_LDAP:=		openldap
PKGCD_WITH_BDB:=		use Berkeley DB as database backend
PKGCS_WITH_BDB:=		libdb
PKGCB_WITH_BDB:=		db

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,HEIMDAL,heimdal,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,HEIMDAL_SERVER,heimdal-server,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBHEIMDAL,libheimdal,$(PKG_VERSION)-${PKG_RELEASE},,${PKGSD_LIBHEIMDAL},${PKGSC_LIBHEIMDAL},${PKG_OPTS}))

AUTOTOOL_STYLE:=	autoreconf
TARGET_LDFLAGS+=	-ltinfo
CONFIGURE_OPTS:=	--with-hdbdir=/etc/heimdal \
			--disable-otp \
			--disable-ndbm-db \
			--libdir=/usr/lib/heimdal \
			--libexecdir=/usr/sbin \
			--includedir=/usr/include/heimdal \
			--without-sqlite3 \
			--without-libedit \
			--disable-sqlite-cache \
			--with-openssl=${STAGING_TARGET_DIR}/usr \
			--with-readline=${STAGING_TARGET_DIR}/usr \
			--with-ipv6 \
			--sysconfdir=/etc/heimdal

ifeq ($(ADK_PACKAGE_HEIMDAL_SERVER_WITH_BDB),y)
CONFIGURE_ARGS+=	--with-berkeley-db
else
CONFIGURE_ARGS+=	--without-berkeley-db
endif

ifeq ($(ADK_PACKAGE_HEIMDAL_SERVER_WITH_LDAP),y)
CONFIGURE_ARGS+=	--with-openldap=yes
CONFIGURE_ARGS+=	--with-openldap-include=${STAGING_TARGET_DIR}/usr
CONFIGURE_ARGS+=	--with-openldap-lib=${STAGING_TARGET_DIR}/usr
else
CONFIGURE_ARGS+=        --without-openldap
endif

ifeq ($(ADK_PACKAGE_HEIMDAL_SERVER_WITH_PKINIT),y)
CONFIGURE_OPTS+=	--enable-pk-init
else
CONFIGURE_OPTS+=	--disable-pk-init \
			--disable-kx509
endif

TARGET_CFLAGS+=		-I${STAGING_TARGET_DIR}/usr/include/et -pthread

CONFIGURE_ARGS+=	${CONFIGURE_OPTS} --with-cross-tools=${STAGING_HOST_DIR}/usr/libexec/heimdal
CONFIGURE_ENV+=		ac_cv_func_getaddrinfo_numserv=yes

HOST_CONFIGURE_ARGS+=	--disable-pk-init \
			--without-openldap \
			--disable-kcm \
			--disable-kx509 \
			--disable-ndbm-db \
			--without-berkeley-db \
			--disable-sqlite-cache \
			--disable-otp

heimdal-server-install:
ifeq (${ADK_COMPILE_HEIMDAL_WITH_DB_LDAP},y)
	${INSTALL_DIR} ${IDIR_HEIMDAL_SERVER}/etc/openldap/schema
	${INSTALL_DATA} ${WRKBUILD}/lib/hdb/hdb.schema \
		${IDIR_HEIMDAL_SERVER}/etc/openldap/schema
endif
	${INSTALL_DIR} ${IDIR_HEIMDAL_SERVER}/etc/heimdal
	${INSTALL_DIR} ${IDIR_HEIMDAL_SERVER}/usr/sbin
	${INSTALL_DIR} ${IDIR_HEIMDAL_SERVER}/usr/lib/heimdal
	${CP} ${WRKINST}/usr/lib/heimdal/libkdc.so* \
		${IDIR_HEIMDAL_SERVER}/usr/lib/heimdal
	${CP} ${WRKINST}/usr/lib/heimdal/libkadm5srv.so* \
		${IDIR_HEIMDAL_SERVER}/usr/lib/heimdal
	${CP} ${WRKINST}/usr/lib/heimdal/libhdb.so* \
		${IDIR_HEIMDAL_SERVER}/usr/lib/heimdal
	${INSTALL_DATA} ./files/{krb5.conf,kdc.conf,kadmind.acl} \
		${IDIR_HEIMDAL_SERVER}/etc/heimdal
	${INSTALL_BIN} ${WRKINST}/usr/sbin/kdc \
		${IDIR_HEIMDAL_SERVER}/usr/sbin/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/kadmind \
		${IDIR_HEIMDAL_SERVER}/usr/sbin/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/kpasswdd \
		${IDIR_HEIMDAL_SERVER}/usr/sbin/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/kstash \
		${IDIR_HEIMDAL_SERVER}/usr/sbin/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/ktutil \
		${IDIR_HEIMDAL_SERVER}/usr/sbin/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/kadmin \
		${IDIR_HEIMDAL_SERVER}/usr/sbin/

libheimdal-install:
	${INSTALL_DIR} ${IDIR_LIBHEIMDAL}/usr/lib/heimdal
ifeq ($(ADK_COMPILE_HEIMDAL_WITH_PKINIT),y)
	${CP} ${WRKINST}/usr/lib/heimdal/libhx509.so* \
		${IDIR_LIBHEIMDAL}/usr/lib/heimdal
endif
	${CP} ${WRKINST}/usr/lib/heimdal/libheimsqlite.so* \
		${IDIR_LIBHEIMDAL}/usr/lib/heimdal
	${CP} ${WRKINST}/usr/lib/heimdal/libheimbase.so* \
		${IDIR_LIBHEIMDAL}/usr/lib/heimdal
	${CP} ${WRKINST}/usr/lib/heimdal/libheimntlm.so* \
		${IDIR_LIBHEIMDAL}/usr/lib/heimdal
	${CP} ${WRKINST}/usr/lib/heimdal/libwind.so* \
		${IDIR_LIBHEIMDAL}/usr/lib/heimdal
	${CP} ${WRKINST}/usr/lib/heimdal/libgssapi.so* \
		${IDIR_LIBHEIMDAL}/usr/lib/heimdal
	${CP} ${WRKINST}/usr/lib/heimdal/libkafs.so* \
		${IDIR_LIBHEIMDAL}/usr/lib/heimdal
	${CP} ${WRKINST}/usr/lib/heimdal/libkrb5.so* \
		${IDIR_LIBHEIMDAL}/usr/lib/heimdal
	${CP} ${WRKINST}/usr/lib/heimdal/libasn1.so* \
		${IDIR_LIBHEIMDAL}/usr/lib/heimdal
	${CP} ${WRKINST}/usr/lib/heimdal/libroken.so* \
		${IDIR_LIBHEIMDAL}/usr/lib/heimdal
	${INSTALL_DIR} ${IDIR_LIBHEIMDAL}/usr/lib/heimdal
	${CP} ${WRKINST}/usr/lib/heimdal/libsl.so* \
		${IDIR_LIBHEIMDAL}/usr/lib/heimdal
	${CP} ${WRKINST}/usr/lib/heimdal/libkadm5clnt.so* \
		${IDIR_LIBHEIMDAL}/usr/lib/heimdal

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
