# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		mksh
PKG_VERSION:=		50e
PKG_RELEASE:=		1
PKG_HASH:=		ad3c148769d08cf934a96be2837599ba9db355f38a8f49c7bc8876b80d2e08da
PKG_DESCR:=		mirbsd korn shell
PKG_SECTION:=		base/shells
PKG_URL:=		http://www.mirbsd.org/mksh.htm
PKG_SITES:=		$(MASTER_SITE_MIRBSD:distfiles/=dist/mir/mksh/)

PKG_DFLT_MKSH:=		y if (!ADK_TOOLCHAIN_ONLY && ADK_TARGET_WITH_MMU)

DISTFILES:=		$(PKG_NAME)-R$(PKG_VERSION).tgz
WRKDIST=		$(WRKDIR)/$(PKG_NAME)

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,MKSH,mksh,$(PKG_VERSION)-$(PKG_RELEASE)))
$(eval $(call PKG_template,MKSH,mksh,$(PKG_VERSION)-$(PKG_RELEASE),,$(PKG_DESCR),$(PKG_SECTION)))

TARGET_CPPFLAGS+=	-DMKSHRC_PATH=\"/etc/mkshrc\"

HOST_STYLE:=		manual
CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

host-build:
	cd $(WRKBUILD) && $(BASH) $(WRKSRC)/Build.sh -Q -r -c lto

mksh-hostinstall:
	$(INSTALL_DIR) $(STAGING_HOST_DIR)/usr/bin
	$(INSTALL_BIN) $(WRKBUILD)/mksh \
	    $(STAGING_HOST_DIR)/usr/bin

do-build:
	cd $(WRKBUILD) && CC='$(TARGET_CC)' CFLAGS='$(TARGET_CFLAGS)' \
	    CPPFLAGS='$(TARGET_CPPFLAGS)' LDFLAGS='$(TARGET_LDFLAGS)' \
	    HAVE_CAN_FSTACKPROTECTORALL=0 HAVE_CAN_FSTACKPROTECTORSTRONG=0 \
	    TARGET_OS=Linux $(BASH) $(WRKSRC)/Build.sh -Q -r -c lto

mksh-install:
	$(INSTALL_DIR) $(IDIR_MKSH)/etc
	$(CP) $(WRKSRC)/dot.mkshrc $(IDIR_MKSH)/etc/mkshrc
	$(INSTALL_DIR) $(IDIR_MKSH)/bin
	$(INSTALL_BIN) $(WRKBUILD)/mksh $(IDIR_MKSH)/bin

include $(ADK_TOPDIR)/mk/host-bottom.mk
include $(ADK_TOPDIR)/mk/pkg-bottom.mk
