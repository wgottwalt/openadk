# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		gdk-pixbuf
PKG_VERSION:=		2.24.0
PKG_RELEASE:=		2
PKG_MD5SUM:=		bd7c2a9d23b573db467e39833f12103d
PKG_DESCR:=		GDK pixbuf library
PKG_SECTION:=		libs
PKG_BUILDDEP:=		libjpeg-turbo libtiff
PKG_SITES:=		http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.24/
PKG_NEED_CXX:=		1
PKG_OPTS:=		dev

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,GDK_PIXBUF,gdk-pixbuf,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ENV+=		gio_can_sniff=no

gdk-pixbuf-install:
	$(INSTALL_DIR) $(IDIR_GDK_PIXBUF)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/
	$(CP) $(WRKINST)/usr/lib/libgdk_pixbuf*so* \
		$(IDIR_GDK_PIXBUF)/usr/lib
	$(CP) $(WRKINST)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-*.so \
		$(IDIR_GDK_PIXBUF)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/
	$(CP) ./files/loaders.cache \
		 $(IDIR_GDK_PIXBUF)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache

include ${TOPDIR}/mk/pkg-bottom.mk
