# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		gtk+
PKG_VERSION:=		2.18.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		8b34f75642ff6cc783dfa7e3af0ba443
PKG_DESCR:=		GTK+ library
PKG_SECTION:=		libs
PKG_DEPENDS:=		glib
PKG_URL:=		http://www.gtk.org/
PKG_SITES:=		http://ftp.gnome.org/pub/gnome/sources/gtk+/2.18/
ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GTK,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ENV+=		gio_can_sniff=no \
			ac_cv_path_GTK_UPDATE_ICON_CACHE="" 
CONFIGURE_ARGS+=	--without-libtiff \
			--without-libjpeg
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_GTK}/usr/lib
	${CP} ${WRKINST}/usr/lib/lib*.so* ${IDIR_GTK}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
