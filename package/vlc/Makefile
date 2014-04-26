# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		vlc
PKG_VERSION:=		2.1.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		7ed67d22f7425011078772bfc62ac222
PKG_DESCR:=		popular media player
PKG_SECTION:=		multimedia
PKG_BUILDDEP:=		ffmpeg xcb-util libtheora libgcrypt libmad
PKG_DEPENDS:=		libffmpeg xcb-util libtheora libgcrypt
PKG_URL:=		http://www.videolan.org/vlc/
PKG_SITES:=		http://download.videolan.org/pub/videolan/vlc/$(PKG_VERSION)/

PKG_ARCH_DEPENDS:=	!m68k
PKG_LIBC_DEPENDS:=	glibc musl

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,VLC,vlc,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CPPFLAGS+=	-D_GNU_SOURCE -D_POSIX_SOURCE
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

include ${TOPDIR}/mk/pkg-bottom.mk
