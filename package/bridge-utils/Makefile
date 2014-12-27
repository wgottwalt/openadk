# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		bridge-utils
PKG_VERSION:=		1.5
PKG_RELEASE:=		2
PKG_HASH:=		42f9e5fb8f6c52e63a98a43b81bd281c227c529f194913e1c51ec48a393b6688
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
