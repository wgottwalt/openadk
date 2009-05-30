# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		mplayer
PKG_VERSION:=		1.0rc2
PKG_RELEASE:=		2
PKG_MD5SUM:=		7e27e535c2d267637df34898f1b91707
PKG_DESCR:=		popular video player
PKG_SECTION:=		video
PKG_DEPENDS:=		zlib libncurses libmad alsa-lib libvorbis libogg libfaad2 libpthread
PKG_URL:=		http://www.mplayerhq.hu
PKG_SITES:=		http://www7.mplayerhq.hu/MPlayer/releases/

DISTFILES:=             MPlayer-${PKG_VERSION}.tar.bz2
WRKDIST=		${WRKDIR}/MPlayer-${PKG_VERSION}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MPLAYER,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

pre-configure:
	(cd ${WRKBUILD}; rm -rf config.{cache,status} ; \
		./configure \
		--prefix=/usr \
		--confdir=/etc \
		--enable-cross-compile \
		--target=$(REAL_GNU_TARGET_NAME) \
		--cc=$(TARGET_CC) \
		--host-cc=$(HOSTCC) \
		--with-extraincdir=$(STAGING_DIR)/usr/include \
		--with-extralibdir=$(STAGING_DIR)/usr/lib \
		--disable-ssse3 \
		--disable-sse2 \
		--disable-sse \
		--enable-mmxext \
		--enable-3dnowext \
		--enable-mmx \
		--enable-3dnow \
		--disable-mencoder \
		--enable-fbdev \
		--enable-alsa \
		--enable-mad \
		--enable-faad-external \
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
		--disable-v4l2 \
		--disable-ivtv \
		--enable-vidix-internal \
		--disable-dvdread-internal \
		--disable-libdvdcss-internal \
		--disable-freetype \
		--disable-tremor-internal \
		--disable-arts \
		--disable-esd \
		--disable-polyp \
		--disable-jack \
		--disable-openal \
		--disable-nas \
		--disable-sgiaudio \
		--disable-sunaudio \
		--disable-win32waveout \
		--disable-tga \
		--disable-pnm \
		--disable-md5sum \
		--disable-x11 \
	);
	

post-install:
	${INSTALL_DIR} ${IDIR_MPLAYER}/usr/bin
	${CP} ${WRKINST}/usr/bin/mplayer ${IDIR_MPLAYER}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
