# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		vlc
PKG_VERSION:=		2.2.1
PKG_RELEASE:=		1
PKG_HASH:=		543d9d7e378ec0fa1ee2e7f7f5acf8c456c7d0ecc32037171523197ef3cf1fcb
PKG_DESCR:=		popular media player
PKG_SECTION:=		mm/video
PKG_BUILDDEP:=		ffmpeg xcb-util libtheora libgcrypt libmad alsa-lib
PKG_DEPENDS:=		libpthread librt libffmpeg xcb-util libtheora libgcrypt alsa-lib
PKG_URL:=		http://www.videolan.org/vlc/
PKG_SITES:=		http://download.videolan.org/pub/videolan/vlc/$(PKG_VERSION)/

PKG_FLAVOURS_VLC:=	WITH_BLURAY WITH_OPUS WITH_SPEEX WITH_THEORA
PKGFD_WITH_BLURAY:=	enable bluray support
PKGFB_WITH_BLURAY:=	libbluray
PKGFS_WITH_BLURAY:=	libbluray
PKGFD_WITH_OPUS:=	enable opus support
PKGFB_WITH_OPUS:=	opus
PKGFS_WITH_OPUS:=	libopus
PKGFD_WITH_SPEEX:=	enable speex support
PKGFB_WITH_SPEEX:=	speex
PKGFS_WITH_SPEEX:=	libspeex
PKGFD_WITH_THEORA:=	enable theora support
PKGFB_WITH_THEORA:=	libtheora
PKGFS_WITH_THEORA:=	libtheora

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,VLC,vlc,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CPPFLAGS+=	-D_DEFAULT_SOURCE
TARGET_CFLAGS+=		-fPIC
CONFIGURE_ENV+=		ac_cv_func_sched_getaffinity=no
CONFIGURE_ARGS+=	--disable-lua \
			--disable-dbus \
			--disable-a52 \
			--disable-fribidi \
			--disable-skins2 \
			--disable-dvdnav \
			--disable-libxml2 \
			--disable-xcb \
			--without-kde-solid \
			--enable-libgcrypt \
			--enable-mad \
			--disable-optimizations \
			--disable-static \
			--disable-avcodec

ifeq ($(ADK_TARGET_ARCH_ARM_WITH_NEON),)
CONFIGURE_ARGS+=	--disable-neon
endif

ifneq ($(ADK_PACKAGE_VLC_WITH_BLURAY),)
CONFIGURE_ARGS+=	--enable-libbluray
else
CONFIGURE_ARGS+=	--disable-libbluray
endif
ifneq ($(ADK_PACKAGE_VLC_WITH_OPUS),)
CONFIGURE_ARGS+=	--enable-opus
else
CONFIGURE_ARGS+=	--disable-opus
endif
ifneq ($(ADK_PACKAGE_VLC_WITH_SPEEX),)
CONFIGURE_ARGS+=	--enable-speex
else
CONFIGURE_ARGS+=	--disable-speex
endif
ifneq ($(ADK_PACKAGE_VLC_WITH_THEORA),)
CONFIGURE_ARGS+=	--enable-theora
else
CONFIGURE_ARGS+=	--disable-theora
endif

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

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
