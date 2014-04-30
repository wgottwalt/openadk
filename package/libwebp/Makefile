# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libwebp
PKG_VERSION:=		0.3.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		dc862bb4006d819b7587767a9e83d31f
PKG_DESCR:=		new image format for the web
PKG_SECTION:=		libs
PKG_URL:=		https://developers.google.com/speed/webp/
PKG_SITES:=		https://webp.googlecode.com/files/
PKG_OPTS:=		dev

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBWEBP,libwebp,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libwebp-install:
	$(INSTALL_DIR) $(IDIR_LIBWEBP)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libwebp*.so* \
		$(IDIR_LIBWEBP)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
