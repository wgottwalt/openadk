# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		vala
PKG_VERSION:=		0.24.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		beddeff9c06d3c278988b237da0e7401
PKG_DESCR:=		compiler for the GObject type system
PKG_SECTION:=		lang
PKG_BUILDDEP:=		glib
HOST_BUILDDEP:=		glib-host
PKG_URL:=		https://wiki.gnome.org/Vala
PKG_SITES:=		http://download.gnome.org/sources/vala/0.24/

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,VALA,vala,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,VALA,vala,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

HOST_STYLE:=		auto

vala-install:
	$(INSTALL_DIR) $(IDIR_VALA)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/valac \
		$(IDIR_VALA)/usr/bin

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
