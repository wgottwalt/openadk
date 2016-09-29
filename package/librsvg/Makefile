# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		librsvg
PKG_VERSION:=		2.40.15
PKG_EXTRAVER:=		2.40
PKG_RELEASE:=		1
PKG_HASH:=		d9cac4a123eec6e553a26e120979bab7425def9ae7ce7c079eba5e4a45db05f4
PKG_DESCR:=		svg library
PKG_BUILDDEP:=		libcroco libgtk3
HOST_BUILDDEP:=		glib-host libcroco-host gdk-pixbuf-host pango-host
PKG_SECTION:=		libs/image
PKG_URL:=		https://wiki.gnome.org/action/show/Projects/LibRsvg?action=show&redirect=LibRsvg
PKG_SITES:=		http://ftp.gnome.org/pub/gnome/sources/librsvg/$(PKG_EXTRAVER)/

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,LIBRSVG,librsvg,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBRSVG,librsvg,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

HOST_STYLE:=		auto
HOST_LDFLAGS+=		-lffi -lgmodule-2.0
HOST_CONFIGURE_ARGS+=	--enable-introspection=no

CONFIGURE_ARGS+=	--enable-introspection=no

librsvg-install:
	$(INSTALL_DIR) $(IDIR_LIBRSVG)/usr/lib
	$(CP) $(WRKINST)/usr/lib/librsvg*.so* \
		$(IDIR_LIBRSVG)/usr/lib

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
