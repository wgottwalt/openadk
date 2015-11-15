# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		gtk+
PKG_VERSION:=		3.16.3
PKG_EXTRAVER:=		3.16
PKG_RELEASE:=		1
PKG_HASH:=		2943fd4a6b02c2a9b2edd231c1d8f7a1d2f8d36996f14310d34f503dca9ebea4
PKG_DESCR:=		multi-platform toolkit for creating graphical user interfaces
PKG_SECTION:=		libs/misc
PKG_DEPENDS:=		glib cairo libxi libepoxy
PKG_BUILDDEP:=		cairo atk pango libXext renderproto libXrender
PKG_BUILDDEP+=		gdk-pixbuf libXcomposite libXdamage libX11 libXi
PKG_BUILDDEP+=		at-spi2-core at-spi2-atk gdk-pixbuf-host libepoxy
PKG_NEEDS:=		c++
PKG_URL:=		http://www.gtk.org/
PKG_SITES:=		$(MASTER_SITE_GNOME:=gtk+/$(PKG_EXTRAVER)/)
PKG_LIBNAME:=		libgtk3
PKG_OPTS:=		dev

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBGTK3,libgtk3,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

HOST_CFLAGS+=           -I$(STAGING_HOST_DIR)/usr/include/glib-2.0 -I$(STAGING_HOST_DIR)/usr/include/gdk-pixbuf-2.0
HOST_LDFLAGS+=		-lgobject-2.0 -lgmodule-2.0 -pthread -lrt -lglib-2.0 -lgdk_pixbuf-2.0
CONFIGURE_ARGS+=	--disable-gtk-doc-html \
			--disable-gtk-doc \
			--disable-modules \
			--disable-xinerama \
			--disable-cups \
			--disable-papi \
			--enable-introspection=no

libgtk3-install:
	$(INSTALL_DIR) $(IDIR_LIBGTK3)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libgdk-3.so* $(IDIR_LIBGTK3)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libgtk-3.so* $(IDIR_LIBGTK3)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libgailutil-3.so* $(IDIR_LIBGTK3)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
