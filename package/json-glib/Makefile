# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		json-glib
PKG_VERSION:=		0.14.2
PKG_RELEASE:=		1
PKG_HASH:=		b816a5fa3e5664b08679a6972a6e5693d6cc1990ff4a6f94c07554db96be94a7
PKG_DESCR:=		library providing serialization and deserialization support for the json format 
PKG_SECTION:=		libs/data
PKG_URL:=		https://wiki.gnome.org/JsonGlib/
PKG_SITES:=		http://ftp.gnome.org/pub/GNOME/sources/json-glib/0.14/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.xz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,JSON_GLIB,json-glib,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

json-glib-install:
	$(INSTALL_DIR) $(IDIR_JSON_GLIB)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libjson-glib*.so* \
		$(IDIR_JSON_GLIB)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
