# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		webkitgtk
PKG_VERSION:=		2.16.3
PKG_RELEASE:=		1
PKG_HASH:=		204e9131da0101b9bc8765716e70a897121af04b964d9827cd9f20816a77b512
PKG_DESCR:=		web browser engine
PKG_SECTION:=		libs/misc
PKG_DEPENDS:=		glib icu4c zlib libwebp libgtk3 libsoup
PKG_DEPENDS+=		libsecret libxt harfbuzz cairo
PKG_DEPENDS+=		gst-plugins-base gstreamer libnotify
PKG_BUILDDEP:=		glib icu4c zlib libwebp libgtk3 cmake-host
PKG_BUILDDEP+=		libsoup libsecret libXt harfbuzz libnotify
PKG_BUILDDEP+=		gst-plugins-base gstreamer cairo enchant
PKG_BUILDDEP+=		gnutls
PKG_URL:=		http://www.webkitgtk.org/
PKG_SITES:=		http://webkitgtk.org/releases/
PKG_OPTS:=		dev

PKG_ARCH_DEPENDS:=	!mips

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,WEBKITGTK,webkitgtk,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

WRKBUILD=               $(WRKDIR)/$(PKG_NAME)-obj
TARGET_CXXFLAGS+=	-D__STDC_LIMIT_MACROS -D__STDC_FORMAT_MACROS
XAKE_FLAGS+=		VERBOSE=1

CONFIG_STYLE:=		cmake
CMAKE_FLAGS+= 		-DPORT=GTK \
			-DENABLE_API_TESTS=OFF \
			-DENABLE_GTKDOC=OFF \
			-DENABLE_GEOLOCATION=OFF \
			-DENABLE_MINIBROWSER=ON \
			-DUSE_SYSTEM_MALLOC=ON \
			-DUSE_LIBNOTIFY=OFF \
			-DUSE_LIBHYPHEN=OFF \
			-DENABLE_INTROSPECTION=OFF

webkitgtk-install:
	$(INSTALL_DIR) $(IDIR_WEBKITGTK)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libjavascriptcoregtk*.so* \
		$(IDIR_WEBKITGTK)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libwebkit2gtk*.so* \
		$(IDIR_WEBKITGTK)/usr/lib
	$(CP) $(WRKINST)/usr/lib/webkit2gtk-4.0 \
		$(IDIR_WEBKITGTK)/usr/lib
	$(INSTALL_DIR) $(IDIR_WEBKITGTK)/usr/libexec
	$(CP) $(WRKINST)/usr/libexec/* \
		$(IDIR_WEBKITGTK)/usr/libexec

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
