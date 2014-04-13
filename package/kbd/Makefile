# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		kbd
PKG_VERSION:=		2.0.1
PKG_RELEASE:=		2
PKG_MD5SUM:=		e9f2b7046312c11cec9e52e22f307b6a
PKG_DESCR:=		keyboard utility
PKG_SECTION:=		utils
PKG_DEPENDS:=		libcheck
PKG_BUILDDEP:=		flex-host bison-host check
PKG_URL:=		http://kbd-project.org/
PKG_SITES:=		http://kbd-project.org/download/

include $(TOPDIR)/mk/package.mk

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

include ${TOPDIR}/mk/pkg-bottom.mk
