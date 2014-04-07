# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		iptables
PKG_VERSION:=		1.4.21
PKG_RELEASE:=		2
PKG_MD5SUM:=		536d048c8e8eeebcd9757d0863ebb0c0
PKG_DESCR:=		netfilter firewalling software
PKG_SECTION:=		firewall
PKG_DEPENDS:=		kmod-ip-nf-iptables kmod-nf-conntrack
PKG_DEPENDS+=		kmod-nf-conntrack-ipv4 kmod-full-nat
PKG_DEPENDS+=		kmod-ip-nf-target-masquerade kmod-ip-nf-target-reject
PKG_DEPENDS+=		kmod-ip-nf-filter kmod-ip-nf-match-state
PKG_DEPENDS+=		kmod-netfilter-xt-target-tcpmss
PKG_DEPENDS+=		kmod-ip6-nf-iptables kmod-nf-conntrack-ipv6
PKG_DEPENDS+=		kmod-ip6-nf-filter kmod-ip6-nf-target-reject
PKG_URL:=		http://www.netfilter.org/
PKG_SITES:=		http://www.netfilter.org/projects/iptables/files/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

PKG_SUBPKGS:=		IPTABLES IP6TABLES
PKGSD_IPTABLES:=	iptables for IPv4
PKGSD_IP6TABLES:=	iptables for IPv6
PKGSS_IP6TABLES:=	iptables

include ${TOPDIR}/mk/package.mk

# right now default extensions are builtin
# use --disable-static in CONFIGURE_ARGS to change and optimize package
#include ${LINUX_DIR}/.config

$(eval $(call PKG_template,IPTABLES,iptables,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_IPTABLES},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,IP6TABLES,ip6tables,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_IP6TABLES},${PKGSD_IP6TABLES},${PKG_SECTION},${PKG_OPTS}))

TARGET_LDFLAGS+=	-fPIC
CONFIGURE_ARGS+=	--enable-devel

iptables-install:
	${INSTALL_DIR} ${IDIR_IPTABLES}/{usr/lib,etc,usr/sbin}
	${INSTALL_DATA} ./files/firewall.conf ${IDIR_IPTABLES}/etc
	${CP} ${WRKINST}/usr/sbin/iptables* ${IDIR_IPTABLES}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/xtables* ${IDIR_IPTABLES}/usr/sbin
	${CP} ${WRKINST}/usr/lib/libiptc.so* ${IDIR_IPTABLES}/usr/lib
	${CP} ${WRKINST}/usr/lib/libip4tc.so* ${IDIR_IPTABLES}/usr/lib
	${CP} ${WRKINST}/usr/lib/libxtables.so* ${IDIR_IPTABLES}/usr/lib

ip6tables-install:
	${INSTALL_DIR} ${IDIR_IP6TABLES}/{usr/lib,etc,usr/sbin}
	${INSTALL_DATA} ./files/firewall6.conf ${IDIR_IP6TABLES}/etc
	${CP} ${WRKINST}/usr/sbin/ip6tables ${IDIR_IP6TABLES}/usr/sbin
	${CP} ${WRKINST}/usr/lib/libip6tc.so* ${IDIR_IP6TABLES}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
