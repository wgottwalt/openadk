# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		openbox
PKG_VERSION:=		3.4.11.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		30e669134fa81df810fe7d1dc59cd931
PKG_DESCR:=		fast x11 window managaer
PKG_SECTION:=		x11/apps
PKG_BUILDDEP:=		glib libxml2 libX11 libXext pango
PKG_URL:=		http://openbox.org/
PKG_SITES:=		http://openbox.org/dist/openbox/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,OPENBOX,openbox,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

openbox-install:
	$(INSTALL_DIR) $(IDIR_OPENBOX)/etc/xdg/openbox
	$(CP) $(WRKINST)/etc/xdg/openbox/* \
		$(IDIR_OPENBOX)/etc/xdg/openbox
	$(INSTALL_DIR) $(IDIR_OPENBOX)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/openbox \
		$(IDIR_OPENBOX)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/obxprop \
		$(IDIR_OPENBOX)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/openbox-session \
		$(IDIR_OPENBOX)/usr/bin
	$(INSTALL_DIR) $(IDIR_OPENBOX)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libobrender.so* \
		$(IDIR_OPENBOX)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libobparser.so* \
		$(IDIR_OPENBOX)/usr/lib
	$(INSTALL_DIR) $(IDIR_OPENBOX)/usr/share/themes
	$(CP) $(WRKINST)/usr/share/themes/* \
		$(IDIR_OPENBOX)/usr/share/themes


include ${TOPDIR}/mk/pkg-bottom.mk
