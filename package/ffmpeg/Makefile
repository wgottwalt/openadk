# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ffmpeg
PKG_VERSION:=		0.5
PKG_RELEASE:=		2
PKG_MD5SUM:=		be8503f15c3b81ba00eb8379ca8dcf33
PKG_DESCR:=		solution to record, convert and stream audio and video
PKG_SECTION:=		multimedia
PKG_DEPENDS:=		libfaad2
PKG_BUILDDEP+=		faad2
PKG_URL:=		http://www.ffmpeg.org
PKG_SITES:=		http://www.ffmpeg.org/releases/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,FFMPEG,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		minimal

include ${TOPDIR}/mk/cpu.mk

CONFIGURE_ARGS:=	--prefix=/usr \
			--arch=${CPU_ARCH} \
			--enable-cross-compile \
			--source-path=${WRKSRC} \
			--cross-prefix=${TARGET_CROSS} \
			--cc=$(TARGET_CC) \
			--host-cc=$(HOSTCC) \
			--disable-debug \
			--disable-stripping \
			--enable-small \
			--enable-shared \
			--enable-static \
			--disable-ffmpeg \
			--disable-ffplay \
			--disable-ffserver \
			--disable-vhook \
			--enable-gpl \
			--enable-swscale \
			--enable-postproc \
			--enable-libfaad \
			${CONFIGURE_CPU_OPTS}

post-install:
	${INSTALL_DIR} ${IDIR_FFMPEG}/usr/lib
	${CP} ${WRKINST}/usr/lib/libavformat.so* ${IDIR_FFMPEG}/usr/lib
	${CP} ${WRKINST}/usr/lib/libavcodec.so* ${IDIR_FFMPEG}/usr/lib
	${CP} ${WRKINST}/usr/lib/libavutil.so* ${IDIR_FFMPEG}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
