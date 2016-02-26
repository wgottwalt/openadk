# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libbluray
PKG_VERSION:=		0.9.2
PKG_RELEASE:=		1
PKG_HASH:=		efc994f42d2bce6af2ce69d05ba89dbbd88bcec7aca065de094fb3a7880ce7ea
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
