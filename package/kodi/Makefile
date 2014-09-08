# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		kodi
PKG_VERSION:=		14.0alpha4
PKG_RELEASE:=		1
PKG_MD5SUM:=		5bd39942150249d9eccf792d77b92554
PKG_DESCR:=		software media player
PKG_SECTION:=		mm/video
PKG_DEPENDS:=		boost python2 libstdcxx glibc-gconv
PKG_DEPENDS+=		libglew mesalib libass libmpeg2 libmad libdbus
PKG_DEPENDS+=		libjpeg-turbo libogg libvorbis libmodplug libcurl
PKG_DEPENDS+=		libflac libopenssl libbz2 libtiff liblzo
PKG_DEPENDS+=		yajl tinyxml libsqlite libpcrecpp libpng libncurses
PKG_DEPENDS+=		libpcre libcdio libfreetype libsamplerate
PKG_DEPENDS+=		taglib libjasper libmp3lame libmicrohttpd
PKG_DEPENDS+=		libgpg-error libudev python2-mod-sqlite
PKG_DEPENDS+=		libxslt libvorbisenc alsa-lib glib libglu librt
PKG_BUILDDEP:=		boost python2 mesalib libglew libass ffmpeg
PKG_BUILDDEP+=		libmpeg2 libmad libjpeg-turbo libogg libvorbis
PKG_BUILDDEP+=		curl flac openssl bzip2 libtiff liblzo yajl
PKG_BUILDDEP+=		tinyxml sqlite pcre libpng libcdio freetype 
PKG_BUILDDEP+=		libsamplerate taglib libjasper lame libmicrohttpd
PKG_BUILDDEP+=		eudev alsa-lib glib glu libmodplug
PKG_BUILDDEP+=		libgpg-error dbus libxslt libvorbis
PKG_BUILDDEP+=		swig-host sdl-host sdl-image-host liblzo-host
PKG_BUILDDEP+=		zip-host unzip-host
PKG_URL:=		http://xbmc.org/
PKG_SITES:=		http://www.openadk.org/distfiles/

PKG_FLAVOURS_KODI:=	WITH_SMB WITH_NFS WITH_SSH WITH_AVAHI WITH_CEC 
PKG_FLAVOURS_KODI+=	WITH_AFP WITH_WEBSERVER WITH_RTMP WITH_BLURAY

PKGFD_WITH_SMB:=	enable samba support
PKGFB_WITH_SMB:=	samba
PKGFS_WITH_SMB:=	samba-lib
PKGFD_WITH_NFS:=	enable nfs support
PKGFB_WITH_NFS:=	libnfs
PKGFS_WITH_NFS:=	libnfs
PKGFD_WITH_SSH:=	enable ssh support
PKGFB_WITH_SSH:=	libssh
PKGFS_WITH_SSH:=	libssh
PKGFD_WITH_AVAHI:=	enable avahi support
PKGFB_WITH_AVAHI:=	avahi
PKGFS_WITH_AVAHI:=	libavahi
PKGFD_WITH_CEC:=	enable cec support
PKGFB_WITH_CEC:=	libcec
PKGFS_WITH_CEC:=	libcec
PKGFD_WITH_AFP:=	enable afp support
PKGFB_WITH_AFP:=	afpfs-ng
PKGFS_WITH_AFP:=	libafpclient
PKGFD_WITH_RTMP:=	enable rtmp support
PKGFB_WITH_RTMP:=	rtmpdump
PKGFS_WITH_RTMP:=	librtmp
PKGFD_WITH_BLURAY:=	enable bluray support
PKGFB_WITH_BLURAY:=	libbluray
PKGFS_WITH_BLURAY:=	libbluray
PKGFD_WITH_WEBSERVER:=	enable internal webserver support

PKG_DEPENDS_RASPBERRY_PI:=	bcm2835-vc
PKG_BUILDDEP_RASPBERRY_PI:=	bcm2835-vc
PKG_DEPENDS_SOLIDRUN_IMX6:=	libfslvpuwrap gpu-viv-bin-mx6q
PKG_BUILDDEP_SOLIDRUN_IMX6:=	libfslvpuwrap gpu-viv-bin-mx6q
PKG_SYSTEM_DEPENDS:=	raspberry-pi solidrun-imx6

