# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		pango
PKG_VERSION:=		1.40.0
PKG_EXTRAVER:=		1.40
PKG_RELEASE:=		1
PKG_HASH:=		da17985df314cb07d066ab5424f59c21ce973ece05b7de4df04d798ec8511c8b
PKG_DESCR:=		library for laying out and rendering of text
PKG_SECTION:=		libs/fonts
PKG_BUILDDEP:=		libXft glib cairo harfbuzz libstdcxx fontconfig
HOST_BUILDDEP:=		cairo-host harfbuzz-host
PKG_NEEDS:=		c++
PKG_URL:=		http://www.pango.org/
PKG_SITES:=		$(MASTER_SITE_GNOME:=pango/$(PKG_EXTRAVER)/)
PKG_OPTS:=		dev

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,PANGO,pango,$(PKG_VERSION)-$(PKG_RELEASE)))
$(eval $(call PKG_template,PANGO,pango,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

HOST_LDFLAGS+=		-lffi
HOST_STYLE:=		auto
AUTOTOOLS_STYLE:=	autoreconf
CONFIGURE_ARGS+=	--disable-man

pango-install:
	$(INSTALL_DIR) $(IDIR_PANGO)/etc/pango $(IDIR_PANGO)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libpango*.so* \
		$(IDIR_PANGO)/usr/lib

include $(ADK_TOPDIR)/mk/host-bottom.mk
include $(ADK_TOPDIR)/mk/pkg-bottom.mk
