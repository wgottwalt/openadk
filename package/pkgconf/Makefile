# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		pkgconf
PKG_VERSION:=		0.9.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		babb4e02f0fb8f4044ee95ad2241a676
PKG_DESCR:=		smart pkg-config replacement
PKG_SECTION:=		lang
PKG_URL:=		https://github.com/pkgconf/pkgconf
PKG_SITES:=		http://rabbit.dereferenced.org/~nenolod/distfiles/

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,PKGCONF,pkgconf,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,PKGCONF,pkgconf,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

HOST_STYLE:=		auto

hostpost-install:
	(cd $(STAGING_HOST_DIR)/usr/bin && ln -sf pkgconf pkg-config)
	(cd $(STAGING_HOST_DIR)/usr/bin && ln -sf pkgconf $(GNU_TARGET_NAME)-pkg-config)

pkgconf-install:
	$(INSTALL_DIR) $(IDIR_PKGCONF)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/pkgconf \
		$(IDIR_PKGCONF)/usr/bin
	(cd $(IDIR_PKGCONF)/usr/bin && ln -sf pkgconf pkg-config)
	
include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
