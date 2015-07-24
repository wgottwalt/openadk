# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libbluray
PKG_VERSION:=		0.8.1
PKG_RELEASE:=		1
PKG_HASH:=		cdbec680c5bbc2251de6ccd109cf5f798ea51db6fcb938df39283be1799efb8f
PKG_DESCR:=		bluray library
PKG_SECTION:=		libs/video
PKG_DEPENDS:=		libxml2 libfreetype
PKG_BUILDDEP:=		libxml2 freetype
PKG_URL:=		http://www.videolan.org/developers/libbluray.html
PKG_SITES:=		ftp://ftp.videolan.org/pub/videolan/libbluray/${PKG_VERSION}/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBBLURAY,libbluray,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-bdjava

libbluray-install:
	$(INSTALL_DIR) $(IDIR_LIBBLURAY)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libbluray*.so* \
		$(IDIR_LIBBLURAY)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
