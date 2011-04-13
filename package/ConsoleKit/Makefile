# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		ConsoleKit
PKG_VERSION:=		0.4.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		b57eb18eae8c4d3631d5f4f030218a29
PKG_DESCR:=		a framework for defining and tracking users, login sessions and seats
PKG_SECTION:=		misc
PKG_BUILDDEP:=		dbus-glib
PKG_URL:=		http://www.freedesktop.org/wiki/Software/ConsoleKit
PKG_SITES:=		http://www.freedesktop.org/software/ConsoleKit/dist/

PKG_SUBPKGS:=		CONSOLEKIT CONSOLEKIT_DEV

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,CONSOLEKIT,consolekit,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,CONSOLEKIT_DEV,consolekit-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

consolekit-install:
	$(INSTALL_DIR) $(IDIR_CONSOLEKIT)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libck-connector.so* \
		$(IDIR_CONSOLEKIT)/usr/lib

consolekit-dev-install:
	$(INSTALL_DIR) $(IDIR_CONSOLEKIT_DEV)/usr/include
	$(CP) $(WRKINST)/usr/include/* \
		$(IDIR_CONSOLEKIT_DEV)/usr/include
	$(INSTALL_DIR) $(IDIR_CONSOLEKIT_DEV)/usr/lib/pkgconfig
	$(CP) $(WRKINST)/usr/lib/pkgconfig/*.pc \
		$(IDIR_CONSOLEKIT_DEV)/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
