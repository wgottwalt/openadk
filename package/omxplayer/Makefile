# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		omxplayer
PKG_VERSION:=		c5ab80828159c64a283ff69d40748923648f8a0a
PKG_RELEASE:=		1
PKG_GIT:=		hash
PKG_DESCR:=		video player for raspberry pi
PKG_SECTION:=		mm/video
PKG_DEPENDS:=		libffmpeg bcm28xx-vc-libs bcm28xx-vc-gl-libs
PKG_DEPENDS+=		zlib libdbus boost libfreetype libpcre
PKG_BUILDDEP:=		ffmpeg boost bcm28xx-vc freetype pcre dbus
PKG_NEEDS:=		threads rt c++
PKG_URL:=		https://github.com/popcornmix/omxplayer
PKG_SITES:=		https://github.com/popcornmix/omxplayer.git

PKG_SYSTEM_DEPENDS:=	raspberry-pi raspberry-pi2

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
