# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libjpeg-turbo
PKG_VERSION:=		1.3.1
PKG_RELEASE:=		1
PKG_HASH:=		c132907417ddc40ed552fe53d6b91d5fecbb14a356a60ddc7ea50d6be9666fb9
PKG_DESCR:=		jpeg image library
PKG_SECTION:=		libs/image
PKG_URL:=		http://libjpeg-turbo.virtualgl.org/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=libjpeg-turbo/}
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBJPEG_TURBO,libjpeg-turbo,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

ifeq ($(ADK_x32),y)
CONFIGURE_ARGS+=	--without-simd
endif

libjpeg-turbo-install:
	$(INSTALL_DIR) $(IDIR_LIBJPEG_TURBO)/usr/lib
	$(CP) $(WRKINST)/usr/lib/lib{turbo,}jpeg*.so* \
		$(IDIR_LIBJPEG_TURBO)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
