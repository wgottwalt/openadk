# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		gstreamer
PKG_VERSION:=		1.2.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		55d50f48a496799dbb0b195c9c6c6153
PKG_DESCR:=		opensource multimedia framework
PKG_SECTION:=		libs/video
PKG_URL:=		http://gstreamer.freedesktop.org/
PKG_SITES:=		http://gstreamer.freedesktop.org/src/gstreamer/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.xz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,GSTREAMER,gstreamer,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

gstreamer-install:
	$(INSTALL_DIR) $(IDIR_GSTREAMER)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libgstreamer*.so* \
		$(IDIR_GSTREAMER)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
