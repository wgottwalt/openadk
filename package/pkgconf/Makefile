# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		pkgconf
PKG_VERSION:=		0.9.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		f89a502825ac184ad25a9e4aa977f9b1
PKG_DESCR:=		smart pkg-config replacement
PKG_SECTION:=		dev/tools
PKG_URL:=		https://github.com/pkgconf/pkgconf
PKG_SITES:=		http://rabbit.dereferenced.org/~nenolod/distfiles/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

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
