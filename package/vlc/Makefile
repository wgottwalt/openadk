# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		vlc
PKG_VERSION:=		2.2.0
PKG_RELEASE:=		1
PKG_HASH:=		5e0a27e248c47da723a696420aca3a4dd15cc3ed8cc81618d3f1dc8661b25517
PKG_DESCR:=		popular media player
PKG_SECTION:=		mm/video
PKG_BUILDDEP:=		ffmpeg xcb-util libtheora libgcrypt libmad alsa-lib
PKG_DEPENDS:=		libffmpeg xcb-util libtheora libgcrypt alsa-lib
PKG_URL:=		http://www.videolan.org/vlc/
PKG_SITES:=		http://download.videolan.org/pub/videolan/vlc/$(PKG_VERSION)/

PKG_LIBC_DEPENDS:=	glibc musl

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,VLC,vlc,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CPPFLAGS+=	-D_DEFAULT_SOURCE
TARGET_CFLAGS+=		-fPIC
CONFIGURE_ENV+=		ac_cv_func_sched_getaffinity=no
CONFIGURE_ARGS+=	--disable-lua \
			--disable-dbus \
			--disable-a52 \
			--disable-fribidi \
			--disable-qt4 \
			--disable-skins2 \
			--disable-dvdnav \
			--disable-glx \
			--disable-libxml2 \
			--disable-smb \
			--disable-xcb \
			--without-kde-solid \
			--enable-libgcrypt \
			--enable-mad \
			--enable-theora \
			--disable-optimizations \
			--disable-static \
			--disable-avcodec

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
