# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		webkitgtk
PKG_VERSION:=		2.4.3
PKG_RELEASE:=		1
PKG_HASH:=		9862c3eac1d12cc6e52cc39060a1284163950b304d534529a0dbcc5958a8ceac
PKG_DESCR:=		web browser engine
PKG_SECTION:=		libs/misc
PKG_DEPENDS:=		glib icu4c zlib libwebp libgtk libsoup
PKG_DEPENDS+=		libsecret libxt harfbuzz cairo
PKG_DEPENDS+=		gst-plugins-base gstreamer
PKG_BUILDDEP:=		glib icu4c zlib libwebp gtk+
PKG_BUILDDEP+=		libsoup libsecret libXt harfbuzz
PKG_BUILDDEP+=		gst-plugins-base gstreamer cairo
PKG_URL:=		http://www.webkitgtk.org/
PKG_SITES:=		http://webkitgtk.org/releases/
PKG_OPTS:=		dev

PKG_CFLINE_WEBKITGTK:=	depends on ADK_BROKEN

PKG_CFLINE_WEBKITGTK:=	select ADK_PACKAGE_CAIRO_WITH_PDF@
PKG_CFLINE_WEBKITGTK+=	select ADK_PACKAGE_CAIRO_WITH_PS@
PKG_CFLINE_WEBKITGTK+=	select ADK_PACKAGE_CAIRO_WITH_SVG@

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,WEBKITGTK,webkitgtk,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

MAKE_FILE:=		GNUmakefile
CONFIGURE_ENV+=		AR_FLAGS="cr"
CONFIGURE_ARGS+=	--with-gtk=2.0 \
			--disable-webkit2 \
			--disable-geolocation

pre-build:
	mkdir -p $(WRKBUILD)/DerivedSources/{webkit,webkitdom,InjectedBundle,Platform,ANGLE}
	mkdir -p $(WRKBUILD)/DerivedSources/WebKit2/webkit2gtk/webkit2

webkitgtk-install:
	$(INSTALL_DIR) $(IDIR_WEBKITGTK)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libjavascriptcoregtk*.so* \
		$(IDIR_WEBKITGTK)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libwebkitgtk*.so* \
		$(IDIR_WEBKITGTK)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
