# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		bridge-utils
PKG_VERSION:=		1.5
PKG_RELEASE:=		2
PKG_MD5SUM:=		ec7b381160b340648dede58c31bb2238
PKG_DESCR:=		ethernet bridging tools
PKG_SECTION:=		net/route
PKG_URL:=		http://www.linuxfoundation.org/en/Net:Bridge
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=bridge/}
PKG_BB:=		1
PKG_CFLINE_BRIDGE_UTILS:=select ADK_KERNEL_BRIDGE

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,BRIDGE_UTILS,bridge-utils,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

AUTOTOOL_STYLE:=	autoconf
CONFIGURE_ARGS+=	--with-linux-headers=${LINUX_DIR}

bridge-utils-install:
	${INSTALL_DIR} ${IDIR_BRIDGE_UTILS}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/brctl \
		${IDIR_BRIDGE_UTILS}/usr/sbin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
