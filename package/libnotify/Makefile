# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libnotify
PKG_VERSION:=		0.4.5
PKG_RELEASE:=		3
PKG_MD5SUM:=		472e2c1f808848365572a9b024d9e8f5
PKG_DESCR:=		notify library
PKG_SECTION:=		libs/misc
PKG_DEPENDS:=		libstdcxx
PKG_BUILDDEP:=		gtk+ dbus-glib
PKG_URL:=		http://www.galago-project.org/
PKG_SITES:=		http://www.galago-project.org/files/releases/source/libnotify/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBNOTIFY,libnotify,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libnotify-install:
	$(INSTALL_DIR) $(IDIR_LIBNOTIFY)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libnotify*.so* \
		$(IDIR_LIBNOTIFY)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
