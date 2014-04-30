# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		geoclue
PKG_VERSION:=		1.99.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		514efbecd69c78b3e0a3d86012b7d88c
PKG_DESCR:=		D-Bus service that provides location information
PKG_SECTION:=		libs
PKG_DEPENDS:=		json-glib
PKG_BUILDDEP:=		json-glib
PKG_URL:=		http://www.freedesktop.org/wiki/Software/GeoClue/
PKG_SITES:=		http://www.freedesktop.org/software/geoclue/releases/1.99/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.xz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,GEOCLUE,geoclue,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

geoclue-install:
	$(INSTALL_DIR) $(IDIR_GEOCLUE)/usr/lib
	$(CP) $(WRKINST)/usr/lib/geoclue*.so* \
		$(IDIR_GEOCLUE)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
