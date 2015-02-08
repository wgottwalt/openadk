# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		omxplayer
# actually git from 25.09.2014
PKG_VERSION:=		0.6
PKG_RELEASE:=		1
PKG_HASH:=		6b22523bbb949ef6b7905f9fe12da7757cdcae0d4970ff752a3cdb3d7340e66d
PKG_DESCR:=		video player for raspberry pi
PKG_SECTION:=		mm/video
PKG_DEPENDS:=		libffmpeg boost bcm2835-vc libfreetype libpcre
PKG_DEPENDS+=		librt zlib libpthread libstdcxx libdbus
PKG_BUILDDEP:=		ffmpeg boost bcm2835-vc freetype pcre dbus
PKG_URL:=		https://github.com/popcornmix/omxplayer
PKG_SITES:=		http://openadk.org/distfiles/

PKG_SYSTEM_DEPENDS:=	raspberry-pi raspberry-pi2
PKG_LIBC_DEPENDS:=      glibc musl

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,OMXPLAYER,omxplayer,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
INSTALL_STYLE:=		manual
TARGET_CPPFLAGS+=	-I$(STAGING_TARGET_DIR)/usr/include/freetype2 \
			-I$(STAGING_TARGET_DIR)/usr/include/dbus-1.0 \
			-I$(STAGING_TARGET_DIR)/opt/vc/include \
			-I$(STAGING_TARGET_DIR)/opt/vc/include/interface/vcos/pthreads \
			-I$(STAGING_TARGET_DIR)/opt/vc/include/interface/vmcs_host/linux
TARGET_LDFLAGS+=	-L$(STAGING_TARGET_DIR)/opt/vc/lib

omxplayer-install:
	$(INSTALL_DIR) $(IDIR_OMXPLAYER)/usr/bin
	$(INSTALL_BIN) $(WRKSRC)/omxplayer.bin \
		$(IDIR_OMXPLAYER)/usr/bin/omxplayer
	$(INSTALL_DIR) $(IDIR_OMXPLAYER)/usr/share/fonts/truetype/freefont/
	$(INSTALL_DATA) $(WRKSRC)/fonts/* \
		$(IDIR_OMXPLAYER)/usr/share/fonts/truetype/freefont/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
