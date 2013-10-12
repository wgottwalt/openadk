# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libx264
# actually is snapshot x264-snapshot-20131010-2245
PKG_VERSION:=		1.0
PKG_RELEASE:=		2
PKG_MD5SUM:=		e6718029b4bc955f1dbb9bdafeed3ac0
PKG_DESCR:=		H264 encoding library
PKG_SECTION:=		libs
PKG_URL:=		http://www.videolan.org/developers/x264.html
PKG_SITES:=		http://openadk.org/distfiles/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBX264,libx264,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-cli

libx264-install:
	$(INSTALL_DIR) $(IDIR_LIBX264)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libx264*.so* \
		$(IDIR_LIBX264)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
