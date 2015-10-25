# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		pango
PKG_VERSION:=		1.38.1
PKG_EXTRAVER:=		1.38
PKG_RELEASE:=		1
PKG_HASH:=		1320569f6c6d75d6b66172b2d28e59c56ee864ee9df202b76799c4506a214eb7
PKG_DESCR:=		library for laying out and rendering of text
PKG_SECTION:=		libs/fonts
PKG_DEPENDS:=		libstdcxx
PKG_BUILDDEP:=		libXft glib cairo harfbuzz libstdcxx fontconfig
HOST_BUILDDEP:=		cairo-host harfbuzz-host
PKG_URL:=		http://www.pango.org/
PKG_SITES:=		$(MASTER_SITE_GNOME:=pango/$(PKG_EXTRAVER)/)
PKG_OPTS:=		dev

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,PANGO,pango,$(PKG_VERSION)-$(PKG_RELEASE)))
$(eval $(call PKG_template,PANGO,pango,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

AUTOTOOLS_STYLE:=	autoreconf
CONFIGURE_ENV+=		ac_cv_path_EGREP="grep -E"
CONFIGURE_ARGS+=	--disable-man

pango-install:
	$(INSTALL_DIR) $(IDIR_PANGO)/etc/pango $(IDIR_PANGO)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libpango*.so* \
		$(IDIR_PANGO)/usr/lib

include $(ADK_TOPDIR)/mk/host-bottom.mk
include $(ADK_TOPDIR)/mk/pkg-bottom.mk
