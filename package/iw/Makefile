# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		iw
PKG_VERSION:=		0.9.17
PKG_RELEASE:=		1
PKG_MD5SUM:=		427841093ac11c5cbc025a3e13aac139
PKG_DESCR:=		Tools for setting up WiFi cards via netlink (nl80211)
PKG_SECTION:=		net
PKG_DEPENDS:=		libnl
PKG_URL:=		http://wireless.kernel.org/en/users/Documentation/iw
PKG_SITES:=		http://wireless.kernel.org/download/iw/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,IW,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

XAKE_FLAGS:=		V=1
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_IW}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/bin/iw ${IDIR_IW}/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
