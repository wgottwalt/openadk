# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		net-snmp
PKG_VERSION:=		5.5
PKG_RELEASE:=		1
PKG_BUILDDEP+=		libelf
PKG_MD5SUM:=		5b2551e7bd024fbbee84dca22a5f13a1
PKG_DESCR:=		SNMP Agent
PKG_SECTION:=		net
PKG_DEPENDS:=		libnetsnmp libelf
PKG_NOPARALLEL:=	1
PKG_URL:=		http://www.net-snmp.org
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=net-snmp/}

PKG_DESCR_UTILS:=	SNMP utilities
PKG_DEPENDS_UTILS:=	libnetsnmp libelf

PKG_DESCR_LIBS:=	SNMP library
PKG_DEPENDS_LIBS:=	libelf
PKG_SECTION_LIBS:=	libs

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SNMPD,snmpd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,SNMP_UTILS,snmp-utils,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS_UTILS},${PKG_DESCR_UTILS},${PKG_SECTION}))
$(eval $(call PKG_template,LIBNETSNMP,libnetsnmp,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS_LIBS},${PKG_DESCR_LIBS},${PKG_SECTION_LIBS}))

SNMP_TRANSPORTS_INCLUDED=	UDP TCP Callback Unix
SNMP_TRANSPORTS_EXCLUDED=	TCPIPv6 UDPIPv6 Alias
TLDFLAGS+=		-pthread

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--with-logfile=/var/log/snmpd.log \
			--with-persistent-directory=/usr/lib/snmp/ \
			--with-default-snmp-version=3 \
			--with-sys-contact=root@localhost \
			--with-sys-location=Unknown \
			--enable-applications \
			--disable-embedded-perl \
			--without-perl-modules \
			--disable-debugging \
			--disable-manuals \
			--disable-mib-loading \
			--disable-mibs \
			--disable-scripts \
			--with-transports="${SNMP_TRANSPORTS_INCLUDED}" \
			--with-out-transports="${SNMP_TRANSPORTS_EXCLUDED}" \
			--with-opaque-special-types \
			--without-openssl \
			--without-libwrap \
			--without-rpm \
			--without-zlib

BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto
FAKE_FLAGS+=		INSTALL_PREFIX="${WRKINST}"

post-install:
	${INSTALL_DIR} ${IDIR_LIBNETSNMP}/usr/lib
	${CP} ${WRKINST}/usr/lib/libnetsnmp*.so* ${IDIR_LIBNETSNMP}/usr/lib/
	${INSTALL_DIR} ${IDIR_SNMPD}/etc/snmp
	${INSTALL_DIR} ${IDIR_SNMPD}/usr/sbin
	${INSTALL_DATA} ./files/snmpd.conf ${IDIR_SNMPD}/etc/snmp/snmpd.conf
	${INSTALL_BIN} ${WRKINST}/usr/sbin/snmpd ${IDIR_SNMPD}/usr/sbin/snmpd
	${INSTALL_DIR} ${IDIR_SNMP_UTILS}/usr/bin
	${CP} ${WRKINST}/usr/bin/snmp{get,set,status,test,trap,walk} \
		${IDIR_SNMP_UTILS}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
