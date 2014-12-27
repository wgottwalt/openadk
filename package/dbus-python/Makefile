# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		dbus-python
PKG_VERSION:=		1.2.0
PKG_RELEASE:=		2
PKG_HASH:=		e12c6c8b2bf3a9302f75166952cbe41d6b38c3441bbc6767dbd498942316c6df
PKG_DESCR:=		python bindings for dbus
PKG_SECTION:=		dev/python
PKG_DEPENDS:=		dbus dbus-glib
PKG_BUILDDEP:=		dbus dbus-glib
PKG_URL:=		http://dbus.freedesktop.org/doc/dbus-python/
PKG_SITES:=		http://dbus.freedesktop.org/releases/dbus-python/

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,DBUS_PYTHON,dbus-python,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

dbus-python-install:
	$(INSTALL_DIR) $(IDIR_DBUS_PYTHON)/usr/lib/python2.7/site-packages/
	$(CP) $(WRKINST)/usr/lib/python2.7/site-packages/*.so \
		$(IDIR_DBUS_PYTHON)/usr/lib/python2.7/site-packages/
	$(INSTALL_DIR) $(IDIR_DBUS_PYTHON)/usr/lib/python2.7/site-packages/dbus
	$(CP) $(WRKINST)/usr/lib/python2.7/site-packages/dbus/*.py \
		$(IDIR_DBUS_PYTHON)/usr/lib/python2.7/site-packages/dbus/
	$(INSTALL_DIR) $(IDIR_DBUS_PYTHON)/usr/lib/python2.7/site-packages/dbus/mainloop
	$(CP) $(WRKINST)/usr/lib/python2.7/site-packages/dbus/mainloop/*.py \
		$(IDIR_DBUS_PYTHON)/usr/lib/python2.7/site-packages/dbus/mainloop

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
