# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		bind
PKG_VERSION:=		9.4.1
PKG_RELEASE:=		4
PKG_MD5SUM:=		09b54d35036cb0423b2e618f21766285
PKG_DESCR:=		popular DNS server
PKG_SECTION:=		net
PKG_DEPENDS:=		libopenssl libbind
PKG_URL:=		https://www.isc.org/software/bind
PKG_SITES:=		ftp://ftp.isc.org/isc/bind9/${PKG_VERSION}/

PKG_DESCR_1:=		dynamic dns client (nsupdate utility)
PKG_DESCR_2:=		Support library for the bind tools and dns server/client
PKG_DESCR_3:=		rndc & rndc-confgen utilities
PKG_DESCR_4:=		named-checkconf & named-checkzone utilities
PKG_DESCR_5:=		dnssec-keygen & dnssec-signzone utilities
PKG_DESCR_6:=		host utility
PKG_DESCR_7:=		dig utility

PKG_SECTION_2:=		libs

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,BIND_SERVER,bind-server,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,BIND_CLIENT,bind-client,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR_1},${PKG_SECTION}))
$(eval $(call PKG_template,LIBBIND,libbind,${PKG_VERSION}-${PKG_RELEASE},,${PKG_DESCR_2},${PKG_SECTION_2}))
$(eval $(call PKG_template,BIND_RNDC,bind-rndc,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR_3},${PKG_SECTION}))
$(eval $(call PKG_template,BIND_CHECK,bind-check,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR_4},${PKG_SECTION}))
$(eval $(call PKG_template,BIND_DNSSEC,bind-dnssec,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR_5},${PKG_SECTION}))
$(eval $(call PKG_template,BIND_HOST,bind-host,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR_6},${PKG_SECTION}))
$(eval $(call PKG_template,BIND_DIG,bind-dig,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR_7},${PKG_SECTION}))

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
	${INSTALL_BIN} ${WRKINST}/usr/sbin/named ${IDIR_BIND_SERVER}/usr/sbin/
	${CP} ./files/bind ${IDIR_BIND_SERVER}/etc
	find ${IDIR_BIND_SERVER}/etc/bind -name ".svn" | xargs rm -rf
	# nsupdate
	${INSTALL_DIR} ${IDIR_BIND_CLIENT}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/nsupdate ${IDIR_BIND_CLIENT}/usr/bin/
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
	${INSTALL_BIN} ${WRKINST}/usr/lib/libbind9.so.* ${IDIR_LIBBIND}/usr/lib/
	${INSTALL_BIN} ${WRKINST}/usr/lib/libdns.so.* ${IDIR_LIBBIND}/usr/lib/
	${INSTALL_BIN} ${WRKINST}/usr/lib/libisccc.so.* ${IDIR_LIBBIND}/usr/lib/
	${INSTALL_BIN} ${WRKINST}/usr/lib/libisccfg.so.* ${IDIR_LIBBIND}/usr/lib/
	${INSTALL_BIN} ${WRKINST}/usr/lib/libisc.so.* ${IDIR_LIBBIND}/usr/lib/
	${INSTALL_BIN} ${WRKINST}/usr/lib/liblwres.so.* ${IDIR_LIBBIND}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
