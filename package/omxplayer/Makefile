# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		omxplayer
PKG_VERSION:=		0.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		bb0bcdf1de3aec56d3e0746b91915d90
PKG_DESCR:=		video player for raspberry pi
PKG_SECTION:=		multimedia
PKG_DEPENDS:=		libffmpeg boost bcm2835-vc libfreetype libpcre
PKG_DEPENDS+=		librt zlib libpthread libstdcxx libgcc
PKG_BUILDDEP:=		ffmpeg boost bcm2835-vc freetype pcre
PKG_URL:=		https://github.com/popcornmix/omxplayer
PKG_SITES:=		http://openadk.org/distfiles/

PKG_SYSTEM_DEPENDS:=	raspberry-pi

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,OMXPLAYER,omxplayer,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
INSTALL_STYLE:=		manual
TARGET_CPPFLAGS+=	-I$(STAGING_DIR)/usr/include/boost-1_54 \
			-I$(STAGING_DIR)/usr/include/freetype2 \
			-I$(STAGING_DIR)/opt/vc/include \
			-I$(STAGING_DIR)/opt/vc/include/interface/vcos/pthreads \
			-I$(STAGING_DIR)/opt/vc/include/interface/vmcs_host/linux
TARGET_LDFLAGS+=	-L$(STAGING_DIR)/opt/vc/lib

omxplayer-install:
	$(INSTALL_DIR) $(IDIR_OMXPLAYER)/usr/bin
	$(INSTALL_BIN) $(WRKSRC)/omxplayer{,.bin} \
		$(IDIR_OMXPLAYER)/usr/bin
	$(INSTALL_DIR) $(IDIR_OMXPLAYER)/usr/share/fonts/truetype/freefont/
	$(INSTALL_DATA) $(WRKSRC)/fonts/* \
		$(IDIR_OMXPLAYER)/usr/share/fonts/truetype/freefont/

include ${TOPDIR}/mk/pkg-bottom.mk
