# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		iptables-snmp
PKG_VERSION:=		0.1
PKG_RELEASE:=		1
PKG_HASH:=		3275bb3820809a311b9f92ea32f071888b9a92f60c831417490e811f46ec4d54
PKG_DESCR:=		iptables support for net-snmp
PKG_SECTION:=		net/misc
PKG_BUILDDEP:=		net-snmp
PKG_URL:=		http://www.nobiscuit.com/iptables-snmp/
PKG_SITES:=		http://www.nobiscuit.com/iptables-snmp/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_LIBC_DEPENDS:=	uclibc-ng glibc

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,IPTABLES_SNMP,iptables-snmp,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

FAKE_FLAGS+=		INSTALL_PREFIX="${WRKINST}"

iptables-snmp-install:
	${INSTALL_DIR} ${IDIR_IPTABLES_SNMP}/usr/lib
	${CP} ${WRKINST}/usr/lib/iptables-snmp.so ${IDIR_IPTABLES_SNMP}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
