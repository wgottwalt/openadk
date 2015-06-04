# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		zsh
PKG_VERSION:=		5.0.7
PKG_RELEASE:=		1
PKG_HASH:=		43f0a4c179ef79bb8c9153575685f7f45f28a3615c8cf96345f503d5b9e7b919
PKG_DESCR:=		z shell
PKG_SECTION:=		base/shells
PKG_URL:=		http://www.zsh.org/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=zsh/}

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
