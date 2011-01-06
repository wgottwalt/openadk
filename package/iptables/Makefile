# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		iptables
PKG_VERSION:=		1.4.8
PKG_RELEASE:=		1
PKG_MD5SUM:=		697ed89f37af4473a5f6349ba2700f2d
PKG_DESCR:=		The netfilter firewalling software
PKG_SECTION:=		firewall
PKG_DEPENDS:=		kmod-ip-nf-iptables kmod-nf-conntrack
PKG_DEPENDS+=		kmod-nf-conntrack-ipv4 kmod-nf-nat
PKG_DEPENDS+=		kmod-ip-nf-target-masquerade kmod-ip-nf-target-reject
PKG_DEPENDS+=		kmod-ip-nf-filter kmod-ip-nf-match-state
PKG_DEPENDS+=		kmod-netfilter-xt-target-tcpmss
PKG_DEPENDS6:=		kmod-ip6-nf-iptables kmod-nf-conntrack-ipv6
PKG_DEPENDS6+=		kmod-ip6-nf-filter kmod-ip6-nf-target-reject
PKG_URL:=		http://www.netfilter.org
PKG_SITES:=		http://www.netfilter.org/projects/iptables/files/ \
			ftp://ftp.be.netfilter.org/pub/netfilter/iptables/ \
			ftp://ftp.de.netfilter.org/pub/netfilter/iptables/ \
			ftp://ftp.no.netfilter.org/pub/netfilter/iptables/

PKG_SUBPKGS:=		IPTABLES IP6TABLES

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

# right now default extensions are builtin
# use --disable-static in CONFIGURE_ARGS to change and optimize package
#include ${LINUX_DIR}/.config

$(eval $(call PKG_template,IPTABLES,iptables,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,IP6TABLES,ip6tables,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS6},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--enable-devel

post-install:
	${INSTALL_DIR} ${IDIR_IPTABLES}/{usr/lib,etc,usr/sbin}
	${INSTALL_DATA} ./files/firewall.conf ${IDIR_IPTABLES}/etc
	${CP} ${WRKINST}/usr/sbin/iptables* ${IDIR_IPTABLES}/usr/sbin/
	${CP} ${WRKINST}/usr/lib/libiptc.so* ${IDIR_IPTABLES}/usr/lib
	${CP} ${WRKINST}/usr/lib/libip4tc.so* ${IDIR_IPTABLES}/usr/lib
	${CP} ${WRKINST}/usr/lib/libxtables.so* ${IDIR_IPTABLES}/usr/lib

ip6tables-install:
	${INSTALL_DIR} ${IDIR_IP6TABLES}/{usr/lib,etc,usr/sbin}
	${INSTALL_DATA} ./files/firewall6.conf ${IDIR_IP6TABLES}/etc
	${INSTALL_BIN} ${WRKINST}/usr/sbin/ip6tables ${IDIR_IP6TABLES}/usr/sbin/
	${CP} ${WRKINST}/usr/lib/libip6tc.so* ${IDIR_IP6TABLES}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
