# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		execline
PKG_VERSION:=		2.1.5.0
PKG_RELEASE:=		1
PKG_HASH:=		8a3605a6db73183baa376bf2130e8b7eb75a5b5347c7f9144e520fe86bcb1142
PKG_DESCR:=		non-interactive scripting language
PKG_SECTION:=		libs/misc
PKG_DEPENDS:=		skalibs
PKG_BUILDDEP:=		skalibs
PKG_URL:=		http://skarnet.org/software/execline/
PKG_SITES:=		http://skarnet.org/software/execline/
PKG_OPTS:=		dev

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,EXECLINE,execline,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

CONFIGURE_ARGS+=	--with-sysdeps=$(STAGING_TARGET_DIR)/usr/lib/skalibs/sysdeps \
			--with-include=$(STAGING_TARGET_DIR)/usr/include \
			--with-dynlib=$(STAGING_TARGET_DIR)/usr/lib \
			--disable-allstatic

execline-install:
	$(INSTALL_DIR) $(IDIR_EXECLINE)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libexecline*.so* \
		$(IDIR_EXECLINE)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
