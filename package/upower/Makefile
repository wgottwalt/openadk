# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		upower
PKG_VERSION:=		0.99.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		14f43bc13353e23e7280863f33ac50d2
PKG_DESCR:=		powermanagement
PKG_SECTION:=		misc
PKG_BUILDDEP:=		glib dbus-glib polkit eudev
PKG_DEPENDS:=		glib dbus-glib polkit libgudev
PKG_URL:=		http://upower.freedesktop.org/
PKG_SITES:=		http://upower.freedesktop.org/releases/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.xz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,UPOWER,upower,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--without-systemdutildir \
			--disable-rpath

upower-install:
	$(INSTALL_DIR) $(IDIR_UPOWER)/etc
	$(CP) $(WRKINST)/etc/* \
		$(IDIR_UPOWER)/etc
	$(INSTALL_DIR) $(IDIR_UPOWER)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libupower*.so* \
		$(IDIR_UPOWER)/usr/lib
	$(INSTALL_DIR) $(IDIR_UPOWER)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/libexec/upowerd \
		$(IDIR_UPOWER)/usr/sbin
	$(INSTALL_DIR) $(IDIR_UPOWER)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/upower \
		$(IDIR_UPOWER)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
