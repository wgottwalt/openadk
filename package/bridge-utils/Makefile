# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		bridge-utils
PKG_VERSION:=		1.6
PKG_RELEASE:=		1
PKG_HASH:=		cc67efb5d5fb8928a6569b3fade2b4042ec17da04678dab127d96b46489e26c8
PKG_DESCR:=		ethernet bridging tools
PKG_SECTION:=		net/route
PKG_URL:=		http://www.linuxfoundation.org/en/Net:Bridge
PKG_SITES:=		http://www.kernel.org/pub/linux/utils/net/bridge-utils/
PKG_BB:=		1

PKG_CFLINE_BRIDGE_UTILS:=select ADK_KERNEL_BRIDGE

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,BRIDGE_UTILS,bridge-utils,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

AUTOTOOL_STYLE:=	autoconf
CONFIGURE_ARGS+=	--with-linux-headers=${LINUX_DIR}

bridge-utils-install:
	${INSTALL_DIR} ${IDIR_BRIDGE_UTILS}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/brctl \
		${IDIR_BRIDGE_UTILS}/usr/sbin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
