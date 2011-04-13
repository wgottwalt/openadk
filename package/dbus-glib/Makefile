# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		dbus-glib
PKG_VERSION:=		0.86
PKG_RELEASE:=		1
PKG_MD5SUM:=		cd0ab148fb0c786fc88be49d19971f50
PKG_DESCR:=		DBUS glib bindings
PKG_SECTION:=		libs
PKG_DEPENDS:=		dbus glib
PKG_BUILDDEP:=		dbus glib
PKG_URL:=		http://www.freedesktop.org/wiki/Software/DBusBindings
PKG_SITES:=		http://dbus.freedesktop.org/releases/dbus-glib/

PKG_SUBPKGS:=		DBUS_GLIB DBUS_GLIB_DEV
PKGSC_DBUS_GLIB_DEV:=	devel
PKGSD_DBUS_GLIB_DEV:=	dbus-glib headers

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,DBUS_GLIB,dbus-glib,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,DBUS_GLIB_DEV,dbus-glib-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_DBUS_GLIB_DEV},${PKGSC_DBUS_GLIB_DEV}))

TARGET_CFLAGS:=         $(filter-out -flto,$(TARGET_CFLAGS))
CONFIGURE_ARGS+=	--disable-checks
CONFIGURE_ENV+=		ac_cv_have_abstract_sockets=no

dbus-glib-install:
	$(INSTALL_DIR) $(IDIR_DBUS_GLIB)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libdbus-glib-1.so* \
		$(IDIR_DBUS_GLIB)/usr/lib

dbus-glib-dev-install:
	$(INSTALL_DIR) $(IDIR_DBUS_GLIB_DEV)/usr/include
	$(CP) $(WRKINST)/usr/include/* \
		$(IDIR_DBUS_GLIB_DEV)/usr/include
	$(INSTALL_DIR) $(IDIR_DBUS_GLIB_DEV)/usr/lib/pkgconfig
	${CP} $(WRKINST)/usr/lib/pkgconfig/*.pc \
		$(IDIR_DBUS_GLIB_DEV)/usr/lib/pkgconfig
	$(INSTALL_DIR) $(IDIR_DBUS_GLIB_DEV)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/dbus-binding-tool \
		$(IDIR_DBUS_GLIB_DEV)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
