# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		keychain
PKG_VERSION:=		2.7.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		07c622833192189f483cbaec287f9704
PKG_DESCR:=		manage ssh and gpg keys in a secure manner
PKG_SECTION:=		app/crypto
PKG_URL:=		http://www.funtoo.org/en/security/keychain/intro/
PKG_SITES:=		http://www.funtoo.org/archive/keychain/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,KEYCHAIN,keychain,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
INSTALL_STYLE:=		manual
ALL_TARGET:=		keychain

do-install:
	$(INSTALL_DIR) $(IDIR_KEYCHAIN)/usr/bin
	$(INSTALL_BIN) $(WRKBUILD)/keychain \
		$(IDIR_KEYCHAIN)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
