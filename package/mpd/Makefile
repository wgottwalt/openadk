# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		mpd
PKG_VERSION:=		0.14.2
PKG_RELEASE:=		3
PKG_MD5SUM:=		64177135f64aca555887ba378de8cdfb
PKG_DESCR:=		A music player for flac, mp3 and ogg
PKG_SECTION:=		net
PKG_DEPENDS:=		alsa-lib glib2 libcurl
PKG_URL:=		http://mpd.wikia.com/wiki/Music_Player_Daemon_Wiki
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=musicpd/}

include ${TOPDIR}/mk/package.mk

ifneq (${ADK_COMPILE_MPD_WITH_MP3},)
PKG_DEPENDS+=		libid3tag libmad
endif

ifneq (${ADK_COMPILE_MPD_WITH_MP4},)
PKG_DEPENDS+=		libfaad2
endif

ifeq (${ADK_COMPILE_MPD_WITH_OGG},y)
PKG_DEPENDS+=		libvorbis libogg
endif

ifneq (${ADK_COMPILE_MPD_WITH_TREMOR},)
PKG_DEPENDS+=		libvorbisidec
endif

ifneq (${ADK_COMPILE_MPD_WITH_FLAC},)
PKG_DEPENDS+=		libflac
endif

ifneq (${ADK_COMPILE_MPD_WITH_SHOUT},)
PKG_DEPENDS+=		libshout liblame
endif

$(eval $(call PKG_template,MPD,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto
XAKE_FLAGS+=		MPD_CFLAGS='-D_GNU_SOURCE'

CONFIGURE_ARGS+=	\
			--enable-alsa \
			--disable-mod \
			--disable-oss \
			--disable-audiofile \
			--disable-mpc \

ifneq (${ADK_COMPILE_MPD_WITH_MP3},)
CONFIGURE_ARGS+=	--enable-id3 --enable-mp3
else
CONFIGURE_ARGS+=	--disable-id3 --disable-mp3
endif

ifneq (${ADK_COMPILE_MPD_WITH_MP4},)
CONFIGURE_ARGS+=	--enable-aac
else
CONFIGURE_ARGS+=	--disable-aac
endif

ifeq (${ADK_COMPILE_MPD_WITH_OGG},y)
CONFIGURE_ARGS+=	--enable-oggvorbis 
else
CONFIGURE_ARGS+=	--disable-oggvorbis 
endif

ifneq (${ADK_COMPILE_MPD_WITH_TREMOR},)
CONFIGURE_ARGS+=	\
			--disable-oggvorbis \
			--with-tremor \
			--with-tremor-includes=${STAGING_DIR}/usr/include \
			--with-tremor-libraries=${STAGING_DIR}/usr/lib
endif

ifneq (${ADK_COMPILE_MPD_WITH_FLAC},)
CONFIGURE_ARGS+=	--enable-flac
else
CONFIGURE_ARGS+=	--disable-flac
endif

ifneq (${ADK_COMPILE_MPD_WITH_SHOUT},)
CONFIGURE_ARGS+=	--enable-shout-ogg \
			--enable-shout-mp3 \
			--enable-lame
else
CONFIGURE_ARGS+=	--disable-shout-ogg \
			--disable-shout-mp3 \
			--disable-lame
endif

post-install:
	${INSTALL_DIR} ${IDIR_MPD}/usr/bin ${IDIR_MPD}/etc
	${INSTALL_BIN} ${WRKINST}/usr/bin/mpd ${IDIR_MPD}/usr/bin
	${INSTALL_DATA} ./files/mpd.conf ${IDIR_MPD}/etc/mpd.conf

include ${TOPDIR}/mk/pkg-bottom.mk
