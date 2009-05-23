# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		zsh
PKG_VERSION:=		4.3.9
PKG_RELEASE:=		1
PKG_MD5SUM:=		1b08c063f02d595709eaad1548c4e392
MASTER_SITES:=		ftp://ftp.fu-berlin.de/pub/unix/shells/zsh/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,ZSH,zsh,$(PKG_VERSION)-$(PKG_RELEASE)))

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	$(INSTALL_DIR) $(IDIR_ZSH)/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/zsh $(IDIR_ZSH)/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
