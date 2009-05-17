# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		bind
PKG_VERSION:=		9.4.1
PKG_RELEASE:=		4
PKG_MD5SUM:=		09b54d35036cb0423b2e618f21766285
MASTER_SITES:=		ftp://ftp.isc.org/isc/bind9/${PKG_VERSION}/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,BIND_SERVER,bind-server,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))
$(eval $(call PKG_template,BIND_CLIENT,bind-client,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))
$(eval $(call PKG_template,LIBBIND,libbind,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))
$(eval $(call PKG_template,BIND_TOOLS,bind-tools,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))
$(eval $(call PKG_template,BIND_RNDC,bind-rndc,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))
$(eval $(call PKG_template,BIND_CHECK,bind-check,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))
$(eval $(call PKG_template,BIND_DNSSEC,bind-dnssec,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))
$(eval $(call PKG_template,BIND_HOST,bind-host,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))
$(eval $(call PKG_template,BIND_DIG,bind-dig,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ENV+=         BUILD_CC="${TARGET_CC}"
CONFIGURE_ARGS+=	--with-randomdev=/dev/urandom \
			--disable-threads \
			--with-openssl=${STAGING_DIR}/usr/ \
			--with-libtool
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

pre-build:
	${MAKE} -C ${WRKBUILD}/lib/dns \
		BUILD_CC="${HOSTCC}" \
		CC="${HOSTCC}" \
		CFLAGS='${HOSTCFLAGS}' \
		gen

post-install:
	# bind server
	${INSTALL_DIR} ${IDIR_BIND_SERVER}/usr/sbin
	${INSTALL_DIR} ${IDIR_BIND_SERVER}/etc/init.d
	${INSTALL_BIN} ${WRKINST}/usr/sbin/named ${IDIR_BIND_SERVER}/usr/sbin/
	${CP} ./files/bind ${IDIR_BIND_SERVER}/etc
	${INSTALL_BIN} ./files/named.init \
		${IDIR_BIND_SERVER}/etc/init.d/named
	find ${IDIR_BIND_SERVER}/etc/bind -name ".svn" | xargs rm -rf
	# nsupdate
	${INSTALL_DIR} ${IDIR_BIND_CLIENT}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/nsupdate ${IDIR_BIND_CLIENT}/usr/bin/
	# bind all tools
	${INSTALL_DIR} ${IDIR_BIND_TOOLS}/usr/bin
	${INSTALL_DIR} ${IDIR_BIND_TOOLS}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/bin/dig ${IDIR_BIND_TOOLS}/usr/bin/
	${INSTALL_BIN} ${WRKINST}/usr/bin/host ${IDIR_BIND_TOOLS}/usr/bin/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/dnssec-keygen ${IDIR_BIND_TOOLS}/usr/sbin/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/dnssec-signzone ${IDIR_BIND_TOOLS}/usr/sbin/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/named-checkconf ${IDIR_BIND_TOOLS}/usr/sbin/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/named-checkzone ${IDIR_BIND_TOOLS}/usr/sbin/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/rndc ${IDIR_BIND_TOOLS}/usr/sbin/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/rndc-confgen ${IDIR_BIND_TOOLS}/usr/sbin/
	# rndc
	${INSTALL_DIR} ${IDIR_BIND_RNDC}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/rndc ${IDIR_BIND_RNDC}/usr/sbin/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/rndc-confgen ${IDIR_BIND_RNDC}/usr/sbin/
	# bind check
	${INSTALL_DIR} ${IDIR_BIND_CHECK}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/named-checkconf ${IDIR_BIND_CHECK}/usr/sbin/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/named-checkzone ${IDIR_BIND_CHECK}/usr/sbin/
	# dnsec tools
	${INSTALL_DIR} ${IDIR_BIND_DNSSEC}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/dnssec-keygen ${IDIR_BIND_DNSSEC}/usr/sbin/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/dnssec-signzone ${IDIR_BIND_DNSSEC}/usr/sbin/
	# host
	${INSTALL_DIR} ${IDIR_BIND_HOST}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/host ${IDIR_BIND_HOST}/usr/bin/
	# dig
	${INSTALL_DIR} ${IDIR_BIND_DIG}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/dig ${IDIR_BIND_DIG}/usr/bin/
	# bind lib
	${INSTALL_DIR} ${IDIR_LIBBIND}/usr/lib
	${INSTALL_BIN} ${WRKINST}/usr/lib/libbind9.so.30 ${IDIR_LIBBIND}/usr/lib/
	${INSTALL_BIN} ${WRKINST}/usr/lib/libdns.so.32 ${IDIR_LIBBIND}/usr/lib/
	${INSTALL_BIN} ${WRKINST}/usr/lib/libisccc.so.30 ${IDIR_LIBBIND}/usr/lib/
	${INSTALL_BIN} ${WRKINST}/usr/lib/libisccfg.so.30 ${IDIR_LIBBIND}/usr/lib/
	${INSTALL_BIN} ${WRKINST}/usr/lib/libisc.so.32 ${IDIR_LIBBIND}/usr/lib/
	${INSTALL_BIN} ${WRKINST}/usr/lib/liblwres.so.30 ${IDIR_LIBBIND}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
