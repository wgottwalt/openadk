# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		gdk-pixbuf
PKG_VERSION:=		2.24.0
PKG_RELEASE:=		2
PKG_HASH:=		67c11d3aa40441c1cea42c365bf2d6a9a9dd52fae2d359a707ad5e8abb4d28a7
PKG_DESCR:=		image loading and pixel buffer manipulation library
PKG_SECTION:=		libs/image
PKG_DEPENDS:=		libstdcxx
PKG_BUILDDEP:=		libjpeg-turbo libtiff
HOST_BUILDDEP:=		glib-host
PKG_SITES:=		http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.24/
PKG_OPTS:=		dev

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,GDK_PIXBUF,gdk-pixbuf,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,GDK_PIXBUF,gdk-pixbuf,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_CONFIGURE_ARGS+=	--disable-glibtest \
			--without-libtiff
CONFIGURE_ENV+=		gio_can_sniff=no

gdk-pixbuf-install:
	$(INSTALL_DIR) $(IDIR_GDK_PIXBUF)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/
	$(CP) $(WRKINST)/usr/lib/libgdk_pixbuf*so* \
		$(IDIR_GDK_PIXBUF)/usr/lib
	$(CP) $(WRKINST)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-*.so \
		$(IDIR_GDK_PIXBUF)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/
	$(CP) ./files/loaders.cache \
		 $(IDIR_GDK_PIXBUF)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
