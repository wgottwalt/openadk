# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		autossh
PKG_VERSION:=		1.4e
PKG_RELEASE:=		1
PKG_HASH:=		9e8e10a59d7619176f4b986e256f776097a364d1be012781ea52e08d04679156
PKG_DESCR:=		automatically restart ssh sessions and tunnels
PKG_SECTION:=		net/security
PKG_DEPENDS:=		openssh-client
PKG_URL:=		http://www.harding.motd.ca/autossh/
PKG_SITES:=		http://www.harding.motd.ca/autossh/

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tgz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,AUTOSSH,autossh,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		ac_cv_func_malloc_0_nonnull=yes \
			ac_cv_func_realloc_0_nonnull=yes

autossh-install:
	$(INSTALL_DIR) $(IDIR_AUTOSSH)/usr/bin
	$(INSTALL_BIN) $(WRKBUILD)/autossh $(IDIR_AUTOSSH)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
