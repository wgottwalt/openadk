# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		atk
PKG_VERSION:=		2.16.0
PKG_EXTRAVER:=		2.16
PKG_RELEASE:=		1
PKG_HASH:=		095f986060a6a0b22eb15eef84ae9f14a1cf8082488faa6886d94c37438ae562
PKG_DESCR:=		accessibility toolkit library
PKG_SECTION:=		libs/misc
PKG_BUILDDEP:=		glib
PKG_URL:=		http://www.gnome.org/
PKG_SITES:=		$(MASTER_SITE_GNOME:=atk/$(PKG_EXTRAVER)/)
PKG_LIBNAME:=		libatk
PKG_OPTS:=		dev

PKG_BUILDDEP_UCLIBC_NG:=gettext-tiny

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBATK,libatk,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

libatk-install:
	$(INSTALL_DIR) $(IDIR_LIBATK)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libatk-*.so* $(IDIR_LIBATK)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
