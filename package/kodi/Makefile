# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		kodi
PKG_VERSION:=		17.3
PKG_RELEASE:=		1
PKG_HASH:=		1de8653a3729cefd1baaf09ecde5ace01a1e3a58fbf29d48c1363f2503d331a1
PKG_DESCR:=		software media player
PKG_SECTION:=		mm/video
PKG_DEPENDS:=		python2 libsquish libbluray libressl libxz
PKG_DEPENDS+=		libass libmpeg2 libmad libdbus libglew mesa libxshmfence
PKG_DEPENDS+=		libogg libvorbis libmodplug libcurl libxrandr
PKG_DEPENDS+=		libflac libbz2 libtiff libnettle librtmp
PKG_DEPENDS+=		yajl tinyxml libsqlite libpcrecpp libncurses
PKG_DEPENDS+=		libpcre libcdio libfreetype libsamplerate libuuid
PKG_DEPENDS+=		taglib libjasper libmp3lame libmicrohttpd libgtk2
PKG_DEPENDS+=		libgpg-error libudev python2-mod-sqlite libffmpeg
PKG_DEPENDS+=		libxslt libvorbisenc alsa-lib glib libglu libdcadec
PKG_BUILDDEP:=		python2 libass ffmpeg libglew rtmpdump xrandr
PKG_BUILDDEP+=		libmpeg2 libmad libjpeg-turbo libogg libvorbis
PKG_BUILDDEP+=		curl flac bzip2 libtiff yajl mesa cmake-host
PKG_BUILDDEP+=		tinyxml sqlite pcre libcdio freetype 
PKG_BUILDDEP+=		libsamplerate taglib libjasper lame libmicrohttpd
PKG_BUILDDEP+=		eudev alsa-lib glib glu libmodplug libgtk2
PKG_BUILDDEP+=		libgpg-error dbus libxslt libvorbis libbluray
PKG_BUILDDEP+=		swig-host liblzo-host libpng-host libjpeg-turbo-host
PKG_BUILDDEP+=		zip-host unzip-host giflib-host libsquish libdcadec
PKG_BUILDDEP+=		libcrossguid libressl libxshmfence xz bzip2 liblzo
PKG_NEEDS:=		threads c++
PKG_URL:=		http://kodi.tv/
PKG_SITES:=		https://github.com/xbmc/xbmc/archive/

DISTFILES:=		$(PKG_VERSION)-Krypton.tar.gz
WRKDIST=		${WRKDIR}/xbmc-$(PKG_VERSION)-Krypton
WRKSRC=			$(WRKDIR)/xbmc-$(PKG_VERSION)-Krypton/project/cmake

PKG_FLAVOURS_KODI:=	WITH_SMB WITH_NFS WITH_SSH WITH_AVAHI WITH_CEC 
PKG_FLAVOURS_KODI+=	WITH_WEBSERVER WITH_LIRC

PKGFD_WITH_SMB:=	enable samba4 support
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
PKGFD_WITH_LIRC:=	enable lirc support
PKGFB_WITH_LIRC:=	lirc
PKGFS_WITH_LIRC:=	lirc
PKGFD_WITH_WEBSERVER:=	enable internal webserver support

PKG_SYSTEM_DEPENDS:=	raspberry-pi raspberry-pi2 raspberry-pi3 solidrun-imx6

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,KODI,kodi,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

HOST_CXXFLAGS:=		-DTARGET_POSIX -DTARGET_LINUX -D_LINUX -I$(WRKBUILD)/../../xbmc/linux

CONFIG_STYLE:=		cmake
CMAKE_FLAGS+= 		-DENABLE_CCACHE=OFF \
			-DENABLE_DVDCSS=ON \
			-DENABLE_INTERNAL_CROSSGUID=OFF \
			-DENABLE_INTERNAL_FFMPEG=OFF \
			-DKODI_DEPENDSBUILD=OFF \
			-DENABLE_OPENSSL=ON \
			-DNATIVEPREFIX=$(STAGING_HOST_DIR)/usr \
			-DDEPENDS_PATH=$(STAGING_HOST_DIR) \
			-DWITH_TEXTUREPACKER=$(STAGING_HOST_DIR)/usr/bin/TexturePacker

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
