# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		kodi
PKG_VERSION:=		ff25ea118e3580bb1ebcbb7c450ed933da1782be
PKG_RELEASE:=		2
PKG_DESCR:=		software media player
PKG_SECTION:=		mm/video
PKG_DEPENDS:=		boost python2 libstdcxx glibc-gconv libsquish
PKG_DEPENDS+=		libass libmpeg2 libmad libdbus libglew mesa
PKG_DEPENDS+=		libjpeg-turbo libogg libvorbis libmodplug libcurl
PKG_DEPENDS+=		libflac libbz2 libtiff liblzo libopenssl libnettle
PKG_DEPENDS+=		yajl tinyxml libsqlite libpcrecpp libpng libncurses
PKG_DEPENDS+=		libpcre libcdio libfreetype libsamplerate libuuid
PKG_DEPENDS+=		taglib libjasper libmp3lame libmicrohttpd libgtk2
PKG_DEPENDS+=		libgpg-error libudev python2-mod-sqlite libffmpeg
PKG_DEPENDS+=		libxslt libvorbisenc alsa-lib glib libglu librt
PKG_BUILDDEP:=		boost python2 libass ffmpeg openssl libglew
PKG_BUILDDEP+=		libmpeg2 libmad libjpeg-turbo libogg libvorbis
PKG_BUILDDEP+=		curl flac bzip2 libtiff liblzo yajl mesa
PKG_BUILDDEP+=		tinyxml sqlite pcre libpng libcdio freetype 
PKG_BUILDDEP+=		libsamplerate taglib libjasper lame libmicrohttpd
PKG_BUILDDEP+=		eudev alsa-lib glib glu libmodplug libgtk2
PKG_BUILDDEP+=		libgpg-error dbus libxslt libvorbis
PKG_BUILDDEP+=		swig-host liblzo-host libpng-host libjpeg-turbo-host
PKG_BUILDDEP+=		zip-host unzip-host libsquish giflib-host
PKG_URL:=		http://kodi.tv/
PKG_SITES:=		https://github.com/xbmc/xbmc.git

PKG_FLAVOURS_KODI:=	WITH_SMB WITH_NFS WITH_SSH WITH_AVAHI WITH_CEC 
PKG_FLAVOURS_KODI+=	WITH_WEBSERVER WITH_RTMP WITH_BLURAY WITH_LIRC

PKGFD_WITH_SMB:=	enable samba support
PKGFB_WITH_SMB:=	samba
PKGFS_WITH_SMB:=	samba
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
PKGFD_WITH_RTMP:=	enable rtmp support
PKGFB_WITH_RTMP:=	rtmpdump
PKGFS_WITH_RTMP:=	librtmp
PKGFD_WITH_BLURAY:=	enable bluray support
PKGFB_WITH_BLURAY:=	libbluray
PKGFS_WITH_BLURAY:=	libbluray
PKGFD_WITH_LIRC:=	enable lirc support
PKGFB_WITH_LIRC:=	lirc
PKGFS_WITH_LIRC:=	lirc
PKGFD_WITH_WEBSERVER:=	enable internal webserver support

# libiconv missing, freescale GL libraries linked against glibc
PKG_LIBC_DEPENDS:=	glibc

PKG_DEPENDS_RASPBERRY_PI:=	bcm28xx-vc bcm28xx-vc-gl-libs bcm28xx-vc-libs
PKG_BUILDDEP_RASPBERRY_PI:=	bcm28xx-vc
PKG_DEPENDS_RASPBERRY_PI2:=	bcm28xx-vc bcm28xx-vc-gl-libs bcm28xx-vc-libs
PKG_BUILDDEP_RASPBERRY_PI2:=	bcm28xx-vc
PKG_DEPENDS_SOLIDRUN_IMX6:=	libfslvpuwrap imx-gpu-viv
PKG_BUILDDEP_SOLIDRUN_IMX6:=	libfslvpuwrap imx-gpu-viv
PKG_SYSTEM_DEPENDS:=	raspberry-pi raspberry-pi2 solidrun-imx6

DIFF_IGNOREFILES:=	configure missing depcomp install-sh INSTALL \
			aclocal.m4 config.h.in

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,KODI,kodi,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

HOST_CXXFLAGS+=		$(HOST_CPPFLAGS)
XAKE_FLAGS+=		V=1 TIXML_USE_STL=1 GCC_HONOUR_COPTS=s
TARGET_CPPFLAGS+=	-I. -I./utils \
			-I$(STAGING_TARGET_DIR)/usr/include/afpfs-ng \
			-DTIXML_USE_STL=1 -DLINUX

ifeq ($(ADK_TARGET_SYSTEM_RASPBERRY_PI),y)
TARGET_CPPFLAGS+=	-I$(STAGING_TARGET_DIR)/opt/vc/include \
			-I$(STAGING_TARGET_DIR)/opt/vc/include/interface/vcos/pthreads \
			-I$(STAGING_TARGET_DIR)/opt/vc/include/interface/vmcs_host/linux
