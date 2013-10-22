# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		zsh
PKG_VERSION:=		4.3.10
PKG_RELEASE:=		1
PKG_MD5SUM:=		031efc8c8efb9778ffa8afbcd75f0152
PKG_DESCR:=		Z Shell
PKG_SECTION:=		shells
PKG_URL:=		http://www.zsh.org/
PKG_SITES:=		ftp://ftp.fu-berlin.de/pub/unix/shells/zsh/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,ZSH,zsh,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

zsh-install:
	$(INSTALL_DIR) $(IDIR_ZSH)/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/zsh $(IDIR_ZSH)/bin

include ${TOPDIR}/mk/pkg-bottom.mk
