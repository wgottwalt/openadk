# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		parted
PKG_VERSION:=		3.3
PKG_RELEASE:=		5
PKG_HASH:=		57e2b4bd87018625c515421d4524f6e3b55175b472302056391c5f7eccb83d44
PKG_DESCR:=		partition table editor
PKG_SECTION:=		sys/fs
PKG_DEPENDS:=		libblkid libuuid libncurses
PKG_BUILDDEP:=		util-linux ncurses
PKG_NEEDS:=		threads iconv
PKG_URL:=		http://www.gnu.org/software/parted/index.shtml
PKG_SITES:=		$(MASTER_SITE_GNU:=parted/)

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,PARTED,parted,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

ifeq ($(ADK_TARGET_USE_STATIC_LIBS_ONLY),y)
CONFIGURE_ARGS+=	--disable-dynamic-loading
endif

CONFIGURE_ARGS+=	--disable-device-mapper \
			--without-readline

parted-install:
ifneq ($(ADK_TARGET_USE_STATIC_LIBS_ONLY),y)
	$(INSTALL_DIR) $(IDIR_PARTED)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libparted*so* $(IDIR_PARTED)/usr/lib
endif
	$(INSTALL_DIR) $(IDIR_PARTED)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/parted $(IDIR_PARTED)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/partprobe $(IDIR_PARTED)/usr/sbin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
