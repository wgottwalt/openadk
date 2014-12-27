# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		6tunnel
PKG_VERSION:=		0.11rc2
PKG_RELEASE:=		1
PKG_HASH:=		58a6e274a46f04dce158be0e071bf076af0dc7b92bc3d8212dc827ab43e1db07
PKG_DESCR:=		ipv4/ipv6 tunnel proxy
PKG_SECTION:=		net/ipv6
PKG_URL:=		http://toxygen.net/6tunnel/
PKG_SITES:=		http://toxygen.net/6tunnel/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,6TUNNEL,6tunnel,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

AUTOTOOL_STYLE:=	autoconf

6tunnel-install:
	$(INSTALL_DIR) $(IDIR_6TUNNEL)/usr/sbin
	$(INSTALL_BIN) $(WRKBUILD)/6tunnel $(IDIR_6TUNNEL)/usr/sbin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
