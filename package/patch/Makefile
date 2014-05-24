# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		patch
PKG_VERSION:=		2.7.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		e9ae5393426d3ad783a300a338c09b72
PKG_DESCR:=		GNU patch utility
PKG_SECTION:=		utils
PKG_URL:=		http://www.gnu.org/software/patch/
PKG_SITES:=		${MASTER_SITE_GNU:=patch/}
PKG_BB:=		1

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,PATCH,patch,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,PATCH,patch,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

HOST_STYLE:=		auto

patch-install:
	$(INSTALL_DIR) $(IDIR_PATCH)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/patch $(IDIR_PATCH)/usr/bin

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
