# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ethtool
PKG_VERSION:=		5
PKG_RELEASE:=		1
PKG_MD5SUM:=		5df7f165974e096e2de890e099f87a12
PKG_DESCR:=		Display or change ethernet card settings
PKG_SECTION:=		net
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=gkernel/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,ETHTOOL,ethtool,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_ETHTOOL}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/* ${IDIR_ETHTOOL}/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