DIFF_IGNOREFILES:=	configure missing depcomp install-sh INSTALL \
			aclocal.m4 config.h.in

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,KODI,kodi,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

HOST_CXXFLAGS+=		$(HOST_CPPFLAGS)
XAKE_FLAGS+=		V=1 TIXML_USE_STL=1 GCC_HONOUR_COPTS=s
TARGET_CPPFLAGS+=	-I. -I./utils \
			-I$(STAGING_TARGET_DIR)/usr/include/afpfs-ng \
			-DTIXML_USE_STL=1 -DHAS_SIMPLEPM=1 -DLINUX

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
			--disable-rsxs \
			--disable-projectm \
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
			--enable-libvorbisenc \
			--enable-udev

ifneq ($(ADK_PACKAGE_XBMC_WITH_BLURAY),)
CONFIGURE_ARGS+=	--enable-libbluray
else
CONFIGURE_ARGS+=	--disable-libbluray
endif
ifneq ($(ADK_PACKAGE_XBMC_WITH_AFP),)
CONFIGURE_ARGS+=	--enable-afpclient
else
CONFIGURE_ARGS+=	--disable-afpclient
endif
ifneq ($(ADK_PACKAGE_XBMC_WITH_SMB),)
CONFIGURE_ARGS+=	--enable-samba
else
CONFIGURE_ARGS+=	--disable-samba
endif
ifneq ($(ADK_PACKAGE_XBMC_WITH_SSH),)
CONFIGURE_ARGS+=	--enable-ssh
else
CONFIGURE_ARGS+=	--disable-ssh
endif
ifneq ($(ADK_PACKAGE_XBMC_WITH_NFS),)
CONFIGURE_ARGS+=	--enable-nfs
else
CONFIGURE_ARGS+=	--disable-nfs
endif
ifneq ($(ADK_PACKAGE_XBMC_WITH_CEC),)
CONFIGURE_ARGS+=	--enable-libcec
else
CONFIGURE_ARGS+=	--disable-libcec
endif
ifneq ($(ADK_PACKAGE_XBMC_WITH_RTMP),)
CONFIGURE_ARGS+=	--enable-rtmp
else
CONFIGURE_ARGS+=	--disable-rtmp
endif
ifneq ($(ADK_PACKAGE_XBMC_WITH_AVAHI),)
CONFIGURE_ARGS+=	--enable-avahi
else
CONFIGURE_ARGS+=	--disable-avahi
endif
ifneq ($(ADK_PACKAGE_XBMC_WITH_WEBSERVER),)
CONFIGURE_ARGS+=	--enable-webserver
else
CONFIGURE_ARGS+=	--disable-webserver
endif

ifeq ($(ADK_TARGET_SYSTEM_RASPBERRY_PI),y)
CONFIGURE_ARGS+=	--with-platform=raspberry-pi \
			--enable-player=omxplayer \
			--enable-gles \
			--disable-sdl \
			--disable-x11
else
ifeq ($(ADK_TARGET_SYSTEM_SOLIDRUN_IMX6),y)
CONFIGURE_ARGS+=	--disable-x11 \
			--disable-sdl \
			--disable-gles \
			--enable-neon \
			--enable-codec=imxvpu
else
CONFIGURE_ARGS+=	--enable-x11 \
			--enable-sdl
endif
endif

pre-configure:
	(cd $(WRKBUILD)/lib/cpluff && env PATH=$(AUTOTOOL_PATH) ./autogen.sh)

pre-build:
	make CXX="${HOST_CXX}" CC="${HOST_CC}" CFLAGS="${HOST_CFLAGS}" \
		CXXFLAGS="${HOST_CXXFLAGS}" LDFLAGS="${HOST_LDFLAGS}" \
		 -C $(WRKBUILD)/tools/depends/native/JsonSchemaBuilder

kodi-install:
	$(INSTALL_DIR) $(IDIR_KODI)/usr/lib/xbmc/addons
	$(CP) $(WRKINST)/usr/lib/xbmc/* \
		$(IDIR_KODI)/usr/lib/xbmc
	$(INSTALL_DIR) $(IDIR_KODI)/usr/share/xbmc
	$(CP) $(WRKINST)/usr/share/xbmc/* \
		$(IDIR_KODI)/usr/share/xbmc
	$(INSTALL_DIR) $(IDIR_KODI)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/xbmc \
		$(IDIR_KODI)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
