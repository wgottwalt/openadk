# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		heimdal
PKG_VERSION:=		1.2.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		6e5028077e2a6b101a4a72801ba71b9e
MASTER_SITES:=		http://www.h5l.org/dist/src/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,HEIMDAL_SERVER,heimdal-server,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,HEIMDAL_LIBS,heimdal-libs,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,HEIMDAL_CLIENT_LIBS,heimdal-client-libs,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))

PKG_DEPENDS:=		heimdal-libs, heimdal-client-libs, libncurses, 

CONFIGURE_OPTS:=	--with-hdbdir=/etc/heimdal \
			--disable-otp \
			--disable-ndbm-db \
			--libexecdir=/usr/sbin \
			--sysconfdir=/etc/heimdal

ifeq ($(ADK_IPV6),y)
CONFIGURE_OPTS+=	--with-ipv6
else
CONFIGURE_OPTS+=	--without-ipv6
endif

ifeq ($(ADK_COMPILE_HEIMDAL_WITH_DB_BDB),y)
CONFIGURE_ARGS+=	--enable-berkeley-db
PKG_DEPENDS+=		libdb
else
CONFIGURE_ARGS+=        --disable-berkeley-db
endif

ifeq ($(ADK_COMPILE_HEIMDAL_WITH_DB_LDAP),y)
CONFIGURE_ARGS+=	--with-openldap=yes
CONFIGURE_ARGS+=	--with-openldap-include=${STAGING_DIR}/usr
CONFIGURE_ARGS+=	--with-openldap-lib=${STAGING_DIR}/usr
PKG_DEPENDS+=		libopenldap
else
CONFIGURE_ARGS+=        --without-openldap
endif

ifeq ($(ADK_COMPILE_HEIMDAL_WITH_PKINIT),y)
CONFIGURE_OPTS+=	--enable-pk-init
else
CONFIGURE_OPTS+=	--disable-pk-init
endif

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	${CONFIGURE_OPTS}
CONFIGURE_ENV+=		ac_cv_func_getaddrinfo_numserv=yes
BUILD_STYLE=		auto
INSTALL_STYLE=		auto confprog

pre-configure:
	(cd ${WRKBUILD}; rm -rf config.{cache,status} ; \
		CFLAGS="-static" \
		./configure ${CONFIGURE_OPTS} \
	);
	${MAKE} -C ${WRKBUILD}/lib/roken
	${MAKE} -C ${WRKBUILD}/lib/vers
	${MAKE} -C ${WRKBUILD}/lib/editline
	${MAKE} -C ${WRKBUILD}/lib/com_err compile_et
	${MAKE} -C ${WRKBUILD}/lib/asn1 asn1_compile
	${MAKE} -C ${WRKBUILD}/lib/sl slc
	${INSTALL_BIN} ${WRKBUILD}/lib/com_err/compile_et \
		${STAGING_TOOLS}/bin
	${INSTALL_BIN} ${WRKBUILD}/lib/asn1/asn1_compile \
		${STAGING_TOOLS}/bin
	${INSTALL_BIN} ${WRKBUILD}/lib/sl/slc \
		${STAGING_TOOLS}/bin
	${MAKE} -C ${WRKBUILD}/lib/com_err clean
	${MAKE} -C ${WRKBUILD} clean

post-install:
ifeq (${ADK_COMPILE_HEIMDAL_WITH_DB_LDAP},y)
	${INSTALL_DIR} ${IDIR_HEIMDAL_SERVER}/etc/openldap/schema
	${INSTALL_DATA} ${WRKBUILD}/lib/hdb/hdb.schema \
		${IDIR_HEIMDAL_SERVER}/etc/openldap/schema
