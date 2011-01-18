# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		gtk+
PKG_VERSION:=		2.22.1
PKG_RELEASE:=		2
PKG_MD5SUM:=		dd1830395a6b9265a1e1989af7a3c5bf
PKG_DESCR:=		GTK+ library
PKG_SECTION:=		libs
PKG_DEPENDS:=		glib
PKG_BUILDDEP:=		cairo atk pango libXext renderproto libXrender
PKG_BUILDDEP+=		gdk-pixbuf libXcomposite
PKG_URL:=		http://www.gtk.org/
PKG_SITES:=		http://ftp.gnome.org/pub/gnome/sources/gtk+/2.22/

PKG_SUBPKGS:=		LIBGTK

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBGTK,libgtk,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-gtk-doc-html \
			--disable-modules \
			--disable-xinerama \
			--without-xinput \
			--disable-gtk-doc \
			--disable-papi \
			--disable-introspection
CONFIGURE_ENV+=		gio_can_sniff=no \
			ac_cv_path_GTK_UPDATE_ICON_CACHE=""

post-install:
	${INSTALL_DIR} ${IDIR_LIBGTK}/usr/lib
	${CP} ${WRKINST}/usr/lib/lib*.so* ${IDIR_LIBGTK}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
