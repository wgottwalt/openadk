# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ulogd
PKG_VERSION:=		1.24
PKG_RELEASE:=		7
PKG_MD5SUM:=		05b4ed2926b9a22aaeaf642917bbf8ff
PKG_DESCR:=		Netfilter userspace logging daemon
PKG_SECTION:=		net
PKG_DEPENDS:=		iptables
PKG_URL:=		http://www.netfilter.org/projects/ulogd
PKG_SITES:=		ftp://ftp.netfilter.org/pub/ulogd/ \
			ftp://ftp.be.netfilter.org/pub/netfilter/ulogd/ \
			ftp://ftp.de.netfilter.org/pub/netfilter/ulogd/ \
			ftp://ftp.no.netfilter.org/pub/netfilter/ulogd/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,ULOGD,ulogd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,ULOGD_MOD_MYSQL,ulogd-mod-mysql,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,ULOGD_MOD_PCAP,ulogd-mod-pcap,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,ULOGD_MOD_PGSQL,ulogd-mod-pgsql,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,ULOGD_MOD_SQLITE,ulogd-mod-sqlite,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,ULOGD_MOD_EXTRA,ulogd-mod-extra,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

SUB_INSTALLS-y:=
SUB_INSTALLS-m:=
SUB_INSTALLS-${ADK_PACKAGE_ULOGD_MOD_PCAP}+=		ulogd-mod-pcap-install
SUB_INSTALLS-${ADK_PACKAGE_ULOGD_MOD_MYSQL}+=		ulogd-mod-mysql-install
SUB_INSTALLS-${ADK_PACKAGE_ULOGD_MOD_PGSQL}+=		ulogd-mod-pgsql-install
SUB_INSTALLS-${ADK_PACKAGE_ULOGD_MOD_SQLITE}+=		ulogd-mod-sqlite-install
SUB_INSTALLS-${ADK_PACKAGE_ULOGD_MOD_EXTRA}+=		ulogd-mod-extra-install

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

ifneq (${ADK_PACKAGE_ULOGD_MOD_PCAP},)
CONFIGURE_ENV+=		ac_cv_header_pcap_h=yes
else
CONFIGURE_ENV+=		ac_cv_header_pcap_h=no
endif

ifneq (${ADK_PACKAGE_ULOGD_MOD_MYSQL},)
CONFIGURE_ARGS+=	--with-mysql=${STAGING_DIR}/usr
endif

ifneq (${ADK_PACKAGE_ULOGD_MOD_PGSQL},)
CONFIGURE_ARGS+=	--with-pgsql=${STAGING_DIR}/usr
endif

ifneq (${ADK_PACKAGE_ULOGD_MOD_SQLITE},)
CONFIGURE_ARGS+=	--with-sqlite3=${STAGING_DIR}/usr
endif

post-install: ${SUB_INSTALLS-m} ${SUB_INSTALLS-y}
	${INSTALL_DIR} ${IDIR_ULOGD}/usr/sbin ${IDIR_ULOGD}/usr/lib/ulogd/
	${INSTALL_DIR} ${IDIR_ULOGD}/etc
	${INSTALL_DATA} ${WRKINST}/etc/ulogd.conf ${IDIR_ULOGD}/etc/
	${INSTALL_BIN} ${WRKINST}/usr/lib/ulogd/ulogd_BASE.so ${IDIR_ULOGD}/usr/lib/ulogd/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/ulogd ${IDIR_ULOGD}/usr/sbin/

ulogd-mod-extra-install:
	${INSTALL_DIR} ${IDIR_ULOGD_MOD_EXTRA}/usr/lib/ulogd
	${CP} ${WRKINST}/usr/lib/ulogd/ulogd_{LOCAL,LOGEMU,OPRINT,PWSNIFF,SYSLOG}.so \
		${IDIR_ULOGD_MOD_EXTRA}/usr/lib/ulogd

ulogd-mod-pcap-install:
	${INSTALL_DIR} ${IDIR_ULOGD_MOD_PCAP}/usr/lib/ulogd
	${CP} ${WRKINST}/usr/lib/ulogd/ulogd_PCAP.so \
		${IDIR_ULOGD_MOD_PCAP}/usr/lib/ulogd

ulogd-mod-sqlite-install:
	${INSTALL_DIR} ${IDIR_ULOGD_MOD_SQLITE}/usr/lib/ulogd
	${CP} ${WRKINST}/usr/lib/ulogd/ulogd_SQLITE3.so \
		${IDIR_ULOGD_MOD_SQLITE}/usr/lib/ulogd

ulogd-mod-pgsql-install:
	${INSTALL_DIR} ${IDIR_ULOGD_MOD_PGSQL}/usr/lib/ulogd
	${CP} ${WRKINST}/usr/lib/ulogd/ulogd_PGSQL.so \
		${IDIR_ULOGD_MOD_PGSQL}/usr/lib/ulogd

ulogd-mod-mysql-install:
	${INSTALL_DIR} ${IDIR_ULOGD_MOD_MYSQL}/usr/lib/ulogd
	${CP} ${WRKINST}/usr/lib/ulogd/ulogd_MYSQL.so \
		${IDIR_ULOGD_MOD_MYSQL}/usr/lib/ulogd

include ${TOPDIR}/mk/pkg-bottom.mk
