# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		xbmc
PKG_VERSION:=		13.1
PKG_RELEASE:=		2
PKG_MD5SUM:=		9ce6b6ac89b6aa0b111a1acdf3606e06
PKG_DESCR:=		software media player
PKG_SECTION:=		mm/video
PKG_DEPENDS:=		boost python2 libstdcxx glibc-gconv
PKG_DEPENDS+=		libglew mesalib libass libmpeg2 libmad libdbus
PKG_DEPENDS+=		libjpeg-turbo libogg libvorbis libmodplug libcurl
PKG_DEPENDS+=		libflac libopenssl libbz2 libtiff liblzo
PKG_DEPENDS+=		yajl tinyxml libsqlite libpcrecpp libpng
PKG_DEPENDS+=		libpcre libcdio libfreetype libsamplerate
PKG_DEPENDS+=		taglib libjasper libmp3lame libmicrohttpd
PKG_DEPENDS+=		libbluray libgpg-error libudev python2-mod-sqlite
PKG_DEPENDS+=		libssh libcec libnfs librtmp samba-lib libncurses
PKG_DEPENDS+=		libxslt libvorbisenc alsa-lib glib libglu librt
PKG_BUILDDEP:=		boost python2 mesalib libglew libass
PKG_BUILDDEP+=		libmpeg2 libmad libjpeg-turbo libogg libvorbis libmodplug
PKG_BUILDDEP+=		curl flac openssl bzip2 libtiff liblzo yajl
PKG_BUILDDEP+=		tinyxml sqlite pcre libpng libcdio freetype 
PKG_BUILDDEP+=		libsamplerate taglib libjasper lame libmicrohttpd
PKG_BUILDDEP+=		libssh libcec libnfs samba rtmpdump eudev
PKG_BUILDDEP+=		libgpg-error libbluray dbus libxslt libvorbis
PKG_BUILDDEP+=		swig-host sdl-host sdl-image-host liblzo-host
PKG_BUILDDEP+=		zip-host unzip-host alsa-lib glib glu
PKG_URL:=		http://xbmc.org/
#PKG_SITES:=		http://mirrors.xbmc.org/releases/source/
PKG_SITES:=		http://openadk.org/distfiles/

PKG_DEPENDS_RASPBERRY_PI:=	bcm2835-vc
PKG_BUILDDEP_RASPBERRY_PI:=	bcm2835-vc
PKG_DEPENDS_IBM_X40:=	libsdl libsdl-image libxshmfence libx11 libxext libxt libsm libice
PKG_DEPENDS_VBOX_X86:=	libsdl libsdl-image libxshmfence libx11 libxext libxt libsm libice
PKG_BUILDDEP_IBM_X40:=	nasm-host sdl sdl-image
PKG_BUILDDEP_VBOX_X86:=	nasm-host sdl sdl-image
PKG_SYSTEM_DEPENDS:=	raspberry-pi ibm-x40 vbox-x86
PKG_LIBC_DEPENDS:=	glibc

DIFF_IGNOREFILES:=	configure missing depcomp install-sh INSTALL \
			aclocal.m4 config.h.in

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XBMC,xbmc,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

HOST_CXXFLAGS+=		$(HOST_CPPFLAGS)
XAKE_FLAGS+=		V=1 TIXML_USE_STL=1 GCC_HONOUR_COPTS=s
TARGET_CPPFLAGS+=	-I. -I./utils -I$(STAGING_TARGET_DIR)/usr/include/boost-1_55 \
			-DTIXML_USE_STL=1 -DHAS_SIMPLEPM=1

ifeq ($(ADK_TARGET_SYSTEM_RASPBERRY_PI),y)
TARGET_CPPFLAGS+=	-I$(STAGING_TARGET_DIR)/opt/vc/include \
			-I$(STAGING_TARGET_DIR)/opt/vc/include/interface/vcos/pthreads \
			-I$(STAGING_TARGET_DIR)/opt/vc/include/interface/vmcs_host/linux
TARGET_LDFLAGS+=	-L$(STAGING_TARGET_DIR)/opt/vc/lib -lkhrn_static
endif

AUTOTOOL_STYLE:=	autoreconf
CONFIGURE_ENV+=		DESTDIR='${WRKINST}' \
			TEXTUREPACKER_NATIVE_ROOT='$(STAGING_HOST_DIR)/usr'
CONFIGURE_ARGS+=	--disable-optical-drive \
			--disable-optimizations \
			--disable-mysql \
			--disable-avahi \
			--disable-rsxs \
			--disable-projectm \
			--disable-crystalhd \
			--disable-mdnsembedded \
			--disable-libusb \
			--disable-libcap \
			--disable-joystick \
			--disable-dvdcss \
			--disable-debug \
			--disable-gtest \
			--disable-ccache \
			--disable-wayland \
			--disable-pulse \
			--disable-mid \
			--enable-alsa \
			--enable-libmp3lame \
			--enable-libvorbisenc \
			--enable-samba \
			--enable-ssh \
			--enable-nfs \
			--enable-udev \
			--enable-libbluray \
			--enable-external-libraries \
			--enable-rtmp \
			--enable-libcec

ifeq ($(ADK_TARGET_SYSTEM_RASPBERRY_PI),y)
CONFIGURE_ARGS+=	--with-platform=raspberry-pi \
			--enable-player=omxplayer \
			--enable-gles \
			--disable-sdl \
			--disable-x11
else
CONFIGURE_ARGS+=	--enable-x11 \
			--enable-sdl
endif

pre-configure:
	(cd $(WRKBUILD)/lib/cpluff && env PATH=$(AUTOTOOL_PATH) ./autogen.sh)

xbmc-install:
	$(INSTALL_DIR) $(IDIR_XBMC)/usr/lib/xbmc
	$(CP) $(WRKINST)/usr/lib/xbmc/* \
		$(IDIR_XBMC)/usr/lib/xbmc
	$(INSTALL_DIR) $(IDIR_XBMC)/usr/share/xbmc
	$(CP) $(WRKINST)/usr/share/xbmc/* \
		$(IDIR_XBMC)/usr/share/xbmc
	$(INSTALL_DIR) $(IDIR_XBMC)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/xbmc \
		$(IDIR_XBMC)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
