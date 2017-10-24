# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libsoup
PKG_VERSION:=		2.60.1
PKG_RELEASE:=		1
PKG_HASH:=		023930032b20e6b14764feb847ea80d9e170622dee7370215d6feb9967b6aa9d
PKG_DESCR:=		http client/server library
PKG_SECTION:=		libs/net
PKG_DEPENDS:=		libsqlite glib
PKG_BUILDDEP:=		sqlite glib
PKG_URL:=		https://wiki.gnome.org/LibSoup
PKG_SITES:=		http://ftp.gnome.org/pub/GNOME/sources/libsoup/2.60/
PKG_OPTS:=		dev

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBSOUP,libsoup,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

AUTOTOOL_STYLE:=	autoreconf

libsoup-install:
	$(INSTALL_DIR) $(IDIR_LIBSOUP)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libsoup*.so* \
		$(IDIR_LIBSOUP)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
