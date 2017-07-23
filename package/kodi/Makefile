# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		kodi
PKG_VERSION:=		17.3
PKG_RELEASE:=		1
PKG_HASH:=		1de8653a3729cefd1baaf09ecde5ace01a1e3a58fbf29d48c1363f2503d331a1
PKG_DESCR:=		software media player
PKG_SECTION:=		mm/video
PKG_DEPENDS:=		python2 libsquish libressl libxz
PKG_DEPENDS+=		libass libmpeg2 libmad
PKG_DEPENDS+=		libogg libvorbis libmodplug libcurl
PKG_DEPENDS+=		libflac libbz2 libtiff libnettle librtmp liblzo
PKG_DEPENDS+=		yajl tinyxml libsqlite libpcrecpp libncurses
PKG_DEPENDS+=		libpcre libcdio libfreetype libsamplerate libuuid
PKG_DEPENDS+=		taglib libjasper libmp3lame
PKG_DEPENDS+=		libgpg-error python2-mod-sqlite libffmpeg
PKG_DEPENDS+=		libvorbisenc alsa-lib glib libdcadec
PKG_BUILDDEP:=		python2 libass ffmpeg rtmpdump
PKG_BUILDDEP+=		libmpeg2 libmad libjpeg-turbo libogg libvorbis
PKG_BUILDDEP+=		curl flac bzip2 libtiff yajl cmake-host
PKG_BUILDDEP+=		tinyxml sqlite pcre libcdio freetype 
PKG_BUILDDEP+=		libsamplerate taglib libjasper lame
PKG_BUILDDEP+=		alsa-lib glib libmodplug
PKG_BUILDDEP+=		libgpg-error libvorbis
PKG_BUILDDEP+=		swig-host liblzo-host libpng-host libjpeg-turbo-host
PKG_BUILDDEP+=		zip-host unzip-host giflib-host libsquish libdcadec
PKG_BUILDDEP+=		libcrossguid libressl xz bzip2 liblzo
PKG_NEEDS:=		threads c++ iconv
PKG_URL:=		http://kodi.tv/
PKG_SITES:=		https://github.com/xbmc/xbmc/archive/

DISTFILES:=		$(PKG_VERSION)-Krypton.tar.gz
WRKDIST=		${WRKDIR}/xbmc-$(PKG_VERSION)-Krypton
WRKSRC=			$(WRKDIR)/xbmc-$(PKG_VERSION)-Krypton/project/cmake

PKG_SYSTEM_DEPENDS:=	raspberry-pi raspberry-pi2 raspberry-pi3

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,KODI,kodi,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

HOST_CXXFLAGS:=		-DTARGET_POSIX -DTARGET_LINUX -D_LINUX -I$(WRKBUILD)/../../xbmc/linux

CONFIG_STYLE:=		cmake
CMAKE_FLAGS+= 		-DENABLE_CCACHE=OFF \
			-DCMAKE_BUILD_TYPE=Debug \
			-DENABLE_DVDCSS=ON \
			-DENABLE_INTERNAL_CROSSGUID=OFF \
			-DENABLE_INTERNAL_FFMPEG=OFF \
			-DKODI_DEPENDSBUILD=OFF \
			-DENABLE_OPENSSL=ON \
			-DENABLE_MYSQLCLIENT=OFF \
			-DENABLE_NONFREE=OFF \
			-DENABLE_CAP=OFF \
			-DENABLE_XSLT=OFF \
			-DENABLE_BLUETOOTH=OFF \
			-DENABLE_BLURAY=OFF \
			-DENABLE_AIRTUNES=OFF \
			-DENABLE_SSH=OFF \
			-DENABLE_SMBCLIENT=OFF \
			-DENABLE_CEC=OFF \
			-DENABLE_AVAHI=OFF \
			-DENABLE_LCMS2=OFF \
			-DENABLE_LIRC=OFF \
			-DENABLE_UPNP=OFF \
			-DENABLE_OPTICAL=OFF \
			-DENABLE_PULSEAUDIO=OFF \
			-DENABLE_MICROHTTPD=OFF \
			-DENABLE_DBUS=OFF \
			-DENABLE_EVENTCLIENTS=OFF \
			-DENABLE_UDEV=OFF \
			-DENABLE_PLIST=OFF \
			-DNATIVEPREFIX=$(STAGING_HOST_DIR)/usr \
			-DDEPENDS_PATH=$(STAGING_HOST_DIR) \
			-DWITH_TEXTUREPACKER=$(STAGING_HOST_DIR)/usr/bin/TexturePacker

ifeq ($(ADK_TARGET_BOARD_BCM28XX),y)
CMAKE_FLAGS+=		-DCORE_SYSTEM_NAME=rbpi \
			-DWITH_ARCH=arm \
			-DWITH_CPU=arm \
			-DENABLE_OPENGL=OFF \
			-DENABLE_X11=OFF \
			-DENABLE_ALSA=ON \
			-DENABLE_OPENGLES=ON
else
CMAKE_FLAGS+=		-DCORE_SYSTEM_NAME=linux
endif

pre-configure:
	#(cd $(WRKBUILD)/lib/cpluff && env PATH='$(AUTOTOOL_PATH)' ./autogen.sh)
	(cd $(WRKBUILD)/../../tools/depends/native/JsonSchemaBuilder && PATH='$(HOST_PATH)' cmake .)
	PATH='$(HOST_PATH)' make -C $(WRKBUILD)/../../tools/depends/native/JsonSchemaBuilder
	cp $(WRKBUILD)/../../tools/depends/native/JsonSchemaBuilder/JsonSchemaBuilder \
		$(STAGING_HOST_DIR)/usr/bin
	(cd $(WRKBUILD)/../../tools/depends/native/TexturePacker && PATH='$(HOST_PATH)' \
		cmake -DCORE_SOURCE_DIR=$(WRKBUILD)/../.. \
			-DCMAKE_MODULE_PATH=$(WRKBUILD)/../../project/cmake/modules \
			-DCMAKE_CXX_FLAGS="$(HOST_CXXFLAGS)" .)
	PATH='$(HOST_PATH)' make -C $(WRKBUILD)/../../tools/depends/native/TexturePacker
	cp $(WRKBUILD)/../../tools/depends/native/TexturePacker/TexturePacker \
		$(STAGING_HOST_DIR)/usr/bin

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
