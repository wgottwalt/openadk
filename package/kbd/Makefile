# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		kbd
PKG_VERSION:=		2.0.2
PKG_RELEASE:=		2
PKG_HASH:=		9dfddabf96012e329c4bebb96a21aeef7c3872f624e96e8156ba542b82aeb912
PKG_DESCR:=		keyboard and font utilities
PKG_SECTION:=		sys/hw
PKG_DEPENDS:=		libcheck
PKG_BUILDDEP:=		flex-host bison-host check
PKG_URL:=		http://kbd-project.org/
PKG_SITES:=		http://kbd-project.org/download/

PKG_CFLINE_KBD:=	default y if ADK_TARGET_WITH_INPUT

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,KBD,kbd,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-vlock

kbd-install:
	$(INSTALL_DIR) $(IDIR_KBD)/usr/share
	$(CP) $(WRKINST)/usr/share/keymaps \
		$(IDIR_KBD)/usr/share
	$(CP) $(WRKINST)/usr/share/consolefonts \
		$(IDIR_KBD)/usr/share
	$(CP) $(WRKINST)/usr/share/consoletrans \
		$(IDIR_KBD)/usr/share
	$(CP) $(WRKINST)/usr/share/unimaps \
		$(IDIR_KBD)/usr/share
	$(INSTALL_DIR) $(IDIR_KBD)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/kbd_mode \
		$(IDIR_KBD)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/setfont \
		$(IDIR_KBD)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/showkey \
		$(IDIR_KBD)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/loadunimap \
		$(IDIR_KBD)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/loadkeys \
		$(IDIR_KBD)/usr/bin
ifeq ($(ADK_TARGET_SYSTEM_SHARP_ZAURUS),y)
	$(INSTALL_DIR) $(IDIR_KBD)/etc
	$(CP) ./files/zaurus.map $(IDIR_KBD)/etc
endif

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
