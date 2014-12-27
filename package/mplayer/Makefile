# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		mplayer
PKG_VERSION:=		1.1.1
PKG_RELEASE:=		3
PKG_HASH:=		ce8fc7c3179e6a57eb3a58cb7d1604388756b8a61764cc93e095e7aff3798c76
PKG_DESCR:=		popular video player
PKG_SECTION:=		mm/video
PKG_DEPENDS:=		alsa-lib libjpeg-turbo libfaad2 libmad libncurses
PKG_DEPENDS+=		libogg libpng libpthread libvorbis giflib
PKG_DEPENDS+=		libx11 libxau libxdmcp libxext libxv zlib
PKG_DEPENDS+=		libxscrnsaver libtheora libxvid libvpx
PKG_BUILDDEP:=		alsa-lib libmad libvorbis faad2 ncurses zlib
PKG_BUILDDEP+=		libX11 libXv libpng libXext libjpeg-turbo libtheora
PKG_BUILDDEP+=		xvidcore libvpx gettext-tiny
PKG_URL:=		http://www.mplayerhq.hu/
PKG_SITES:=		http://www.mplayerhq.hu/MPlayer/releases/

PKG_BUILDDEP_IBM_X40:=	yasm-host

DISTFILES:=		MPlayer-$(PKG_VERSION).tar.xz
WRKDIST=		${WRKDIR}/MPlayer-${PKG_VERSION}

PKG_ARCH_DEPENDS:=	x86 x86_64 mips arm

PKG_FLAVOURS_MPLAYER:=	WITH_DIRECTFB
PKGFD_WITH_DIRECTFB:=	enable DirectFB video output support
PKGFS_WITH_DIRECTFB:=	directfb
PKGFB_WITH_DIRECTFB:=	DirectFB


include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MPLAYER,mplayer,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CC:=		${TARGET_COMPILER_PREFIX}gcc
XAKE_FLAGS+=		GCC_HONOUR_COPTS=s
TARGET_CFLAGS+=		-D_POSIX_SOURCE -D_GNU_SOURCE

CONFIG_STYLE:=		minimal
FAKE_FLAGS+=		INSTALLSTRIP=''

ifeq (${ADK_TARGET_SYSTEM_LEMOTE_YEELONG},y)
EXTRA_CFLAGS:=		-DARCH_MIPS64
endif

# Somehow this include path is missing here, although other
# applications build fine against DirectFB. There is also a
# related patch to allow configure to find out the DirectFB
# version number.
ifeq (${ADK_PACKAGE_MPLAYER_WITH_DIRECTFB},y)
TARGET_CPPFLAGS+=	-I${STAGING_TARGET_DIR}/usr/include/directfb
endif

ifeq (${ADK_TARGET_CPU_WITH_MMX},y)
CONFIGURE_CPU_OPTS:=	--enable-mmx
else
CONFIGURE_CPU_OPTS:=	--disable-mmx
endif
ifeq (${ADK_TARGET_CPU_WITH_MMXEXT},y)
CONFIGURE_CPU_OPTS+=	--enable-mmxext
else
CONFIGURE_CPU_OPTS+=	--disable-mmxext
endif
ifeq (${ADK_TARGET_CPU_WITH_SSE},y)
CONFIGURE_CPU_OPTS+=	--enable-sse
else
CONFIGURE_CPU_OPTS+=	--disable-sse
endif
ifeq (${ADK_TARGET_CPU_WITH_SSE2},y)
CONFIGURE_CPU_OPTS+=	--enable-sse2
else
CONFIGURE_CPU_OPTS+=	--disable-sse2
endif
#ifeq (${ADK_TARGET_CPU_WITH_IWMMXT},y)
#CONFIGURE_CPU_OPTS+=	--enable-iwmmxt
#else
#CONFIGURE_CPU_OPTS+=	--disable-iwmmxt
#endif

ifeq ($(ADK_DEBUG),y)
CONFIGURE_DEBUG=	--enable-debug
endif

ifeq (${ADK_PACKAGE_MPLAYER_WITH_DIRECTFB},y)
CONFIGURE_DIRECTFB=	--enable-directfb
else
CONFIGURE_DIRECTFB=	--disable-directfb
endif

ifeq ($(ADK_TARGET_SYSTEM_IBM_X40),y)
			--yasm=${STAGING_HOST_DIR}/usr/bin/yasm
else
			--yasm=''
endif

CONFIGURE_ARGS:=	--prefix=/usr \
			--enable-x11 \
			--confdir=/etc \
			--enable-cross-compile \
			--target=${ADK_TARGET_ARCH}-linux \
			--cc='$(TARGET_CC)' \
			--host-cc=$(CC_FOR_BUILD) \
			--enable-fbdev \
			--enable-alsa \
			--enable-tv \
			--enable-v4l2 \
			--enable-png \
			--enable-jpeg \
			--enable-mad \
			--enable-libvorbis \
			--enable-faac \
			--enable-theora \
			--enable-xvid \
			--enable-x264 \
			--enable-x264-lavc \
			--disable-mencoder \
			--disable-ossaudio \
			--disable-caca \
			--disable-vm \
			--disable-iconv \
			--disable-lirc \
			--disable-radio-v4l2 \
			--disable-speex \
			--disable-libdv \
			--disable-live \
			--disable-pvr \
			--disable-ftp \
			--disable-ivtv \
			--disable-dvdread-internal \
			--disable-libdvdcss-internal \
			--disable-freetype \
			--disable-mpg123 \
			--disable-tremor-internal \
			--disable-arts \
			--disable-esd \
			--disable-jack \
			--disable-openal \
			--disable-nas \
			--disable-sgiaudio \
			--disable-sunaudio \
			--disable-win32waveout \
			--disable-tga \
			--disable-pnm \
			--disable-md5sum \
			--disable-liblzo \
			--disable-sdl \
			--disable-xinerama \
			--disable-vidix \
			--disable-gl \
			--disable-ssse3 \
			--extra-cflags="${EXTRA_CFLAGS}" \
			${CONFIGURE_CPU_OPTS} \
			${CONFIGURE_DEBUG} \
			${CONFIGURE_DIRECTFB}

XAKE_FLAGS+=		AR="${TARGET_CROSS}ar" RANLIB="${TARGET_CROSS}ranlib"
TARGET_LDFLAGS+=	-lxvidcore -lX11 -lXext -lvorbis

mplayer-install:
	${INSTALL_DIR} ${IDIR_MPLAYER}/usr/bin
	${CP} ${WRKINST}/usr/bin/mplayer ${IDIR_MPLAYER}/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
