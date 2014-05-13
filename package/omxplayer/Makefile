# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		omxplayer
# actually 46616c55c2fad3dac47d17e8a6b41a16a4d6f15e from 13.04.2014
PKG_VERSION:=		0.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		1c882539dfcbc4e8efeae85ff8069cbe
PKG_DESCR:=		video player for raspberry pi
PKG_SECTION:=		multimedia
PKG_DEPENDS:=		libffmpeg boost bcm2835-vc libfreetype libpcre
PKG_DEPENDS+=		librt zlib libpthread libstdcxx libdbus
PKG_BUILDDEP:=		ffmpeg boost bcm2835-vc freetype pcre dbus
PKG_URL:=		https://github.com/popcornmix/omxplayer
PKG_SITES:=		http://openadk.org/distfiles/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz

PKG_SYSTEM_DEPENDS:=	raspberry-pi
PKG_LIBC_DEPENDS:=      glibc musl

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,OMXPLAYER,omxplayer,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
INSTALL_STYLE:=		manual
TARGET_CPPFLAGS+=	-I$(STAGING_TARGET_DIR)/usr/include/boost-1_55 \
			-I$(STAGING_TARGET_DIR)/usr/include/freetype2 \
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

include ${TOPDIR}/mk/pkg-bottom.mk
