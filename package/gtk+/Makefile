# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		gtk+
PKG_VERSION:=		2.24.23
PKG_EXTRAVER:=		2.24
PKG_RELEASE:=		1
PKG_MD5SUM:=		0be39fbed4ca125645175cd6e22f2548
PKG_DESCR:=		multi-platform toolkit for creating graphical user interfaces
PKG_SECTION:=		libs/misc
PKG_DEPENDS:=		glib libstdcxx
PKG_BUILDDEP:=		cairo atk pango libXext renderproto libXrender
PKG_BUILDDEP+=		gdk-pixbuf libXcomposite libXdamage libX11
PKG_URL:=		http://www.gtk.org/
PKG_SITES:=		http://ftp.gnome.org/pub/gnome/sources/gtk+/$(PKG_EXTRAVER)/
PKG_LIBNAME:=		libgtk
PKG_OPTS:=		dev

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBGTK,libgtk,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-gtk-doc-html \
			--disable-modules \
			--disable-xinerama \
			--without-xinput \
			--disable-gtk-doc \
			--disable-cups \
			--disable-papi \
			--disable-introspection
CONFIGURE_ENV+=		gio_can_sniff=no \
			ac_cv_path_GTK_UPDATE_ICON_CACHE=""

libgtk-install:
	${INSTALL_DIR} ${IDIR_LIBGTK}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgdk-x11*so* ${IDIR_LIBGTK}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgtk-x11*so* ${IDIR_LIBGTK}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgailutil*so* ${IDIR_LIBGTK}/usr/lib
	# workaround dev subpackage
	${INSTALL_DIR} ${IDIR_LIBGTK_DEV}/usr/lib/gtk-2.0/include
	${CP} ${WRKINST}/usr/lib/gtk-2.0/include/* \
		${IDIR_LIBGTK_DEV}/usr/lib/gtk-2.0/include

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
