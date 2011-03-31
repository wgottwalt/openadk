# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		GConf
PKG_VERSION:=		2.32.1
PKG_EXTRAVER:=		2.32
PKG_RELEASE:=		1
PKG_MD5SUM:=		de83e70453910ac62f9ee2a86444bdab
PKG_DESCR:=		a system for storing application preferences
PKG_SECTION:=		libs
PKG_BUILDDEP:=		dbus dbus-glib
PKG_DEPENDS:=		dbus dbus-glib
PKG_URL:=		http://projects.gnome.org/gconf/
PKG_SITES:=		ftp://ftp.gnome.org//pub/GNOME/sources/GConf/${PKG_EXTRAVER}/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,GCONF,gconf,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

gconf-install:
	$(INSTALL_DIR) $(IDIR_GCONF)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/* $(IDIR_GCONF)/usr/bin
	$(INSTALL_DIR) $(IDIR_GCONF)/usr/lib
	$(INSTALL_BIN) $(WRKINST)/usr/lib/libgconf*.so* \
		$(IDIR_GCONF)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