endif
	${INSTALL_DIR} ${IDIR_HEIMDAL_SERVER}/etc/init.d
	${INSTALL_DIR} ${IDIR_HEIMDAL_SERVER}/etc/heimdal
	${INSTALL_DIR} ${IDIR_HEIMDAL_SERVER}/usr/sbin
	${INSTALL_DIR} ${IDIR_HEIMDAL_SERVER}/usr/lib
	${CP} ${WRKINST}/usr/lib/libkdc.so* ${IDIR_HEIMDAL_SERVER}/usr/lib
	${CP} ${WRKINST}/usr/lib/libkadm5srv.so* ${IDIR_HEIMDAL_SERVER}/usr/lib
	${CP} ${WRKINST}/usr/lib/libhdb.so* ${IDIR_HEIMDAL_SERVER}/usr/lib
	${INSTALL_DATA} ./files/krb5.conf ${IDIR_HEIMDAL_SERVER}/etc/heimdal
	${INSTALL_DATA} ./files/heimdal.init \
		${IDIR_HEIMDAL_SERVER}/etc/init.d/heimdal
	${INSTALL_DATA} ./files/kdc.conf ${IDIR_HEIMDAL_SERVER}/etc/heimdal
	${INSTALL_DATA} ./files/kadmind.acl ${IDIR_HEIMDAL_SERVER}/etc/heimdal
	${INSTALL_BIN} ${WRKINST}/usr/sbin/kdc ${IDIR_HEIMDAL_SERVER}/usr/sbin/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/kadmind ${IDIR_HEIMDAL_SERVER}/usr/sbin/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/kpasswdd ${IDIR_HEIMDAL_SERVER}/usr/sbin/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/kstash ${IDIR_HEIMDAL_SERVER}/usr/sbin/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/ktutil ${IDIR_HEIMDAL_SERVER}/usr/sbin/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/kadmin ${IDIR_HEIMDAL_SERVER}/usr/sbin/
	# heimdal libs
	${INSTALL_DIR} ${IDIR_HEIMDAL_LIBS}/usr/lib
ifeq ($(ADK_COMPILE_HEIMDAL_WITH_PKINIT),y)
	${CP} ${WRKINST}/usr/lib/libhx509.so* ${IDIR_HEIMDAL_LIBS}/usr/lib
endif
	${CP} ${WRKINST}/usr/lib/libheimntlm.so* ${IDIR_HEIMDAL_LIBS}/usr/lib
	${CP} ${WRKINST}/usr/lib/libwind.so* ${IDIR_HEIMDAL_LIBS}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgssapi.so* ${IDIR_HEIMDAL_LIBS}/usr/lib
	${CP} ${WRKINST}/usr/lib/libkafs.so* ${IDIR_HEIMDAL_LIBS}/usr/lib
	${CP} ${WRKINST}/usr/lib/libkrb5.so* ${IDIR_HEIMDAL_LIBS}/usr/lib
	${CP} ${WRKINST}/usr/lib/libcom_err.so* ${IDIR_HEIMDAL_LIBS}/usr/lib
	${CP} ${WRKINST}/usr/lib/libasn1.so* ${IDIR_HEIMDAL_LIBS}/usr/lib
	${CP} ${WRKINST}/usr/lib/libroken.so* ${IDIR_HEIMDAL_LIBS}/usr/lib
	# heimdal client libs
	${INSTALL_DIR} ${IDIR_HEIMDAL_CLIENT_LIBS}/usr/lib
	${CP} ${WRKINST}/usr/lib/libeditline.so* ${IDIR_HEIMDAL_CLIENT_LIBS}/usr/lib
	${CP} ${WRKINST}/usr/lib/libsl.so* ${IDIR_HEIMDAL_CLIENT_LIBS}/usr/lib
	${CP} ${WRKINST}/usr/lib/libkadm5clnt.so* ${IDIR_HEIMDAL_CLIENT_LIBS}/usr/lib
	echo 'Depends: ${PKG_DEPENDS}' >> ${IDIR_HEIMDAL_SERVER}/CONTROL/control

include ${TOPDIR}/mk/pkg-bottom.mk
