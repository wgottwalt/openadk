# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		mpd
PKG_VERSION:=		0.20.6
PKG_RELEASE:=		1
PKG_HASH:=		f4055e1189e5cc00e83706b2e0b5ead924ced0303e073d7802ee9f9a8eba4b47
PKG_DESCR:=		music player daemon
PKG_SECTION:=		mm/audio
PKG_DEPENDS:=		libmpdclient boost libncurses libexpat
PKG_BUILDDEP:=		libmpdclient boost ncurses expat
PKG_FDEPENDS:=		libmpdclient
PKG_NEEDS:=		threads c++
PKG_URL:=		http://www.musicpd.org/
PKG_SITES:=		http://www.musicpd.org/download/mpd/0.20/

PKG_FLAVOURS_MPD:=	WITH_ALSA WITH_AO WITH_MP3 WITH_MP4
PKG_FLAVOURS_MPD+=	WITH_OGG WITH_FLAC WITH_WAV WITH_MMS WITH_FFMPEG
PKG_FLAVOURS_MPD+=	WITH_SHOUT WITH_CURL WITH_SAMPLERATE WITH_HTTPD
PKG_FLAVOURS_MPD+=	WITH_SNDFILE WITH_OPUS WITH_PULSE WITH_AVAHI WITH_JACK

PKGFD_WITH_ALSA:=	enable ALSA output
PKGFS_WITH_ALSA:=	alsa-lib
PKGFB_WITH_ALSA:=	alsa-lib
ifeq ($(ADK_PACKAGE_MPD_WITH_ALSA),y)
PKG_FDEPENDS+=		alsa-lib
endif
PKGFD_WITH_AO:=		enable Libao/ESD output
PKGFS_WITH_AO:=		libao
PKGFB_WITH_AO:=		libao
ifeq ($(ADK_PACKAGE_MPD_WITH_AO),y)
PKG_FDEPENDS+=		libao
endif
PKGFD_WITH_JACK:=	enable JACK support
PKGFS_WITH_JACK:=	jack
PKGFB_WITH_JACK:=	jack
ifeq ($(ADK_PACKAGE_MPD_WITH_JACK),y)
PKG_FDEPENDS+=		jack
endif
PKGFD_WITH_MP3:=	enable MP3 support
PKGFS_WITH_MP3:=	libid3tag libmad
PKGFB_WITH_MP3:=	libid3tag libmad
ifeq ($(ADK_PACKAGE_MPD_WITH_MP3),y)
PKG_FDEPENDS+=		libid3tag libmad
endif
PKGFD_WITH_MP4:=	enable MP4 support
PKGFS_WITH_MP4:=	libfaad2
PKGFB_WITH_MP4:=	faad2
ifeq ($(ADK_PACKAGE_MPD_WITH_MP4),y)
PKG_FDEPENDS+=		libfaad2
endif
PKGFD_WITH_OGG:=	enable OGG support
PKGFS_WITH_OGG:=	libvorbis libogg
PKGFB_WITH_OGG:=	libvorbis libogg
ifeq ($(ADK_PACKAGE_MPD_WITH_OGG),y)
PKG_FDEPENDS+=		libvorbis libogg
endif
PKGFD_WITH_FLAC:=	enable FLAC support
PKGFS_WITH_FLAC:=	libflac
PKGFB_WITH_FLAC:=	flac
ifeq ($(ADK_PACKAGE_MPD_WITH_FLAC),y)
PKG_FDEPENDS+=		libflac
endif
PKGFD_WITH_WAV:=	enable WAVE support
PKGFS_WITH_WAV:=	libaudiofile
PKGFB_WITH_WAV:=	libaudiofile
ifeq ($(ADK_PACKAGE_MPD_WITH_WAV),y)
PKG_FDEPENDS+=		libaudiofile
endif
PKGFD_WITH_MMS:=	enable MMS support
PKGFS_WITH_MMS:=	libmms
PKGFB_WITH_MMS:=	libmms
ifeq ($(ADK_PACKAGE_MPD_WITH_MMS),y)
PKG_FDEPENDS+=		libmms
endif
PKGFD_WITH_FFMPEG:=	enable FFMPEG support
PKGFS_WITH_FFMPEG:=	libffmpeg
PKGFB_WITH_FFMPEG:=	ffmpeg
ifeq ($(ADK_PACKAGE_MPD_WITH_FFMPEG),y)
PKG_FDEPENDS+=		libffmpeg
endif
PKGFD_WITH_SHOUT:=	enable Shoutcast output support
PKGFS_WITH_SHOUT:=	libshout libmp3lame libvorbisenc
PKGFB_WITH_SHOUT:=	lame libvorbis libshout
ifeq ($(ADK_PACKAGE_MPD_WITH_SHOUT),y)
PKG_FDEPENDS+=		libshout libmp3lame libvorbisenc
endif
PKGFD_WITH_CURL:=	enable CURL support
PKGFS_WITH_CURL:=	libcurl
PKGFB_WITH_CURL:=	curl
ifeq ($(ADK_PACKAGE_MPD_WITH_CURL),y)
PKG_FDEPENDS+=		libcurl
endif

