# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		mpd
PKG_VERSION:=		0.15.8
PKG_RELEASE:=		2
PKG_MD5SUM:=		6680970274c389fd07e2b35721de1764
PKG_DESCR:=		A music player daemon
PKG_SECTION:=		net
PKG_DEPENDS:=		glib libstdcxx
PKG_BUILDDEP+=		glib
ifneq ($(ADK_PACKAGE_MPD_WITH_ALSA),)
PKG_DEPENDS+=		alsa-lib
PKG_BUILDDEP+=		alsa-lib
endif
ifneq ($(ADK_PACKAGE_MPD_WITH_MP3),)
PKG_DEPENDS+=		libid3tag libmad
PKG_BUILDDEP+=		libid3tag libmad
endif
ifneq ($(ADK_PACKAGE_MPD_WITH_MP4),)
PKG_DEPENDS+=		libfaad2
PKG_BUILDDEP+=		faad2
endif
ifneq ($(ADK_PACKAGE_MPD_WITH_OGG),)
PKG_DEPENDS+=		libvorbis libogg
PKG_BUILDDEP+=		libvorbis
endif
ifneq ($(ADK_PACKAGE_MPD_WITH_TREMOR),)
PKG_DEPENDS+=		libvorbisidec
PKG_BUILDDEP+=		libvorbisidec
endif
ifneq ($(ADK_PACKAGE_MPD_WITH_FLAC),)
PKG_DEPENDS+=		libflac
PKG_BUILDDEP+=		flac
endif
ifneq ($(ADK_PACKAGE_MPD_WITH_WAV),)
PKG_DEPENDS+=		libaudiofile
PKG_BUILDDEP+=		libaudiofile
endif
ifneq ($(ADK_PACKAGE_MPD_WITH_SHOUT),)
PKG_DEPENDS+=		libshout liblame libvorbis
PKG_BUILDDEP+=		lame libvorbis libshout
endif
ifneq ($(ADK_PACKAGE_MPD_WITH_CURL),)
PKG_DEPENDS+=		libcurl
PKG_BUILDDEP+=		curl
endif
ifneq ($(ADK_PACKAGE_MPD_WITH_MMS),)
PKG_DEPENDS+=		libmms
PKG_BUILDDEP+=		libmms
endif
ifneq ($(ADK_PACKAGE_MPD_WITH_FFMPEG),)
PKG_DEPENDS+=		ffmpeg
PKG_BUILDDEP+=		ffmpeg
endif
PKG_URL:=		http://mpd.wikia.com/wiki/Music_Player_Daemon_Wiki
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=musicpd/}

PKG_FLAVOURS:=		WITH_ALSA WITH_MP3 WITH_MP4 WITH_TREMOR \
			WITH_OGG WITH_FLAC WITH_WAV WITH_MMS WITH_FFMPEG \
			WITH_SHOUT WITH_CURL
PKGFD_WITH_ALSA:=	enable ALSA output
PKGFD_WITH_MP3:=	enable MP3 support
PKGFD_WITH_MP4:=	enable MP4 support
PKGFD_WITH_OGG:=	enable OGG support
PKGFD_WITH_TREMOR:=	enable fixpoint Vorbis/OGG support
PKGFD_WITH_FLAC:=	enable FLAC support
PKGFD_WITH_WAV:=	enable WAVE support
PKGFD_WITH_MMS:=	enable MMS support
PKGFD_WITH_FFMPEG:=	enable FFMPEG support
PKGFD_WITH_SHOUT:=	enable Shoutcast output support
PKGFD_WITH_CURL:=	enable CURL support

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MPD,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TCFLAGS+=		-std=gnu99
XAKE_FLAGS+=		MPD_CFLAGS='-D_GNU_SOURCE'
CONFIGURE_ARGS+=	--disable-httpd-output \
			--disable-ao \
			--disable-jack \
			--disable-fifo \
			--disable-pulse \
			--disable-oss \
			--disable-mpc \
			--disable-wavpack \
			--disable-sqlite \
			--with-zeroconf=no

ifneq (${ADK_PACKAGE_MPD_WITH_ALSA},)
CONFIGURE_ARGS+=	--enable-alsa
else
CONFIGURE_ARGS+=	--disable-alsa
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
			--with-tremor-includes=${STAGING_DIR}/usr/include \
			--with-tremor-libraries=${STAGING_DIR}/usr/lib
endif

ifneq (${ADK_PACKAGE_MPD_WITH_FLAC},)
CONFIGURE_ARGS+=	--enable-flac --enable-oggflac
else
CONFIGURE_ARGS+=	--disable-flac --disable-oggflac
endif

ifneq (${ADK_PACKAGE_MPD_WITH_WAV},)
CONFIGURE_ARGS+=	--enable-audiofile
else
CONFIGURE_ARGS+=	--disable-audiofile
endif

ifneq (${ADK_PACKAGE_MPD_WITH_SHOUT},)
CONFIGURE_ARGS+=	--enable-shout \
			--enable-lame-encoder \
			--enable-vorbis-encoder \
			--with-lame-includes=${STAGING_DIR}/usr/include \
			--with-lame-libraries=${STAGING_DIR}/usr/lib
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

post-install:
	${INSTALL_DIR} ${IDIR_MPD}/usr/bin ${IDIR_MPD}/etc
	${INSTALL_BIN} ${WRKINST}/usr/bin/mpd ${IDIR_MPD}/usr/bin
	${INSTALL_DATA} ./files/mpd.conf ${IDIR_MPD}/etc/mpd.conf

include ${TOPDIR}/mk/pkg-bottom.mk
