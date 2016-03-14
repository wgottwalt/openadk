# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		ethtool
PKG_VERSION:=		4.5
PKG_RELEASE:=		1
PKG_HASH:=		bb2834332c5ac7f5bbe1c9f78f4fa851e4a3fe6397b124d58467c9ccee9fca3b
PKG_DESCR:=		display or change ethernet card settings
PKG_SECTION:=		net/misc
PKG_SITES:=		https://www.kernel.org/pub/software/network/ethtool/

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,ETHTOOL,ethtool,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ethtool-install:
	${INSTALL_DIR} ${IDIR_ETHTOOL}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/ethtool ${IDIR_ETHTOOL}/usr/sbin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
