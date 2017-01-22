# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		atk
PKG_VERSION:=		2.20.0
PKG_EXTRAVER:=		2.20
PKG_RELEASE:=		1
PKG_HASH:=		493a50f6c4a025f588d380a551ec277e070b28a82e63ef8e3c06b3ee7c1238f0
PKG_DESCR:=		accessibility toolkit library
PKG_SECTION:=		libs/misc
PKG_BUILDDEP:=		glib
PKG_URL:=		http://www.gnome.org/
PKG_SITES:=		$(MASTER_SITE_GNOME:=atk/$(PKG_EXTRAVER)/)
PKG_LIBNAME:=		libatk
PKG_OPTS:=		dev

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBATK,libatk,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

libatk-install:
	$(INSTALL_DIR) $(IDIR_LIBATK)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libatk-*.so* $(IDIR_LIBATK)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
