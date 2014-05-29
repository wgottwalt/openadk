# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		polipo
PKG_VERSION:=		1.0.4.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		bfc5c85289519658280e093a270d6703
PKG_DESCR:=		web proxy with socks5 support
PKG_SECTION:=		net/proxy
PKG_URL:=		http://www.pps.univ-paris-diderot.fr/~jch/software/polipo/
PKG_SITES:=		http://freehaven.net/~chrisd/polipo/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,POLIPO,polipo,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE=		manual
FAKE_FLAGS+=		TARGET=${WRKINST}

polipo-install:
	$(INSTALL_DIR) $(IDIR_POLIPO)/etc/polipo
	$(INSTALL_DATA) ./files/config \
		$(IDIR_POLIPO)/etc/polipo
	$(INSTALL_DIR) $(IDIR_POLIPO)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/local/bin/polipo \
		$(IDIR_POLIPO)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
