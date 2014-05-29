# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ipset
PKG_VERSION:=		4.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		d104007fdf5ea64fef774c22b1c0a97b
PKG_DESCR:=		ip sets administration utility
PKG_SECTION:=		net/firewall
PKG_URL:=		http://ipset.netfilter.org/
PKG_SITES:=		http://ipset.netfilter.org/

PKG_ARCH_DEPENDS:=	!arm
PKG_CFLINE_IPSET:=	depends on !ADK_TOOLCHAIN_ONLY

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,IPSET,ipset,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
XAKE_FLAGS+=		PREFIX=/usr
ALL_TARGET:=		binaries
INSTALL_TARGET:=	binaries_install

ipset-install:
	${INSTALL_DIR} ${IDIR_IPSET}/usr/sbin ${IDIR_IPSET}/usr/lib/ipset
	${INSTALL_BIN} ${WRKINST}/usr/sbin/ipset ${IDIR_IPSET}/usr/sbin
	${CP} ${WRKINST}/usr/lib/ipset/*.so ${IDIR_IPSET}/usr/lib/ipset/

include ${TOPDIR}/mk/pkg-bottom.mk
