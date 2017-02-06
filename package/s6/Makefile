# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		s6
PKG_VERSION:=		2.3.0.0
PKG_RELEASE:=		1
PKG_HASH:=		49c9a0476d93c6279c776ca5ae9c49b3fd39c356eda674828aebf78f8488e8e6
PKG_DESCR:=		small suite of programs for UNIX, designed to allow process supervision
PKG_SECTION:=		base/init
PKG_DEPENDS:=		skalibs execline
PKG_BUILDDEP:=		skalibs execline
PKG_URL:=		http://www.skarnet.org/software/s6/
PKG_SITES:=		http://www.skarnet.org/software/s6/

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,S6,s6,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIGURE_ARGS+=	--with-sysdeps=$(STAGING_TARGET_DIR)/usr/lib/skalibs/sysdeps \
			--with-include=$(STAGING_TARGET_DIR)/usr/include \
			--with-dynlib=$(STAGING_TARGET_DIR)/usr/lib \
			--disable-allstatic 

s6-install:
	$(INSTALL_DIR) $(IDIR_S6)/usr/bin
	$(INSTALL_DIR) $(IDIR_S6)/usr/sbin
	$(INSTALL_DIR) $(IDIR_S6)/usr/libexec
	$(CP) $(WRKINST)/usr/bin/* \
		$(IDIR_S6)/usr/bin
	$(CP) $(WRKINST)/usr/sbin/* \
		$(IDIR_S6)/usr/sbin
	$(CP) $(WRKINST)/usr/libexec/* \
		$(IDIR_S6)/usr/libexec

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
