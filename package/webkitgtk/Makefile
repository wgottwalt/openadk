# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		webkitgtk
PKG_VERSION:=		2.10.2
PKG_RELEASE:=		1
PKG_HASH:=		6adf497d24e36660037b84dfc1c53ac7f47bd4c459162290c49436eaa959a18f
PKG_DESCR:=		web browser engine
PKG_SECTION:=		libs/misc
PKG_DEPENDS:=		glib icu4c zlib libwebp libgtk3 libsoup
PKG_DEPENDS+=		libsecret libxt harfbuzz cairo
PKG_DEPENDS+=		gst-plugins-base gstreamer
PKG_BUILDDEP:=		glib icu4c zlib libwebp gtk3 cmake-host
PKG_BUILDDEP+=		libsoup libsecret libXt harfbuzz
PKG_BUILDDEP+=		gst-plugins-base gstreamer cairo enchant
PKG_URL:=		http://www.webkitgtk.org/
PKG_SITES:=		http://webkitgtk.org/releases/
PKG_OPTS:=		dev

PKG_CFLINE_WEBKITGTK:= 	depends on ADK_BROKEN
#PKG_CFLINE_WEBKITGTK:=	select ADK_PACKAGE_CAIRO_WITH_PDF@
#PKG_CFLINE_WEBKITGTK+=	select ADK_PACKAGE_CAIRO_WITH_PS@
#PKG_CFLINE_WEBKITGTK+=	select ADK_PACKAGE_CAIRO_WITH_SVG@

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,WEBKITGTK,webkitgtk,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

CONFIG_STYLE:=		cmake
CMAKE_FLAGS+=           -DPORT=GTK \
			-DENABLE_PLUGIN_PROCESS_GTK2=OFF \
			-DENABLE_GEOLOCATION=OFF \
			-DUSE_LIBHYPHEN=OFF \
			-DENABLE_INTROSPECTION=OFF

webkitgtk-install:
	$(INSTALL_DIR) $(IDIR_WEBKITGTK)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libjavascriptcoregtk*.so* \
		$(IDIR_WEBKITGTK)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libwebkitgtk*.so* \
		$(IDIR_WEBKITGTK)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
