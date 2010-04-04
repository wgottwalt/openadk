# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		6tunnel
PKG_VERSION:=		0.11rc2
PKG_RELEASE:=		1
PKG_MD5SUM:=		74e02d4f0704b3083a01feda66033449
PKG_DESCR:=		IPv4/IPv6 tunnel proxy
PKG_SECTION:=		net
PKG_DEPENDS:=		kmod-ipv6
PKG_URL:=		http://toxygen.net/6tunnel/
PKG_SITES:=		http://toxygen.net/6tunnel/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,6TUNNEL,${PKG_NAME},$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	$(INSTALL_DIR) $(IDIR_6TUNNEL)/usr/sbin
	$(INSTALL_BIN) $(WRKBUILD)/6tunnel $(IDIR_6TUNNEL)/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
