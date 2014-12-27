# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		gstreamer
PKG_VERSION:=		1.4.0
PKG_RELEASE:=		1
PKG_HASH:=		23c39fdc2b24f889b07cab0449825384fef7592a121e180729fd9025ec45c695
PKG_DESCR:=		opensource multimedia framework
PKG_SECTION:=		libs/video
PKG_BUILDDEP:=		glib
PKG_DEPENDS:=		glib
PKG_URL:=		http://gstreamer.freedesktop.org/
PKG_SITES:=		http://gstreamer.freedesktop.org/src/gstreamer/
PKG_OPTS:=		dev

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,GSTREAMER,gstreamer,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

gstreamer-install:
	$(INSTALL_DIR) $(IDIR_GSTREAMER)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libgstreamer*.so* \
		$(IDIR_GSTREAMER)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
