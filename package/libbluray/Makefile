# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libbluray
PKG_VERSION:=		0.9.3
PKG_RELEASE:=		1
PKG_HASH:=		a6366614ec45484b51fe94fcd1975b3b8716f90f038a33b24d59978de3863ce0
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
