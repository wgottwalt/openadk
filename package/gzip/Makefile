# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		gzip
PKG_VERSION:=		1.7
PKG_RELEASE:=		1
PKG_HASH:=		fb31c57e7ce7703596ef57329be7cc5c5fd741b4a0f659fea7ee6a54706b41ab
PKG_DESCR:=		compression utility
PKG_SECTION:=		app/archive
PKG_URL:=		http://www.gnu.org/software/gzip/
PKG_SITES:=		${MASTER_SITE_GNU:=gzip/}
PKG_BB:=		1

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,GZIP,gzip,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

gzip-install:
	$(INSTALL_DIR) $(IDIR_GZIP)/usr/bin
	$(CP) $(WRKINST)/usr/bin/* $(IDIR_GZIP)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
