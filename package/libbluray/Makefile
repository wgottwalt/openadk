# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libbluray
PKG_VERSION:=		1.0.0
PKG_RELEASE:=		1
PKG_HASH:=		f7e3add335c7bbef45824fcd2249a9bf293868598c13f8479352c44ec95374cc
PKG_DESCR:=		bluray library
PKG_SECTION:=		libs/video
PKG_DEPENDS:=		libxml2 libfreetype fontconfig
PKG_BUILDDEP:=		libxml2 freetype fontconfig
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
