# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		knock
PKG_VERSION:=		0.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		cb6373fd4ccb42eeca3ff406b7fdb8a7
PKG_DESCR:=		port-knocking client
PKG_SECTION:=		net/firewall
PKG_BUILDDEP:=		libpcap
PKG_URL:=		http://www.zeroflux.org/projects/knock
PKG_SITES:=		http://www.zeroflux.org/proj/knock/files/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_SUBPKGS:=		KNOCK KNOCKD
PKGSD_KNOCKD:=		port-knocking server
PKGSS_KNOCKD:=		libpcap

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,KNOCK,knock,${PKG_VERSION}-${PKG_RELEASE},,${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,KNOCKD,knockd,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_KNOCKD},${PKGSD_KNOCKD},${PKG_SECTION}))

TARGET_CPPFLAGS+=	-D_GNU_SOURCE
CONFIGURE_ENV+=		ac_cv_lib_pcap_pcap_open_live=yes

knock-install:
	${INSTALL_DIR} ${IDIR_KNOCK}/usr/bin
	${CP} ${WRKINST}/usr/bin/knock ${IDIR_KNOCK}/usr/bin/

knockd-install:
	${INSTALL_DIR} ${IDIR_KNOCKD}/etc
	install -m0600 ${WRKINST}/etc/knockd.conf ${IDIR_KNOCKD}/etc/
	${INSTALL_DIR} ${IDIR_KNOCKD}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/knockd ${IDIR_KNOCKD}/usr/sbin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
