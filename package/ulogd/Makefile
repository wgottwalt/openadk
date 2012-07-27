# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ulogd
PKG_VERSION:=		2.0.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		211e68781e3860959606fc94b97cf22e
PKG_DESCR:=		Netfilter userspace logging daemon
PKG_SECTION:=		firewall
PKG_DEPENDS:=		iptables libnetfilter-conntrack libnetfilter-log libnetfilter-acct libmnl
PKG_BUILDDEP:=		iptables libnetfilter_conntrack libnetfilter_log libnetfilter_acct libmnl
PKG_URL:=		http://www.netfilter.org/projects/ulogd/
PKG_SITES:=		http://www.netfilter.org/projects/ulogd/files/
PKG_MULTI:=		1
PKG_NOPARALLEL:=	1

PKG_SUBPKGS:=		ULOGD ULOGD_MOD_MYSQL ULOGD_MOD_PCAP ULOGD_MOD_PGSQL ULOGD_MOD_SQLITE ULOGD_MOD_EXTRA
PKGSB_ULOGD_MOD_MYSQL:=		mysql
PKGSB_ULOGD_MOD_PGSQL:=		postgresql
PKGSB_ULOGD_MOD_SQLITE:=	sqlite
PKGSB_ULOGD_MOD_PCAP:=		libpcap

PKG_HOST_DEPENDS:=	!cygwin

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,ULOGD,ulogd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,ULOGD_MOD_MYSQL,ulogd-mod-mysql,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,ULOGD_MOD_PCAP,ulogd-mod-pcap,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,ULOGD_MOD_PGSQL,ulogd-mod-pgsql,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,ULOGD_MOD_SQLITE,ulogd-mod-sqlite,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,ULOGD_MOD_EXTRA,ulogd-mod-extra,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CFLAGS+=		-fPIC

ifneq (${ADK_PACKAGE_ULOGD_MOD_MYSQL},)
CONFIGURE_ARGS+=	--with-mysql=${STAGING_TARGET_DIR}/usr
endif

ifneq (${ADK_PACKAGE_ULOGD_MOD_PGSQL},)
CONFIGURE_ARGS+=	--with-pgsql=${STAGING_TARGET_DIR}/usr
endif

post-install:
	${INSTALL_DIR} ${IDIR_ULOGD}/usr/sbin ${IDIR_ULOGD}/usr/lib/ulogd/
	${INSTALL_BIN} ${WRKINST}/usr/lib/ulogd/ulogd_raw2packet_BASE.so \
		${IDIR_ULOGD}/usr/lib/ulogd/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/ulogd ${IDIR_ULOGD}/usr/sbin/

ulogd-mod-extra-install:
	${INSTALL_DIR} ${IDIR_ULOGD_MOD_EXTRA}/usr/lib/ulogd
	${CP} ${WRKINST}/usr/lib/ulogd/ulogd_output_{LOGEMU,OPRINT,SYSLOG}.so \
		${IDIR_ULOGD_MOD_EXTRA}/usr/lib/ulogd

ulogd-mod-pcap-install:
	${INSTALL_DIR} ${IDIR_ULOGD_MOD_PCAP}/usr/lib/ulogd
	${CP} ${WRKINST}/usr/lib/ulogd/ulogd_output_PCAP.so \
		${IDIR_ULOGD_MOD_PCAP}/usr/lib/ulogd

ulogd-mod-sqlite-install:
	${INSTALL_DIR} ${IDIR_ULOGD_MOD_SQLITE}/usr/lib/ulogd
	${CP} ${WRKINST}/usr/lib/ulogd/ulogd_output_SQLITE3.so \
		${IDIR_ULOGD_MOD_SQLITE}/usr/lib/ulogd

ulogd-mod-pgsql-install:
	${INSTALL_DIR} ${IDIR_ULOGD_MOD_PGSQL}/usr/lib/ulogd
	${CP} ${WRKINST}/usr/lib/ulogd/ulogd_output_PGSQL.so \
		${IDIR_ULOGD_MOD_PGSQL}/usr/lib/ulogd

ulogd-mod-mysql-install:
	${INSTALL_DIR} ${IDIR_ULOGD_MOD_MYSQL}/usr/lib/ulogd
	${CP} ${WRKINST}/usr/lib/ulogd/ulogd_output_MYSQL.so \
		${IDIR_ULOGD_MOD_MYSQL}/usr/lib/ulogd

include ${TOPDIR}/mk/pkg-bottom.mk
