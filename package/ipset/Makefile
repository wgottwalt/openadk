# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ipset
PKG_VERSION:=		3.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		92bb09883dd8a77ec5cfbff1c8932b15
PKG_DESCR:=		Netfilter ip sets administration utility
PKG_SECTION:=		net
PKG_URL:=		http://ipset.netfilter.org
PKG_SITES:=		http://ipset.netfilter.org/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,IPSET,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

XAKE_FLAGS+=		V=1 ARCH=${ARCH} KERNEL_DIR=${LINUX_DIR} \
			PREFIX=/usr LD=$(TARGET_CROSS)ld \
			CROSS_COMPILE="${TARGET_CROSS}"
BUILD_STYLE=		auto
INSTALL_STYLE=		auto
INSTALL_TARGET=		binaries_install

post-install:
	${INSTALL_DIR} ${IDIR_IPSET}/usr/sbin
	${INSTALL_DIR} ${IDIR_IPSET}/usr/lib/ipset
	${INSTALL_BIN} ${WRKINST}/usr/sbin/ipset ${IDIR_IPSET}/usr/sbin
	${CP} ${WRKINST}/usr/lib/ipset/*.so ${IDIR_IPSET}/usr/lib/ipset/

include ${TOPDIR}/mk/pkg-bottom.mk
