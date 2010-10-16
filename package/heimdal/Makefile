# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		heimdal
PKG_VERSION:=		1.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		31d08bbf47a77827fe97ef3f52b4c9c4
PKG_DESCR:=		Kerberos 5 server
PKG_SECTION:=		crypto
PKG_DEPENDS:=		libheimdal libheimdal-client libncurses libcom-err
PKG_BUILDDEP:=		openssl ncurses e2fsprogs
PKG_URL:=		http://www.h5l.org/
PKG_SITES:=		http://www.h5l.org/dist/src/
PKG_NOPARALLEL:=	1

PKG_HOST_DEPENDS:=	!darwin

PKG_SUBPKGS:=		HEIMDAL LIBHEIMDAL LIBHEIMDAL_CLIENT
PKGSD_LIBHEIMDAL:=	Kerberos 5 server libraries
PKGSC_LIBHEIMDAL:=	libs
PKGSD_LIBHEIMDAL_CLIENT:=	Kerberos 5 client libraries
PKGSC_LIBHEIMDAL_CLIENT:=	libs

PKG_FLAVOURS:=		PKINIT
PKGFD_PKINIT:=		Enable PK-INIT

PKG_CHOICES:=		WITH_LDAP WITH_BDB
PKGCD_WITH_LDAP:=	use OpenLDAP as database backend
PKGCS_WITH_LDAP:=	libopenldap
PKGCB_WITH_LDAP:=	openldap
PKGCD_WITH_BDB:=	use Berkeley DB as database backend
PKGCS_WITH_BDB:=	libdb
PKGCB_WITH_BDB:=	libdb

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,HEIMDAL_SERVER,heimdal-server,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBHEIMDAL,libheimdal,$(PKG_VERSION)-${PKG_RELEASE},,${PKGSD_LIBHEIMDAL},${PKGSC_LIBHEIMDAL}))
$(eval $(call PKG_template,LIBHEIMDAL_CLIENT,libheimdal-client,$(PKG_VERSION)-${PKG_RELEASE},,${PKGSD_LIBHEIMDAL_CLIENT},${PKGSC_LIBHEIMDAL_CLIENT}))

CONFIGURE_OPTS:=	--with-hdbdir=/etc/heimdal \
			--disable-otp \
			--disable-ndbm-db \
			--libdir=/usr/lib/heimdal \
			--libexecdir=/usr/sbin \
			--with-ipv6 \
			--sysconfdir=/etc/heimdal

ifeq ($(ADK_COMPILE_HEIMDAL_WITH_BDB),y)
CONFIGURE_ARGS+=	--enable-berkeley-db
else
CONFIGURE_ARGS+=        --disable-berkeley-db
endif

ifeq ($(ADK_COMPILE_HEIMDAL_WITH_LDAP),y)
CONFIGURE_ARGS+=	--with-openldap=yes
CONFIGURE_ARGS+=	--with-openldap-include=${STAGING_DIR}/usr
CONFIGURE_ARGS+=	--with-openldap-lib=${STAGING_DIR}/usr
else
CONFIGURE_ARGS+=        --without-openldap
endif

ifeq ($(ADK_PACKAGE_HEIMDAL_PKINIT),y)
CONFIGURE_OPTS+=	--enable-pk-init
else
CONFIGURE_OPTS+=	--disable-pk-init
endif

TCFLAGS+=		-I${STAGING_DIR}/usr/include/et -pthread

CONFIGURE_ARGS+=	${CONFIGURE_OPTS}
CONFIGURE_ENV+=		ac_cv_func_getaddrinfo_numserv=yes

ifeq ($(ADK_HOST_CYGWIN),y)
EXEEXT:=		.exe
endif

pre-configure:
	(cd ${WRKBUILD}; rm -rf config.{cache,status} ; \
		./configure ${CONFIGURE_OPTS} \
	);
	${MAKE} -C ${WRKBUILD}/lib/roken
	${MAKE} -C ${WRKBUILD}/lib/vers
	${MAKE} -C ${WRKBUILD}/lib/editline
	${MAKE} -C ${WRKBUILD}/lib/asn1 asn1_compile$(EXEEXT)
	${MAKE} -C ${WRKBUILD}/lib/sl slc$(EXEEXT)
	${INSTALL_BIN} ${WRKBUILD}/lib/asn1/asn1_compile$(EXEEXT) \
		${STAGING_TOOLS}/bin
	${INSTALL_BIN} ${WRKBUILD}/lib/sl/slc$(EXEEXT) \
		${STAGING_TOOLS}/bin
	${MAKE} -C ${WRKBUILD}/lib/asn1 clean
	${MAKE} -C ${WRKBUILD}/lib/roken clean
	${MAKE} -C ${WRKBUILD} clean

post-install:
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
	# heimdal libs
	${INSTALL_DIR} ${IDIR_LIBHEIMDAL}/usr/lib/heimdal
ifeq ($(ADK_COMPILE_HEIMDAL_WITH_PKINIT),y)
	${CP} ${WRKINST}/usr/lib/heimdal/libhx509.so* \
		${IDIR_LIBHEIMDAL}/usr/lib/heimdal
endif
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
	# heimdal client libs
	${INSTALL_DIR} ${IDIR_LIBHEIMDAL_CLIENT}/usr/lib/heimdal
	${CP} ${WRKINST}/usr/lib/heimdal/libeditline.so* \
		${IDIR_LIBHEIMDAL_CLIENT}/usr/lib/heimdal
	${CP} ${WRKINST}/usr/lib/heimdal/libsl.so* \
		${IDIR_LIBHEIMDAL_CLIENT}/usr/lib/heimdal
	${CP} ${WRKINST}/usr/lib/heimdal/libkadm5clnt.so* \
		${IDIR_LIBHEIMDAL_CLIENT}/usr/lib/heimdal

include ${TOPDIR}/mk/pkg-bottom.mk
