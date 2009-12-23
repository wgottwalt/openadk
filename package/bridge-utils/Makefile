# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		bridge-utils
PKG_VERSION:=		1.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		0182fcac3a2b307113bbec34e5f1c673
PKG_DESCR:=		Ethernet bridging tools
PKG_SECTION:=		net
PKG_DEPENDS:=		kmod-bridge
PKG_URL:=		http://www.linuxfoundation.org/en/Net:Bridge
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=bridge/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,BRIDGE_UTILS,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	autoconf gnu
CONFIGURE_ARGS+=	--with-linux-headers=${LINUX_DIR}
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_BRIDGE_UTILS}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/brctl ${IDIR_BRIDGE_UTILS}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
