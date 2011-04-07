# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		vte
PKG_VERSION:=		0.27.5
PKG_EXTRAVER:=		0.27
PKG_RELEASE:=		1
PKG_MD5SUM:=		7155e90b78fb80f4ede9adf959931ef9
PKG_DESCR:=		an experimental terminal emulator widget 
PKG_SECTION:=		libs
PKG_BUILDDEP:=		ncurses
PKG_URL:=		http://www.gnome.org/
PKG_SITES:=		http://ftp.gnome.org/pub/GNOME/sources/vte/$(PKG_EXTRAVER)/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,VTE,vte,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

vte-install:
	$(INSTALL_DIR) $(IDIR_VTE)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libvte*.so* $(IDIR_VTE)/usr/lib
	$(INSTALL_DIR) $(IDIR_VTE)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/vte $(IDIR_VTE)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