PKGFD_WITH_SAMPLERATE:=	enable samplerate support
PKGFS_WITH_SAMPLERATE:=	libsamplerate
PKGFB_WITH_SAMPLERATE:=	libsamplerate
ifeq ($(ADK_PACKAGE_MPD_WITH_SAMPLERATE),y)
PKG_FDEPENDS+=		libsamplerate
endif

PKGFD_WITH_OPUS:=	enable OPUS support
PKGFS_WITH_OPUS:=	libopus
PKGFB_WITH_OPUS:=	opus
ifeq ($(ADK_PACKAGE_MPD_WITH_OPUS),y)
PKG_FDEPENDS+=		libopus
endif

PKGFD_WITH_SNDFILE:=	enable sndfile support
PKGFS_WITH_SNDFILE:=	libsndfile
PKGFB_WITH_SNDFILE:=	libsndfile
ifeq ($(ADK_PACKAGE_MPD_WITH_SNDFILE),y)
PKG_FDEPENDS+=		libsndfile
endif

PKGFD_WITH_PULSE:=	enable pulse support
PKGFS_WITH_PULSE:=	pulseaudio
PKGFB_WITH_PULSE:=	pulseaudio
ifeq ($(ADK_PACKAGE_MPD_WITH_PULSE),y)
PKG_FDEPENDS+=		pulseaudio
endif

PKGFD_WITH_AVAHI:=	enable avahi/zeroconf support
PKGFS_WITH_AVAHI:=	libavahi libdbus
PKGFB_WITH_AVAHI:=	avahi
ifeq ($(ADK_PACKAGE_MPD_WITH_AVAHI),y)
PKG_FDEPENDS+=		libavahi
endif