TARGET_LDFLAGS+=	-L$(STAGING_TARGET_DIR)/opt/vc/lib
endif
ifeq ($(ADK_TARGET_SYSTEM_RASPBERRY_PI2),y)
TARGET_CPPFLAGS+=	-I$(STAGING_TARGET_DIR)/opt/vc/include \
			-I$(STAGING_TARGET_DIR)/opt/vc/include/interface/vcos/pthreads \
			-I$(STAGING_TARGET_DIR)/opt/vc/include/interface/vmcs_host/linux
TARGET_LDFLAGS+=	-L$(STAGING_TARGET_DIR)/opt/vc/lib
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
			--disable-gtest \
			--disable-ccache \
			--disable-wayland \
			--disable-pulse \
			--disable-mid \
			--disable-debug \
			--enable-alsa \
			--enable-texturepacker \
			--enable-udev \
			--with-ffmpeg=shared

ifneq ($(ADK_PACKAGE_KODI_WITH_BLURAY),)
CONFIGURE_ARGS+=	--enable-libbluray
else
CONFIGURE_ARGS+=	--disable-libbluray
endif
ifneq ($(ADK_PACKAGE_KODI_WITH_SMB),)
CONFIGURE_ARGS+=	--enable-samba
else
CONFIGURE_ARGS+=	--disable-samba
endif
ifneq ($(ADK_PACKAGE_KODI_WITH_SSH),)
CONFIGURE_ARGS+=	--enable-ssh
else
CONFIGURE_ARGS+=	--disable-ssh
endif
ifneq ($(ADK_PACKAGE_KODI_WITH_NFS),)
CONFIGURE_ARGS+=	--enable-nfs
else
CONFIGURE_ARGS+=	--disable-nfs
endif
ifneq ($(ADK_PACKAGE_KODI_WITH_CEC),)
CONFIGURE_ARGS+=	--enable-libcec
else
CONFIGURE_ARGS+=	--disable-libcec
endif
ifneq ($(ADK_PACKAGE_KODI_WITH_RTMP),)
CONFIGURE_ARGS+=	--enable-rtmp
else
CONFIGURE_ARGS+=	--disable-rtmp
endif
ifneq ($(ADK_PACKAGE_KODI_WITH_LIRC),)
CONFIGURE_ARGS+=	--enable-lirc
else
CONFIGURE_ARGS+=	--disable-lirc
endif
ifneq ($(ADK_PACKAGE_KODI_WITH_AVAHI),)
CONFIGURE_ARGS+=	--enable-avahi
else
CONFIGURE_ARGS+=	--disable-avahi
endif
ifneq ($(ADK_PACKAGE_KODI_WITH_WEBSERVER),)
CONFIGURE_ARGS+=	--enable-webserver
else
CONFIGURE_ARGS+=	--disable-webserver
endif

ifeq ($(ADK_TARGET_SYSTEM_RASPBERRY_PI),y)
CONFIGURE_ARGS+=	--with-platform=raspberry-pi \
			--enable-player=omxplayer \
			--enable-gles \
			--disable-x11
endif
ifeq ($(ADK_TARGET_SYSTEM_RASPBERRY_PI2),y)
CONFIGURE_ARGS+=	--with-platform=raspberry-pi \
			--enable-player=omxplayer \
			--enable-gles \
			--disable-x11
endif
ifeq ($(ADK_TARGET_SYSTEM_SOLIDRUN_IMX6),y)
CONFIGURE_ARGS+=	--disable-x11 \
			--enable-gles \
			--enable-codec=imxvpu
endif

pre-configure:
	(cd $(WRKBUILD)/lib/cpluff && env PATH='$(AUTOTOOL_PATH)' ./autogen.sh)
	PATH='$(HOST_PATH)' \
	make CXX="${HOST_CXX}" CC="${HOST_CC}" CFLAGS="${HOST_CFLAGS}" \
		CXXFLAGS="${HOST_CXXFLAGS}" LDFLAGS="${HOST_LDFLAGS}" \
		 -C $(WRKBUILD)/tools/depends/native/JsonSchemaBuilder
	PATH='$(HOST_PATH)' \
	make CXX="${HOST_CXX}" CC="${HOST_CC}" CFLAGS="${HOST_CFLAGS}" \
		CXXFLAGS="${HOST_CXXFLAGS}" LDFLAGS="${HOST_LDFLAGS}" \
		 -C $(WRKBUILD)/tools/depends/native/TexturePacker

kodi-install:
	$(INSTALL_DIR) $(IDIR_KODI)/usr/lib/kodi/addons
	$(CP) $(WRKINST)/usr/lib/kodi/* \
		$(IDIR_KODI)/usr/lib/kodi
	$(INSTALL_DIR) $(IDIR_KODI)/usr/share/kodi
	$(CP) $(WRKINST)/usr/share/kodi/* \
		$(IDIR_KODI)/usr/share/kodi
	$(INSTALL_DIR) $(IDIR_KODI)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/kodi-standalone \
		$(IDIR_KODI)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/kodi \
		$(IDIR_KODI)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
