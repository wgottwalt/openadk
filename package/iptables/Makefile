# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		iptables
PKG_VERSION:=		1.4.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		44f13990132c20299c1994cd6f425140
PKG_DESCR:=		The netfilter firewalling software
PKG_SECTION:=		net
PKG_URL:=		http://www.netfilter.org
PKG_SITES:=		http://www.netfilter.org/projects/iptables/files/ \
			ftp://ftp.be.netfilter.org/pub/netfilter/iptables/ \
			ftp://ftp.de.netfilter.org/pub/netfilter/iptables/ \
			ftp://ftp.no.netfilter.org/pub/netfilter/iptables/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

# right now default extensions are builtin
# use --disable-static in CONFIGURE_ARGS to change and optimize package
#include ${LINUX_DIR}/.config

$(eval $(call PKG_template,IPTABLES,iptables,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,IPTABLES_UTILS,iptables-utils,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,IP6TABLES,ip6tables,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--enable-devel
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

SUB_INSTALL-${ADK_PACKAGE_IPTABLES_UTILS}+=		iptables-utils-install
SUB_INSTALL-${ADK_PACKAGE_IP6TABLES}+=			ip6tables-install

post-install: ${SUB_INSTALL-m} ${SUB_INSTALL-y}
	${INSTALL_DIR} ${IDIR_IPTABLES}/usr/lib
	${INSTALL_DIR} ${IDIR_IPTABLES}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/iptables ${IDIR_IPTABLES}/usr/sbin/
	${CP} ${WRKINST}/usr/lib/libiptc.so* ${IDIR_IPTABLES}/usr/lib
	${CP} ${WRKINST}/usr/lib/libip4tc.so* ${IDIR_IPTABLES}/usr/lib
	${CP} ${WRKINST}/usr/lib/libxtables.so* ${IDIR_IPTABLES}/usr/lib

iptables-utils-install:
	${INSTALL_DIR} ${IDIR_IPTABLES_UTILS}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/iptables-{save,restore} ${IDIR_IPTABLES_UTILS}/usr/sbin/

ip6tables-install:
	${INSTALL_DIR} ${IDIR_IP6TABLES}/usr/lib
	${INSTALL_DIR} ${IDIR_IP6TABLES}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/ip6tables ${IDIR_IP6TABLES}/usr/sbin/
	${CP} ${WRKINST}/usr/lib/libip6tc.so* ${IDIR_IP6TABLES}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
