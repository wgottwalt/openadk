# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		mplayer
PKG_VERSION:=		1.0-31425
PKG_RELEASE:=		1
PKG_MD5SUM:=		e65b88e7a5c1c2f98c98e565357b9663
PKG_DESCR:=		popular video player
PKG_SECTION:=		video
PKG_DEPENDS:=		alsa-lib libjpeg libfaad2 libmad libncurses
PKG_DEPENDS+=		libogg libpng libpthread libvorbis
PKG_DEPENDS+=		libx11 libxau libxdmcp libxext libxv zlib 
PKG_BUILDDEP+=		alsa-lib libmad libvorbis faad2 ncurses zlib
PKG_BUILDDEP+=		libX11 libXv libpng libXext
PKG_URL:=		http://www.mplayerhq.hu
PKG_SITES:=		http://openadk.org/distfiles/

PKG_TARGET_DEPENDS:=	alix1c x86_qemu x86_64_qemu shuttle lemote

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MPLAYER,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual

FAKE_FLAGS+=		INSTALLSTRIP=''

ifeq (${ADK_LINUX_MIPS64_LEMOTE},y)
EXTRA_CFLAGS:=		-DARCH_MIPS64
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

pre-configure:
	(cd ${WRKBUILD}; rm -rf config.{cache,status} ; \
		./configure \
		--enable-x11 \
		--prefix=/usr \
		--confdir=/etc \
		--enable-cross-compile \
		--target=${ARCH}-linux \
		--cc=$(TARGET_CC) \
		--host-cc=$(HOSTCC) \
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
		--disable-xinerama \
		--disable-vidix \
		--disable-gl \
		--extra-cflags="${EXTRA_CFLAGS}" \
		${CONFIGURE_CPU_OPTS} \
		${CONFIGURE_DEBUG} \
	);
	
post-install:
	${INSTALL_DIR} ${IDIR_MPLAYER}/usr/bin
	${CP} ${WRKINST}/usr/bin/mplayer ${IDIR_MPLAYER}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
