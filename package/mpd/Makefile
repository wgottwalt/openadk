# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		mpd
PKG_VERSION:=		0.14.2
PKG_RELEASE:=		3
PKG_MD5SUM:=		64177135f64aca555887ba378de8cdfb
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=musicpd/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MPD,mpd,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto
XAKE_FLAGS+=		MPD_CFLAGS=''
PKG_DEPENDS:=		glib2 alsa-lib libcurl

CONFIGURE_ARGS+=	\
	--enable-alsa \
	--disable-mod \
	--disable-oss \
	--disable-audiofile \
	--disable-mpc \

ifneq (${ADK_COMPILE_MPD_WITH_MP3},)
PKG_DEPENDS+=		libid3tag libmad
CONFIGURE_ARGS+=	--enable-id3 --enable-mp3
else
CONFIGURE_ARGS+=	--disable-id3 --disable-mp3
endif

ifneq (${ADK_COMPILE_MPD_WITH_MP4},)
PKG_DEPENDS+=		libfaad2
CONFIGURE_ARGS+=	--enable-aac
else
CONFIGURE_ARGS+=	--disable-aac
endif

ifeq (${ADK_COMPILE_MPD_WITH_OGG},y)
PKG_DEPENDS+=		libvorbis libogg
CONFIGURE_ARGS+=	--enable-oggvorbis 
else
CONFIGURE_ARGS+=	--disable-oggvorbis 
endif

ifneq (${ADK_COMPILE_MPD_WITH_TREMOR},)
PKG_DEPENDS+=		libvorbisidec
CONFIGURE_ARGS+=	\
	--disable-oggvorbis \
	--with-tremor \
	--with-tremor-includes=${STAGING_DIR}/usr/include \
	--with-tremor-libraries=${STAGING_DIR}/usr/lib
endif

ifneq (${ADK_COMPILE_MPD_WITH_FLAC},)
PKG_DEPENDS+=		libflac
CONFIGURE_ARGS+=	--enable-flac
else
CONFIGURE_ARGS+=	--disable-flac
endif

ifneq (${ADK_COMPILE_MPD_WITH_SHOUT},)
PKG_DEPENDS+=		libshout liblame
CONFIGURE_ARGS+=	--enable-shout-ogg \
			--enable-shout-mp3 \
			--enable-lame
else
CONFIGURE_ARGS+=	--disable-shout-ogg \
			--disable-shout-mp3 \
			--disable-lame
endif

COMMA:=			,
EMPTY:=
SPACE:=			${EMPTY} ${EMPTY}
PKG_DEPENDS:=		${subst ${SPACE},${COMMA}${SPACE},${sort ${PKG_DEPENDS}}}


post-install:
	${INSTALL_DIR} ${IDIR_MPD}/usr/bin
	${INSTALL_DIR} ${IDIR_MPD}/etc/init.d
	${INSTALL_BIN} ${WRKINST}/usr/bin/mpd ${IDIR_MPD}/usr/bin
	${INSTALL_DATA} ./files/mpd.conf ${IDIR_MPD}/etc/mpd.conf
	${INSTALL_BIN} ./files/mpd.init \
	    ${IDIR_MPD}/etc/init.d/mpd
	echo "Depends: ${PKG_DEPENDS}" >> ${IDIR_MPD}/CONTROL/control

include ${TOPDIR}/mk/pkg-bottom.mk
