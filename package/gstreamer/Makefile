# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		gstreamer
PKG_VERSION:=		1.6.2
PKG_RELEASE:=		1
PKG_HASH:=		5896716bd8e089dba452932a2eff2bb6f6c9d58ff64a96635d157f1ffaf8feb2
PKG_DESCR:=		opensource multimedia framework
PKG_SECTION:=		libs/video
PKG_BUILDDEP:=		glib
PKG_DEPENDS:=		glib
PKG_URL:=		http://gstreamer.freedesktop.org/
PKG_SITES:=		http://gstreamer.freedesktop.org/src/gstreamer/
PKG_OPTS:=		dev

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,GSTREAMER,gstreamer,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-examples \
			--disable-tests \
			--disable-benchmarks \
			--disable-checks

gstreamer-install:
	$(INSTALL_DIR) $(IDIR_GSTREAMER)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libgstreamer*.so* \
		$(IDIR_GSTREAMER)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
