# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		zsh
PKG_VERSION:=		5.0.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		6fb0e3e52a0f8de5ca63138391b81ce0
PKG_DESCR:=		Z Shell
PKG_SECTION:=		shells
PKG_URL:=		http://www.zsh.org/
PKG_SITES:=		ftp://ftp.fu-berlin.de/pub/unix/shells/zsh/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,ZSH,zsh,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-gdbm \
			--disable-pcre \
			--disable-cap \
			--disable-locale

zsh-install:
	$(INSTALL_DIR) $(IDIR_ZSH)/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/zsh $(IDIR_ZSH)/bin

include ${TOPDIR}/mk/pkg-bottom.mk
