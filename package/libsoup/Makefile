# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libsoup
PKG_VERSION:=		2.44.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		92aa3667357157e8f3489bcca287f2fa
PKG_DESCR:=		HTTP client/server library
PKG_SECTION:=		libs
PKG_DEPENDS:=		libsqlite
PKG_BUILDDEP:=		autotool sqlite
PKG_URL:=		https://wiki.gnome.org/LibSoup
PKG_SITES:=		http://ftp.gnome.org/pub/GNOME/sources/libsoup/2.44/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.xz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBSOUP,libsoup,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

AUTOTOOL_STYLE:=	autoreconf

libsoup-install:
	$(INSTALL_DIR) $(IDIR_LIBSOUP)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libsoup*.so* \
		$(IDIR_LIBSOUP)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
