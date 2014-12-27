# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libsoup
PKG_VERSION:=		2.44.2
PKG_RELEASE:=		1
PKG_HASH:=		e7e4b5ab74a6c00fc267c9f5963852d28759ad3154dab6388e2d6e1962d598f3
PKG_DESCR:=		http client/server library
PKG_SECTION:=		libs/net
PKG_DEPENDS:=		libsqlite glib
PKG_BUILDDEP:=		sqlite glib
PKG_URL:=		https://wiki.gnome.org/LibSoup
PKG_SITES:=		http://ftp.gnome.org/pub/GNOME/sources/libsoup/2.44/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.xz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBSOUP,libsoup,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

AUTOTOOL_STYLE:=	autoreconf

libsoup-install:
	$(INSTALL_DIR) $(IDIR_LIBSOUP)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libsoup*.so* \
		$(IDIR_LIBSOUP)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
