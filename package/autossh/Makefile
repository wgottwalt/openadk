# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		autossh
PKG_VERSION:=		1.4b
PKG_RELEASE:=		1
PKG_HASH:=		e77f518e1f3607aa55086c8969f72d1b44ef99402814a19fec213a6e0f06ef07
PKG_DESCR:=		automatically restart ssh sessions and tunnels
PKG_SECTION:=		net/security
PKG_DEPENDS:=		openssh-client
PKG_URL:=		http://www.harding.motd.ca/autossh/
PKG_SITES:=		http://www.harding.motd.ca/autossh/

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tgz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,AUTOSSH,autossh,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

autossh-install:
	$(INSTALL_DIR) $(IDIR_AUTOSSH)/usr/bin
	$(INSTALL_BIN) $(WRKBUILD)/autossh $(IDIR_AUTOSSH)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
