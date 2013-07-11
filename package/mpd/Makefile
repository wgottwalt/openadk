# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		mpd
PKG_VERSION:=		0.17.4
PKG_RELEASE:=		3
PKG_MD5SUM:=		ab408a61f49f215ce77ed0cf1deed6e1
PKG_DESCR:=		A music player daemon
PKG_SECTION:=		multimedia
PKG_DEPENDS:=		glib libstdcxx
PKG_FDEPENDS:=		glib libstdcxx
PKG_BUILDDEP:=		glib
PKG_URL:=		http://www.musicpd.org/
PKG_SITES:=		http://www.musicpd.org/download/mpd/0.17/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz

PKG_FLAVOURS_MPD:=	WITH_ALSA WITH_AO WITH_MP3 WITH_MP4 WITH_TREMOR
PKG_FLAVOURS_MPD+=	WITH_OGG WITH_FLAC WITH_WAV WITH_MMS WITH_FFMPEG
PKG_FLAVOURS_MPD+=	WITH_SHOUT WITH_CURL

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
PKGFD_WITH_TREMOR:=	enable fixpoint Vorbis/OGG support
PKGFS_WITH_TREMOR:=	libvorbisidec
PKGFB_WITH_TREMOR:=	libvorbisidec
ifeq ($(ADK_PACKAGE_MPD_WITH_TREMOR),y)
PKG_FDEPENDS+=		libvorbisidec
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
PKG_FDEPENDS+=		libshout liblame libvorbisenc
endif
PKGFD_WITH_CURL:=	enable CURL support
PKGFS_WITH_CURL:=	libcurl
PKGFB_WITH_CURL:=	curl
ifeq ($(ADK_PACKAGE_MPD_WITH_CURL),y)
PKG_FDEPENDS+=		libcurl
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MPD,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_FDEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CFLAGS+=		-std=gnu99
XAKE_FLAGS+=		MPD_CFLAGS='-D_GNU_SOURCE'
CONFIGURE_ENV+=		ac_cv_lib_nsl_gethostbyname=no
CONFIGURE_ARGS+=	--disable-httpd-output \
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
			--with-lame=${STAGING_TARGET_DIR}/usr \
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

post-install:
	${INSTALL_DIR} ${IDIR_MPD}/usr/bin ${IDIR_MPD}/etc
	${INSTALL_BIN} ${WRKINST}/usr/bin/mpd ${IDIR_MPD}/usr/bin
	${INSTALL_DATA} ./files/mpd.conf ${IDIR_MPD}/etc/mpd.conf

include ${TOPDIR}/mk/pkg-bottom.mk
