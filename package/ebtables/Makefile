# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		iptables
PKG_VERSION:=		2.0.9
PKG_RELEASE:=		1
PKG_MD5SUM:=		44f13990132c20299c1994cd6f425140
PKG_DESCR:=		ethernet bridging firewall tool
PKG_SECTION:=		net
PKG_URL:=		http://ebtables.sourceforge.net
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=ebtables/}

DISTFILES:=		${PKG_NAME}-v${PKG_VERSION}-1.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,EBTABLES,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_EBTABLES}/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
