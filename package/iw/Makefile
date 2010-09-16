# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		iw
PKG_VERSION:=		0.9.19
PKG_RELEASE:=		1
PKG_MD5SUM:=		3b88743f9c6ce8a7e2f5fd7d18fdea42
PKG_DESCR:=		Tools for setting up WiFi cards via netlink (nl80211)
PKG_SECTION:=		wifi
PKG_DEPENDS:=		libnl
PKG_BUILDDEP:=		libnl
PKG_URL:=		http://wireless.kernel.org/en/users/Documentation/iw
PKG_SITES:=		http://wireless.kernel.org/download/iw/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,IW,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
TCFLAGS+=		$(TCPPFLAGS)

post-install:
	${INSTALL_DIR} ${IDIR_IW}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/iw ${IDIR_IW}/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
