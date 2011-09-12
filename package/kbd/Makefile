# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		kbd
PKG_VERSION:=		1.15.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		8143e179a0f3c25646ce5085e8777200
PKG_DESCR:=		keyboard utility
PKG_SECTION:=		utils
PKG_SITES:=		ftp://ftp.altlinux.org/pub/people/legion/kbd/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,KBD,kbd,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

kbd-install:
	$(INSTALL_DIR) $(IDIR_KBD)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/loadkeys \
		$(IDIR_KBD)/usr/bin
ifeq ($(ADK_TARGET_SYSTEM_SHARP_ZAURUS),y)
	$(INSTALL_DIR) $(IDIR_KBD)/etc
	$(CP) ./files/zaurus.map $(IDIR_KBD)/etc
endif

include ${TOPDIR}/mk/pkg-bottom.mk