PKGFD_WITH_HTTPD:=	enable http output

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MPD,mpd,${PKG_VERSION}-${PKG_RELEASE},${PKG_FDEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CPPFLAGS+=	-D_GNU_SOURCE -D_POSIX_SOURCE
TARGET_CFLAGS+=		-std=gnu99
CONFIGURE_ENV+=		ac_cv_lib_nsl_gethostbyname=no
CONFIGURE_ARGS+=	--disable-fifo \
			--disable-oss \
			--disable-icu \
			--disable-bzip2 \
			--disable-libwrap \
			--disable-smbclient \
			--disable-mpc \
			--disable-wavpack \
			--disable-modplug \
			--disable-sqlite \
			--disable-mpg123 \
			--disable-soundcloud \
			--enable-inotify \
			--enable-pipe-output

ifneq (${ADK_PACKAGE_MPD_WITH_JACK},)
CONFIGURE_ARGS+=	--enable-jack
else
CONFIGURE_ARGS+=	--disable-jack
endif

ifneq (${ADK_PACKAGE_MPD_WITH_SNDFILE},)
CONFIGURE_ARGS+=	--enable-sndfile
else
CONFIGURE_ARGS+=	--disable-sndfile
endif

ifneq (${ADK_PACKAGE_MPD_WITH_HTTPD},)
CONFIGURE_ARGS+=	--enable-httpd-output
else
CONFIGURE_ARGS+=	--disable-httpd-output
endif

ifneq (${ADK_PACKAGE_MPD_WITH_AVAHI},)
CONFIGURE_ARGS+=	--with-zeroconf=avahi
else
CONFIGURE_ARGS+=	--with-zeroconf=no
endif

ifneq (${ADK_PACKAGE_MPD_WITH_PULSE},)
CONFIGURE_ARGS+=	--enable-pulse
else
CONFIGURE_ARGS+=	--disable-pulse
endif

ifneq (${ADK_PACKAGE_MPD_WITH_ALSA},)
CONFIGURE_ARGS+=	--enable-alsa
else
CONFIGURE_ARGS+=	--disable-alsa
endif

ifneq (${ADK_PACKAGE_MPD_WITH_AO},)
CONFIGURE_ARGS+=	--enable-ao
else
CONFIGURE_ARGS+=	--disable-ao
endif

ifneq (${ADK_PACKAGE_MPD_WITH_MP3},)
CONFIGURE_ARGS+=	--enable-id3 --enable-mad
else
CONFIGURE_ARGS+=	--disable-id3 --disable-mad
endif

ifneq (${ADK_PACKAGE_MPD_WITH_MP4},)
CONFIGURE_ARGS+=	--enable-aac
else
CONFIGURE_ARGS+=	--disable-aac
endif

ifneq (${ADK_PACKAGE_MPD_WITH_OGG},)
CONFIGURE_ARGS+=	--enable-vorbis
else
CONFIGURE_ARGS+=	--disable-vorbis
endif

ifneq (${ADK_PACKAGE_MPD_WITH_TREMOR},)
CONFIGURE_ARGS+=	\
			--disable-vorbis \
			--with-tremor \
			--with-tremor-includes=${STAGING_TARGET_DIR}/usr/include \
			--with-tremor-libraries=${STAGING_TARGET_DIR}/usr/lib
endif

ifneq (${ADK_PACKAGE_MPD_WITH_FLAC},)
CONFIGURE_ARGS+=	--enable-flac
else
CONFIGURE_ARGS+=	--disable-flac
endif

ifneq (${ADK_PACKAGE_MPD_WITH_WAV},)
CONFIGURE_ARGS+=	--enable-audiofile
else
CONFIGURE_ARGS+=	--disable-audiofile
endif

ifneq (${ADK_PACKAGE_MPD_WITH_SHOUT},)
CONFIGURE_ARGS+=	--enable-shout \
			--enable-lame-encoder \
			--enable-vorbis-encoder
else
CONFIGURE_ARGS+=	--disable-shout \
			--disable-lame-encoder \
			--disable-vorbis-encoder
endif

ifneq (${ADK_PACKAGE_MPD_WITH_CURL},)
CONFIGURE_ARGS+=	--enable-curl
else
CONFIGURE_ARGS+=	--disable-curl
endif

ifneq (${ADK_PACKAGE_MPD_WITH_MMS},)
CONFIGURE_ARGS+=	--enable-mms
else
CONFIGURE_ARGS+=	--disable-mms
endif

ifneq (${ADK_PACKAGE_MPD_WITH_FFMPEG},)
CONFIGURE_ARGS+=	--enable-ffmpeg
else
CONFIGURE_ARGS+=	--disable-ffmpeg
endif

ifneq (${ADK_PACKAGE_MPD_WITH_SAMPLERATE},)
CONFIGURE_ARGS+=	--enable-lsr
else
CONFIGURE_ARGS+=	--disable-lsr
endif

ifneq (${ADK_PACKAGE_MPD_WITH_OPUS},)
CONFIGURE_ARGS+=	--enable-opus
else
CONFIGURE_ARGS+=	--disable-opus
endif

mpd-install:
	${INSTALL_DIR} ${IDIR_MPD}/etc
	${INSTALL_DIR} ${IDIR_MPD}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/mpd ${IDIR_MPD}/usr/bin
	${INSTALL_DATA} ./files/mpd.conf ${IDIR_MPD}/etc/mpd.conf

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
