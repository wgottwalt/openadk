# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		gzip
PKG_VERSION:=		1.9
PKG_RELEASE:=		1
PKG_HASH:=		ae506144fc198bd8f81f1f4ad19ce63d5a2d65e42333255977cf1dcf1479089a
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
