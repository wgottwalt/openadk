# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		s6-portable-utils
PKG_VERSION:=		2.0.6.0
PKG_RELEASE:=		1
PKG_HASH:=		233b7d13766a23661cc7ed5c052f29b9c558c1d516a538a281a17da22a909d4b
PKG_DESCR:=		set of tiny general Unix utilities
PKG_SECTION:=		sys/misc
PKG_DEPENDS:=		skalibs
PKG_BUILDDEP:=		skalibs
PKG_URL:=		http://skarnet.org/software/s6-portable-utils/
PKG_SITES:=		http://skarnet.org/software/s6-portable-utils/

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,S6_PORTABLE_UTILS,s6-portable-utils,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIGURE_ARGS+=	--with-sysdeps=$(STAGING_TARGET_DIR)/usr/lib/skalibs/sysdeps \
			--with-include=$(STAGING_TARGET_DIR)/usr/include \
			--with-dynlib=$(STAGING_TARGET_DIR)/usr/lib \
			--disable-allstatic 

s6-portable-utils-install:
	$(INSTALL_DIR) $(IDIR_S6_PORTABLE_UTILS)/usr/bin
	$(CP) $(WRKINST)/usr/bin/* \
		$(IDIR_S6_PORTABLE_UTILS)/usr/bin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
