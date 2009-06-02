# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		net-snmp
PKG_VERSION:=		5.4.2.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		984932520143f0c8bf7b7ce1fc9e1da1
PKG_DESCR:=		SNMP Agent
PKG_SECTION:=		net
PKG_DEPENDS:=		libnetsnmp libelf
PKG_URL:=		http://www.net-snmp.org
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=net-snmp/}

PKG_DESCR_1:=		SNMP utilities
PKG_DEPENDS_1:=		libnetsnmp libelf

PKG_DESCR_2:=		SNMP library
PKG_DEPENDS_2:=		libelf
PKG_SECTION_2:=		libs

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SNMPD,snmpd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,SNMP_UTILS,snmp-utils,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS_1},${PKG_DESCR_1},${PKG_SECTION}))
$(eval $(call PKG_template,LIBNETSNMP,libnetsnmp,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS_2},${PKG_DESCR_2},${PKG_SECTION_2}))


SNMP_MIB_MODULES_INCLUDED =	\
	host/hr_device \
	host/hr_disk \
	host/hr_filesys \
	host/hr_network \
	host/hr_partition \
	host/hr_proc \
	host/hr_storage \
	host/hr_system \
	mibII/at \
	mibII/icmp \
	mibII/ip \
	mibII/snmp_mib \
	mibII/sysORTable \
	mibII/system_mib \
	mibII/tcp \
	mibII/udp \
	mibII/vacm_context \
	mibII/vacm_vars \
	snmpv3/snmpEngine \
	snmpv3/snmpMPDStats \
	snmpv3/usmStats \
	snmpv3/usmUser \
	snmpv3mibs \
	tunnel \
	ucd-snmp/disk \
	ucd-snmp/dlmod \
	ucd-snmp/extensible \
	ucd-snmp/loadave \
	ucd-snmp/memory \
	ucd-snmp/pass \
	ucd-snmp/proc \
	ucd-snmp/vmstat \
	util_funcs \
	utilities/execute \

SNMP_MIB_MODULES_EXCLUDED =	\
	mibII/interfaces \
	if-mib \
	agent_mibs \
	agentx \
	host \
	ieee802dot11 \
	mibII \
	notification \
	notification-log-mib \
	notification/snmpNotifyTable \
	target \
	ucd_snmp \
	utilities \

SNMP_TRANSPORTS_INCLUDED=	Callback UDP

SNMP_TRANSPORTS_EXCLUDED=	TCP TCPv6 UDPv6 Unix

CONFIGURE_STYLE:=	gnu
CONFIGURE_ENV+=		ac_cv_header_pcap_h=no
CONFIGURE_ARGS+=	--with-endianness=little \
			--with-logfile=/var/log/snmpd.log \
			--with-persistent-directory=/usr/lib/snmp/ \
			--with-default-snmp-version=3 \
			--with-sys-contact=root@localhost \
			--with-sys-location=Unknown \
			--enable-applications \
			--disable-debugging \
			--disable-manuals \
			--disable-mib-loading \
			--disable-mibs \
			--disable-scripts \
			--with-out-mib-modules="${SNMP_MIB_MODULES_EXCLUDED}" \
			--with-mib-modules="${SNMP_MIB_MODULES_INCLUDED}" \
			--with-out-transports="${SNMP_TRANSPORTS_EXCLUDED}" \
			--with-transports="${SNMP_TRANSPORTS_INCLUDED}" \
			--without-opaque-special-types \
			--without-openssl \
			--without-libwrap \
			--without-rpm \
			--without-zlib
ifneq ($(ADK_IPV6),y)
CONFIGURE_ARGS+=	--disable-ipv6
endif
BUILD_STYLE:=		auto
INSTALL_STYLE:=		confprog auto
FAKE_FLAGS+=		INSTALL_PREFIX="${WRKINST}"

post-install:
	${INSTALL_DIR} ${IDIR_LIBNETSNMP}/usr/lib
	${CP} ${WRKINST}/usr/lib/libnetsnmp.so* ${IDIR_LIBNETSNMP}/usr/lib/
	${INSTALL_DIR} ${IDIR_SNMPD}/etc/snmp
	${INSTALL_DIR} ${IDIR_SNMPD}/etc/init.d
	${INSTALL_DIR} ${IDIR_SNMPD}/usr/sbin
	${INSTALL_DATA} ./files/snmpd.conf ${IDIR_SNMPD}/etc/snmp/snmpd.conf
	${INSTALL_BIN} ./files/snmpd.init ${IDIR_SNMPD}/etc/init.d/snmpd
	${INSTALL_BIN} ${WRKINST}/usr/sbin/snmpd ${IDIR_SNMPD}/usr/sbin/snmpd
	${INSTALL_DIR} ${IDIR_SNMP_UTILS}/usr/bin
	${CP} ${WRKINST}/usr/bin/snmp{get,set,status,test,trap,walk} ${IDIR_SNMP_UTILS}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
