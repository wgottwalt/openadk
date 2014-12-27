# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		patch
PKG_VERSION:=		2.7.1
PKG_RELEASE:=		1
PKG_HASH:=		9124ba46db0abd873d0995c2ca880e81252676bb6c03e0a37dfc5f608a9b0ceb
PKG_DESCR:=		patch utility
PKG_SECTION:=		sys/utils
PKG_URL:=		http://www.gnu.org/software/patch/
PKG_SITES:=		${MASTER_SITE_GNU:=patch/}
PKG_BB:=		1

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,PATCH,patch,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,PATCH,patch,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

patch-install:
	$(INSTALL_DIR) $(IDIR_PATCH)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/patch $(IDIR_PATCH)/usr/bin

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
