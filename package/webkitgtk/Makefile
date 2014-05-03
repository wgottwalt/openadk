# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		webkitgtk
PKG_VERSION:=		2.4.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		c759bf11fe4cadd1268630f16a97f7b9
PKG_DESCR:=		web browser engine
PKG_SECTION:=		libs
PKG_DEPENDS:=		glib icu4c zlib libwebp libgtk libsoup
PKG_DEPENDS+=		libsecret libxt
PKG_DEPENDS+=		gst-plugins-base gstreamer
PKG_BUILDDEP:=		glib icu4c zlib libwebp gtk+
PKG_BUILDDEP+=		libsoup libsecret libXt
PKG_BUILDDEP+=		gst-plugins-base gstreamer
PKG_URL:=		http://www.webkitgtk.org/
PKG_SITES:=		http://webkitgtk.org/releases/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,WEBKITGTK,webkitgtk,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

MAKE_FILE:=		GNUmakefile
CONFIGURE_ENV+=		AR_FLAGS="cr"
CONFIGURE_ARGS+=	--with-gtk=2.0 \
			--disable-webkit2 \
			--disable-geolocation

pre-build:
	mkdir -p $(WRKBUILD)/DerivedSources/{webkit,webkitdom,InjectedBundle,Platform}
	mkdir -p $(WRKBUILD)/DerivedSources/WebKit2/webkit2gtk/webkit2

webkitgtk-install:
	$(INSTALL_DIR) $(IDIR_WEBKITGTK)/usr/lib
	$(CP) $(WRKINST)/usr/lib/webkitgtk*.so* \
		$(IDIR_WEBKITGTK)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
