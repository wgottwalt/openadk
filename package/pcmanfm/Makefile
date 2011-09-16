# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		pcmanfm
PKG_VERSION:=		0.9.9
PKG_RELEASE:=		1
PKG_MD5SUM:=		f31ed6defb600f7046a456220d8efa3a
PKG_DESCR:=		graphical file manager
PKG_SECTION:=		x11/lxde
PKG_BUILDDEP:=		libfm atk glib gtk+
PKG_DEPENDS:=		libfm libatk libxcomposite cairo libx11
PKG_DEPENDS+=		libxrender libgtk glib libxfixes fontconfig
PKG_DEPENDS+=		libintl pango menu-cache libfreetype libxext
PKG_DEPENDS+=		libxdamage gdk-pixbuf libpthread
PKG_URL:=		http://lxde.org/
PKG_SITES:=		http://sourceforge.net/projects/pcmanfm/files/PCManFM%20%2B%20Libfm%20%28tarball%20release%29/PCManFM/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,PCMANFM,pcmanfm,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CPPFLAGS_FOR_BUILD+=	$(shell pkg-config --cflags glib-2.0)
LDFLAGS_FOR_BUILD+=	$(shell pkg-config --libs glib-2.0) -L/usr/lib
CONFIGURE_ARGS+=	--disable-gtk-doc

pcmanfm-install:
	$(INSTALL_DIR) $(IDIR_PCMANFM)/etc/xdg/pcmanfm
	$(CP) $(WRKINST)/etc/xdg/pcmanfm/* \
		$(IDIR_PCMANFM)/etc/xdg/pcmanfm
	$(INSTALL_DIR) $(IDIR_PCMANFM)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/pcmanfm \
		$(IDIR_PCMANFM)/usr/bin
	$(INSTALL_DIR) $(IDIR_PCMANFM)/usr/share/pcmanfm/ui
	$(CP) $(WRKINST)/usr/share/pcmanfm/ui/* \
		$(IDIR_PCMANFM)/usr/share/pcmanfm/ui
	$(INSTALL_DIR) $(IDIR_PCMANFM)/usr/share/applications
	$(CP) $(WRKINST)/usr/share/applications/* \
		$(IDIR_PCMANFM)/usr/share/applications

include ${TOPDIR}/mk/pkg-bottom.mk
