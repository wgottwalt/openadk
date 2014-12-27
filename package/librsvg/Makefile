# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		librsvg
PKG_VERSION:=		2.40.2
PKG_RELEASE:=		1
PKG_HASH:=		48049b643294636df7de1a4b997414d699666f5dc44776945c218a257d2a291c
PKG_DESCR:=		svg library
PKG_BUILDDEP:=		libcroco
HOST_BUILDDEP:=		libcroco-host gdk-pixbuf-host pango-host
PKG_SECTION:=		libs/image
PKG_URL:=		https://wiki.gnome.org/action/show/Projects/LibRsvg?action=show&redirect=LibRsvg
PKG_SITES:=		http://ftp.gnome.org/pub/gnome/sources/librsvg/2.40/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,LIBRSVG,librsvg,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBRSVG,librsvg,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

HOST_CONFIGURE_ARGS+=	--enable-introspection=no
CONFIGURE_ARGS+=	--enable-introspection=no

librsvg-install:
	$(INSTALL_DIR) $(IDIR_LIBRSVG)/usr/lib
	$(CP) $(WRKINST)/usr/lib/librsvg*.so* \
		$(IDIR_LIBRSVG)/usr/lib

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
