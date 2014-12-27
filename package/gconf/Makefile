# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		GConf
PKG_VERSION:=		3.2.6
PKG_EXTRAVER:=		3.2
PKG_RELEASE:=		1
PKG_HASH:=		1912b91803ab09a5eed34d364bf09fe3a2a9c96751fde03a4e0cfa51a04d784c
PKG_DESCR:=		system for storing application preferences
PKG_SECTION:=		libs/misc
PKG_BUILDDEP:=		dbus dbus-glib orbit2 intltool-host
PKG_DEPENDS:=		dbus dbus-glib orbit2
PKG_URL:=		http://projects.gnome.org/gconf/
PKG_SITES:=		ftp://ftp.gnome.org/pub/GNOME/sources/GConf/${PKG_EXTRAVER}/
PKG_LIBNAME:=		gconf
PKG_OPTS:=		dev

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,GCONF,gconf,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--with-gtk=2.0 \
			--disable-documentation

gconf-install:
	$(INSTALL_DIR) $(IDIR_GCONF)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/* $(IDIR_GCONF)/usr/bin
	$(INSTALL_DIR) $(IDIR_GCONF)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libgconf*.so* \
		$(IDIR_GCONF)/usr/lib
	$(INSTALL_DIR) $(IDIR_GCONF)/usr/lib/GConf/2
	$(CP) $(WRKINST)/usr/lib/GConf/2/*.so \
		$(IDIR_GCONF)/usr/lib/GConf/2
	$(INSTALL_DIR) $(IDIR_GCONF)/usr/libexec
	$(INSTALL_BIN) $(WRKINST)/usr/libexec/gconfd-2 \
		$(IDIR_GCONF)/usr/libexec
	$(INSTALL_DIR) $(IDIR_GCONF)/usr/share/dbus-1/services
	$(CP) $(WRKINST)/usr/share/dbus-1/services/* \
		$(IDIR_GCONF)/usr/share/dbus-1/services

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
