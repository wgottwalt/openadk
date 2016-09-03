# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		s6-linux-utils
PKG_VERSION:=		2.1.0.0
PKG_RELEASE:=		1
PKG_HASH:=		3523ba84ba524198711b2de3edaaf620381a4e95d78ec6d13dcb7aba42397ead
PKG_DESCR:=		set of minimalistic Linux-specific system utilities
PKG_SECTION:=		sys/misc
PKG_DEPENDS:=		skalibs
PKG_BUILDDEP:=		skalibs
PKG_URL:=		http://skarnet.org/software/s6-linux-utils/
PKG_SITES:=		http://skarnet.org/software/s6-linux-utils/

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,S6_LINUX_UTILS,s6-linux-utils,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

TARGET_LDFLAGS+=	-lrt
CONFIGURE_ARGS+=	--with-sysdeps=$(STAGING_TARGET_DIR)/usr/lib/skalibs/sysdeps \
			--with-include=$(STAGING_TARGET_DIR)/usr/include \
			--with-dynlib=$(STAGING_TARGET_DIR)/usr/lib \
			--disable-allstatic 

s6-linux-utils-install:
	$(INSTALL_DIR) $(IDIR_S6_LINUX_UTILS)/usr/bin
	$(CP) $(WRKINST)/usr/bin/* \
		$(IDIR_S6_LINUX_UTILS)/usr/bin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
