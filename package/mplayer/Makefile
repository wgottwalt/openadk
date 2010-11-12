# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		mplayer
PKG_VERSION:=		1.0-31868
PKG_RELEASE:=		1
PKG_MD5SUM:=		9d5c2c1c927947b31afa6f42c11e8f23
PKG_DESCR:=		popular video player
PKG_SECTION:=		multimedia
PKG_DEPENDS:=		alsa-lib libjpeg libfaad2 libmad libncurses
PKG_DEPENDS+=		libogg libpng libpthread libvorbis
PKG_DEPENDS+=		libx11 libxau libxdmcp libxext libxv zlib
PKG_BUILDDEP:=		alsa-lib libmad libvorbis faad2 ncurses zlib
PKG_BUILDDEP+=		libX11 libXv libpng libXext
PKG_URL:=		http://www.mplayerhq.hu/
PKG_SITES:=		http://openadk.org/distfiles/

PKG_HOST_DEPENDS:=	!darwin
PKG_TARGET_DEPENDS:=	alix x86_qemu x86_64_qemu shuttle lemote

PKG_FLAVOURS:=		WITH_DIRECTFB
PKGFD_WITH_DIRECTFB:=	enable DirectFB video output support
PKGFS_WITH_DIRECTFB:=	directfb
PKGFB_WITH_DIRECTFB:=	DirectFB


include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MPLAYER,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

# gcc 4.5 produces internal compiler error with -Os
#TCFLAGS:=$(subst Os,O2,$(TCFLAGS))

CONFIG_STYLE:=		minimal

FAKE_FLAGS+=		INSTALLSTRIP=''

ifeq (${ADK_LINUX_MIPS64_LEMOTE},y)
EXTRA_CFLAGS:=		-DARCH_MIPS64
endif

# Somehow this include path is missing here, although other
# applications build fine against DirectFB. There is also a
# related patch to allow configure to find out the DirectFB
# version number.
ifeq (${ADK_PACKAGE_MPLAYER_WITH_DIRECTFB},y)
TCFLAGS+=		-I${STAGING_DIR}/usr/include/directfb
endif

ifeq (${ADK_LINUX_X86_ALIX1C},y)
CONFIGURE_CPU_OPTS:=	\
			--disable-ssse3 \
			--disable-sse2 \
			--disable-sse \
			--enable-mmxext \
			--enable-mmx \
			--enable-3dnowext \
			--enable-3dnow
else
CONFIGURE_CPU_OPTS:=	\
			--disable-ssse3 \
			--disable-sse2 \
			--disable-sse \
			--disable-mmxext \
			--disable-3dnowext \
			--disable-mmx \
			--disable-3dnow
endif

ifeq ($(ADK_DEBUG),y)
CONFIGURE_DEBUG=	--enable-debug
endif

ifeq (${ADK_PACKAGE_MPLAYER_WITH_DIRECTFB},y)
CONFIGURE_DIRECTFB=	--enable-directfb
else
CONFIGURE_DIRECTFB=	--disable-directfb
endif

CONFIGURE_ARGS:=	--prefix=/usr \
			--enable-x11 \
			--confdir=/etc \
			--enable-cross-compile \
			--target=${ARCH}-linux \
			--cc=$(TARGET_CC) \
			--host-cc=$(HOSTCC) \
			--yasm='' \
			--disable-mencoder \
			--enable-fbdev \
			--enable-alsa \
			--enable-tv \
			--enable-v4l2 \
			--enable-png \
			--enable-jpeg \
			--enable-mad \
			--disable-faad-internal \
			--enable-libvorbis \
			--disable-ossaudio \
			--disable-vm \
			--disable-iconv \
			--disable-lirc \
			--disable-radio-v4l2 \
			--disable-faac \
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
			--extra-cflags="${TCFLAGS} ${EXTRA_CFLAGS}" \
			${CONFIGURE_CPU_OPTS} \
			${CONFIGURE_DEBUG} \
			${CONFIGURE_DIRECTFB}

post-install:
	${INSTALL_DIR} ${IDIR_MPLAYER}/usr/bin
	${CP} ${WRKINST}/usr/bin/mplayer ${IDIR_MPLAYER}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
