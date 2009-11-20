# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		heimdal
PKG_VERSION:=		1.2.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		6e5028077e2a6b101a4a72801ba71b9e
PKG_DESCR:=		Kerberos 5 server
PKG_SECTION:=		net
PKG_DEPENDS:=		heimdal-libs heimdal-client-libs libncurses libcom_err
PKG_URL:=		http://www.h5l.org
PKG_SITES:=		http://www.h5l.org/dist/src/

PKG_DESCR_1:=		Kerberos 5 server libraries
PKG_SECTION_1:=		libs

PKG_DESCR_2:=		Kerberos 5 client libraries
PKG_SECTION_2:=		libs

include $(TOPDIR)/mk/package.mk

ifeq ($(ADK_COMPILE_HEIMDAL_WITH_DB_BDB),y)
PKG_DEPENDS+=		libdb
endif

ifeq ($(ADK_COMPILE_HEIMDAL_WITH_DB_LDAP),y)
PKG_DEPENDS+=		libopenldap
endif

$(eval $(call PKG_template,HEIMDAL_SERVER,heimdal-server,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,HEIMDAL_LIBS,heimdal-libs,$(PKG_VERSION)-${PKG_RELEASE},,${PKG_DESCR_1},${PKG_SECTION_1}))
$(eval $(call PKG_template,HEIMDAL_CLIENT_LIBS,heimdal-client-libs,$(PKG_VERSION)-${PKG_RELEASE},,${PKG_DESCR_2},${PKG_SECTION_2}))

CONFIGURE_OPTS:=	--with-hdbdir=/etc/heimdal \
			--disable-otp \
			--disable-ndbm-db \
			--libdir=/usr/lib/heimdal \
			--libexecdir=/usr/sbin \
			--sysconfdir=/etc/heimdal

ifeq ($(ADK_IPV6),y)
CONFIGURE_OPTS+=	--with-ipv6
else
CONFIGURE_OPTS+=	--without-ipv6
endif

ifeq ($(ADK_COMPILE_HEIMDAL_WITH_DB_BDB),y)
CONFIGURE_ARGS+=	--enable-berkeley-db
else
CONFIGURE_ARGS+=        --disable-berkeley-db
endif

ifeq ($(ADK_COMPILE_HEIMDAL_WITH_DB_LDAP),y)
CONFIGURE_ARGS+=	--with-openldap=yes
CONFIGURE_ARGS+=	--with-openldap-include=${STAGING_DIR}/usr
CONFIGURE_ARGS+=	--with-openldap-lib=${STAGING_DIR}/usr
else
CONFIGURE_ARGS+=        --without-openldap
endif

ifeq ($(ADK_COMPILE_HEIMDAL_WITH_PKINIT),y)
CONFIGURE_OPTS+=	--enable-pk-init
else
CONFIGURE_OPTS+=	--disable-pk-init
endif

TCFLAGS+=		-I${STAGING_DIR}/usr/include/et
TCFLAGS+=              -pthread
CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	${CONFIGURE_OPTS}
CONFIGURE_ENV+=		ac_cv_func_getaddrinfo_numserv=yes
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

pre-configure:
	(cd ${WRKBUILD}; rm -rf config.{cache,status} ; \
		CFLAGS="-static" \
		./configure ${CONFIGURE_OPTS} \
	);
	${MAKE} -C ${WRKBUILD}/lib/roken
	${MAKE} -C ${WRKBUILD}/lib/vers
	${MAKE} -C ${WRKBUILD}/lib/editline
	${MAKE} -C ${WRKBUILD}/lib/asn1 asn1_compile
	${MAKE} -C ${WRKBUILD}/lib/sl slc
	${INSTALL_BIN} ${WRKBUILD}/lib/asn1/asn1_compile \
		${STAGING_TOOLS}/bin
	${INSTALL_BIN} ${WRKBUILD}/lib/sl/slc \
		${STAGING_TOOLS}/bin
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
	${CP} ${WRKINST}/usr/lib/heimdal/libkdc.so* ${IDIR_HEIMDAL_SERVER}/usr/lib/heimdal
	${CP} ${WRKINST}/usr/lib/heimdal/libkadm5srv.so* ${IDIR_HEIMDAL_SERVER}/usr/lib/heimdal
	${CP} ${WRKINST}/usr/lib/heimdal/libhdb.so* ${IDIR_HEIMDAL_SERVER}/usr/lib/heimdal
	${INSTALL_DATA} ./files/krb5.conf ${IDIR_HEIMDAL_SERVER}/etc/heimdal
	${INSTALL_DATA} ./files/kdc.conf ${IDIR_HEIMDAL_SERVER}/etc/heimdal
	${INSTALL_DATA} ./files/kadmind.acl ${IDIR_HEIMDAL_SERVER}/etc/heimdal
	${INSTALL_BIN} ${WRKINST}/usr/sbin/kdc ${IDIR_HEIMDAL_SERVER}/usr/sbin/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/kadmind ${IDIR_HEIMDAL_SERVER}/usr/sbin/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/kpasswdd ${IDIR_HEIMDAL_SERVER}/usr/sbin/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/kstash ${IDIR_HEIMDAL_SERVER}/usr/sbin/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/ktutil ${IDIR_HEIMDAL_SERVER}/usr/sbin/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/kadmin ${IDIR_HEIMDAL_SERVER}/usr/sbin/
	# heimdal libs
	${INSTALL_DIR} ${IDIR_HEIMDAL_LIBS}/usr/lib/heimdal
ifeq ($(ADK_COMPILE_HEIMDAL_WITH_PKINIT),y)
	${CP} ${WRKINST}/usr/lib/heimdal/libhx509.so* ${IDIR_HEIMDAL_LIBS}/usr/lib/heimdal
endif
	${CP} ${WRKINST}/usr/lib/heimdal/libheimntlm.so* ${IDIR_HEIMDAL_LIBS}/usr/lib/heimdal
	${CP} ${WRKINST}/usr/lib/heimdal/libwind.so* ${IDIR_HEIMDAL_LIBS}/usr/lib/heimdal
	${CP} ${WRKINST}/usr/lib/heimdal/libgssapi.so* ${IDIR_HEIMDAL_LIBS}/usr/lib/heimdal
	${CP} ${WRKINST}/usr/lib/heimdal/libkafs.so* ${IDIR_HEIMDAL_LIBS}/usr/lib/heimdal
	${CP} ${WRKINST}/usr/lib/heimdal/libkrb5.so* ${IDIR_HEIMDAL_LIBS}/usr/lib/heimdal
	${CP} ${WRKINST}/usr/lib/heimdal/libasn1.so* ${IDIR_HEIMDAL_LIBS}/usr/lib/heimdal
	${CP} ${WRKINST}/usr/lib/heimdal/libroken.so* ${IDIR_HEIMDAL_LIBS}/usr/lib/heimdal
	# heimdal client libs
	${INSTALL_DIR} ${IDIR_HEIMDAL_CLIENT_LIBS}/usr/lib/heimdal
	${CP} ${WRKINST}/usr/lib/heimdal/libeditline.so* ${IDIR_HEIMDAL_CLIENT_LIBS}/usr/lib/heimdal
	${CP} ${WRKINST}/usr/lib/heimdal/libsl.so* ${IDIR_HEIMDAL_CLIENT_LIBS}/usr/lib/heimdal
	${CP} ${WRKINST}/usr/lib/heimdal/libkadm5clnt.so* ${IDIR_HEIMDAL_CLIENT_LIBS}/usr/lib/heimdal

include ${TOPDIR}/mk/pkg-bottom.mk
