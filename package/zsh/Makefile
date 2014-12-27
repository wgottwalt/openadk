# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		zsh
PKG_VERSION:=		5.0.5
PKG_RELEASE:=		1
PKG_HASH:=		b35cf19e4a6ba39fd03c6372b8a8760a491cc2e2e4aba3d15023ff291c2894b4
PKG_DESCR:=		z shell
PKG_SECTION:=		base/shells
PKG_URL:=		http://www.zsh.org/
PKG_SITES:=		ftp://ftp.fu-berlin.de/pub/unix/shells/zsh/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,ZSH,zsh,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-gdbm \
			--disable-pcre \
			--disable-cap \
			--disable-locale

zsh-install:
	$(INSTALL_DIR) $(IDIR_ZSH)/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/zsh $(IDIR_ZSH)/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
