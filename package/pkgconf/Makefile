# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		pkgconf
PKG_VERSION:=		0.9.6
PKG_RELEASE:=		1
PKG_HASH:=		8f5f48e52ddef0c3cbffe93f32d5148041e0030b8798b49b0b5fe72f4968d7ec
PKG_DESCR:=		smart pkg-config replacement
PKG_SECTION:=		dev/tools
HOST_BUILDDEP:=		sed-host
PKG_URL:=		https://github.com/pkgconf/pkgconf
PKG_SITES:=		http://rabbit.dereferenced.org/~nenolod/distfiles/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,PKGCONF,pkgconf,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,PKGCONF,pkgconf,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

hostpost-install:
	$(CP) ./files/pkg-config $(STAGING_HOST_DIR)/usr/bin
ifeq ($(ADK_TARGET_USE_STATIC_LIBS_ONLY),y)
	PATH="$(HOST_PATH)" $(SED) "s#@@OPTS@@#--static#" $(STAGING_HOST_DIR)/usr/bin/pkg-config
else
	PATH="$(HOST_PATH)" $(SED) "s#@@OPTS@@##" $(STAGING_HOST_DIR)/usr/bin/pkg-config
endif
	(cd $(STAGING_HOST_DIR)/usr/bin && ln -sf pkg-config $(GNU_TARGET_NAME)-pkg-config)

pkgconf-install:
	$(INSTALL_DIR) $(IDIR_PKGCONF)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/pkgconf \
		$(IDIR_PKGCONF)/usr/bin
	(cd $(IDIR_PKGCONF)/usr/bin && ln -sf pkgconf pkg-config)
	
include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
