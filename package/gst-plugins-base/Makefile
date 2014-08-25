# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		gst-plugins-base
PKG_VERSION:=		1.4.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		1ff06280b03b9098a706d1290d8bb3bd
PKG_DESCR:=		gstreamer base plugins
PKG_SECTION:=		libs/video
PKG_DEPENDS:=		gstreamer
PKG_BUILDDEP:=		gstreamer libvorbis libtheora alsa-lib
PKG_URL:=		http://gstreamer.freedesktop.org/
PKG_SITES:=		http://gstreamer.freedesktop.org/src/gst-plugins-base/
PKG_OPTS:=		dev

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,GST_PLUGINS_BASE,gst-plugins-base,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

TARGET_CPPFLAGS+=	-D_GNU_SOURCE -D_POSIX_SOURCE
CONFIGURE_ARGS+=	--without-x

gst-plugins-base-install:
	$(INSTALL_DIR) $(IDIR_GST_PLUGINS_BASE)/usr/lib/gstreamer-1.0/
	$(CP) $(WRKINST)/usr/lib/gstreamer-1.0/*.so \
		$(IDIR_GST_PLUGINS_BASE)/usr/lib/gstreamer-1.0/
	$(CP) $(WRKINST)/usr/lib/libgst*.so* \
		$(IDIR_GST_PLUGINS_BASE)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
