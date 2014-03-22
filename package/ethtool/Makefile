# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ethtool
PKG_VERSION:=		3.13
PKG_RELEASE:=		1
PKG_MD5SUM:=		dcb8f345d44ee79108282e7d0bdf5013
PKG_DESCR:=		display or change ethernet card settings
PKG_SECTION:=		net
PKG_SITES:=		https://www.kernel.org/pub/software/network/ethtool/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,ETHTOOL,ethtool,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ethtool-install:
	${INSTALL_DIR} ${IDIR_ETHTOOL}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/ethtool ${IDIR_ETHTOOL}/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
