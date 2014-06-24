# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		kbd
PKG_VERSION:=		2.0.1
PKG_RELEASE:=		2
PKG_MD5SUM:=		55453cb09d90370005e696949092b8f6
PKG_DESCR:=		keyboard utility
PKG_SECTION:=		sys/hw
PKG_DEPENDS:=		libcheck
PKG_BUILDDEP:=		flex-host bison-host check
PKG_URL:=		http://kbd-project.org/
PKG_SITES:=		http://kbd-project.org/download/

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,KBD,kbd,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-vlock

kbd-install:
	$(INSTALL_DIR) $(IDIR_KBD)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/loadkeys \
		$(IDIR_KBD)/usr/bin
ifeq ($(ADK_TARGET_SYSTEM_SHARP_ZAURUS),y)
	$(INSTALL_DIR) $(IDIR_KBD)/etc
	$(CP) ./files/zaurus.map $(IDIR_KBD)/etc
endif

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
