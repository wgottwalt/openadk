# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		iptables
PKG_VERSION:=		1.4.12.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		212112389c7f10c72efb31a4ed193a4c
PKG_DESCR:=		The netfilter firewalling software
PKG_SECTION:=		firewall
PKG_DEPENDS:=		kmod-ip-nf-iptables kmod-nf-conntrack
PKG_DEPENDS+=		kmod-nf-conntrack-ipv4 kmod-nf-nat
PKG_DEPENDS+=		kmod-ip-nf-target-masquerade kmod-ip-nf-target-reject
PKG_DEPENDS+=		kmod-ip-nf-filter kmod-ip-nf-match-state
PKG_DEPENDS+=		kmod-netfilter-xt-target-tcpmss
PKG_DEPENDS+=		kmod-ip6-nf-iptables kmod-nf-conntrack-ipv6
PKG_DEPENDS+=		kmod-ip6-nf-filter kmod-ip6-nf-target-reject
PKG_URL:=		http://www.netfilter.org/
PKG_SITES:=		http://www.netfilter.org/projects/iptables/files/

PKG_SUBPKGS:=		IPTABLES IPTABLES_DEV
PKGSC_IPTABLES_DEV:=	devel

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

# right now default extensions are builtin
# use --disable-static in CONFIGURE_ARGS to change and optimize package
#include ${LINUX_DIR}/.config

$(eval $(call PKG_template,IPTABLES,iptables,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,IPTABLES_DEV,iptables-dev,${PKG_VERSION}-${PKG_RELEASE},,${PKG_DESCR},${PKGSC_IPTABLES_DEV}))

CONFIGURE_ARGS+=	--enable-devel

iptables-install:
	${INSTALL_DIR} ${IDIR_IPTABLES}/{usr/lib,etc,usr/sbin}
	${INSTALL_DATA} ./files/firewall.conf ${IDIR_IPTABLES}/etc
	${CP} ${WRKINST}/usr/sbin/iptables* ${IDIR_IPTABLES}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/xtables* ${IDIR_IPTABLES}/usr/sbin
	${CP} ${WRKINST}/usr/lib/libiptc.so* ${IDIR_IPTABLES}/usr/lib
	${CP} ${WRKINST}/usr/lib/libip4tc.so* ${IDIR_IPTABLES}/usr/lib
	${CP} ${WRKINST}/usr/lib/libxtables.so* ${IDIR_IPTABLES}/usr/lib
	${INSTALL_DIR} ${IDIR_IPTABLES}/{usr/lib,etc,usr/sbin}
	${INSTALL_DATA} ./files/firewall6.conf ${IDIR_IPTABLES}/etc
	${INSTALL_BIN} ${WRKINST}/usr/sbin/ip6tables ${IDIR_IPTABLES}/usr/sbin
	${CP} ${WRKINST}/usr/lib/libip6tc.so* ${IDIR_IPTABLES}/usr/lib

iptables-dev-install:
	${INSTALL_DIR} ${IDIR_IPTABLES_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_IPTABLES_DEV}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
