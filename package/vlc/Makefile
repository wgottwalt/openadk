# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		vlc
PKG_VERSION:=		1.1.11
PKG_RELEASE:=		2
PKG_MD5SUM:=		a64846d6f21ea179ae8e8bfb6f9447fe
PKG_DESCR:=		Media Player
PKG_SECTION:=		multimedia
PKG_BUILDDEP:=		ffmpeg xcb-util libtheora libgcrypt
PKG_DEPENDS:=		libffmpeg xcb-util libtheora libgcrypt
PKG_URL:=		http://www.videolan.org/vlc/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=vlc/1.1.11/}

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,VLC,vlc,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-lua \
			--disable-dbus \
			--disable-a52 \
			--disable-fribidi \
			--disable-qt4 \
			--disable-skins2 \
			--disable-remoteosd \
			--disable-dvdnav \
			--disable-libxml2 \
			--enable-libgcrypt \
			--enable-theora

vlc-install:
	$(INSTALL_DIR) $(IDIR_VLC)/usr/bin
	$(INSTALL_DIR) $(IDIR_VLC)/usr/lib/vlc/plugins
	$(CP) $(WRKINST)/usr/lib/libvlc*.so* \
		$(IDIR_VLC)/usr/lib
	$(INSTALL_BIN) $(WRKINST)/usr/bin/{c,}vlc \
		$(IDIR_VLC)/usr/bin
	$(CP) $(WRKINST)/usr/lib/vlc/plugins/* \
		$(IDIR_VLC)/usr/lib/vlc/plugins
	-rm $(IDIR_VLC)/usr/lib/vlc/plugins/*/*.la
	-rm $(IDIR_VLC)/usr/lib/vlc/plugins/*/*.a

include ${TOPDIR}/mk/pkg-bottom.mk
