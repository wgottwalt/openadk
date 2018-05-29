# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		zsh
PKG_VERSION:=		5.5.1
PKG_RELEASE:=		1
PKG_HASH:=		e1c38808fcbe0cc1344d55c9a758349f7ba1e317325b154621ac37eddac4aa80
PKG_DESCR:=		z shell
PKG_SECTION:=		base/shells
PKG_DEPENDS:=		libncurses
PKG_BUILDDEP:=		ncurses
PKG_URL:=		http://www.zsh.org/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=zsh/}

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
