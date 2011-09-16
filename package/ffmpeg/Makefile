# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ffmpeg
PKG_VERSION:=		0.8.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		556870ccfd6c9c0426c7dd86dd5beb62
PKG_DESCR:=		record, convert and stream audio & video
PKG_SECTION:=		libs
PKG_URL:=		http://www.ffmpeg.org/
PKG_SITES:=		http://www.ffmpeg.org/releases/

PKG_ARCH_DEPENDS:=	!cris

PKG_SUBPKGS:=		LIBFFMPEG FFPLAY FFSERVER FFPROBE FFMPEG
PKGSD_FFPLAY:=		ffmpeg based video player
PKGSC_FFPLAY:=		multimedia
PKGSS_FFPLAY:=		libsdl libpthread ffmpeg
PKGSB_FFPLAY:=		sdl
PKGSD_FFMPEG:=		ffmpeg video converter
PKGSD_FFMPEG:=		multimedia
PKGSD_FFSERVER:=	streaming server
PKGSD_FFSERVER:=	multimedia
PKGSD_FFPROBE:=		simple multimedia stream analyzer
PKGSD_FFPROBE:=		multimedia

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBFFMPEG,libffmpeg,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,FFMPEG,ffmpeg,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_FFMPEG},${PKGSD_FFMPEG}))
$(eval $(call PKG_template,FFSERVER,ffserver,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_FFSERVER},${PKGSD_FFSERVER}))
$(eval $(call PKG_template,FFPROBE,ffprobe,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_FFPROBE},${PKGSD_FFPROBE}))
$(eval $(call PKG_template,FFPLAY,ffplay,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_FFPLAY},${PKGSD_FFPLAY},${PKGSC_FFPLAY}))

TARGET_CFLAGS:=         $(filter-out -flto,$(TARGET_CFLAGS))
TARGET_CFLAGS:=		$(subst Os,O2,$(TARGET_CFLAGS))

ifeq ($(ADK_TARGET_CPU_WITH_MMX),y)
CONFIGURE_CPU_OPTS:=	--enable-mmx
else
CONFIGURE_CPU_OPTS:=    --disable-mmx 
endif
ifeq ($(ADK_TARGET_CPU_WITH_MMXEXT),y)
CONFIGURE_CPU_OPTS:=	--enable-mmx2
else
CONFIGURE_CPU_OPTS:=    --disable-mmx2 
endif
ifeq ($(ADK_TARGET_CPU_WITH_SSE),y)
CONFIGURE_CPU_OPTS:=	--enable-sse
else
CONFIGURE_CPU_OPTS:=    --disable-sse 
endif

CONFIG_STYLE:=		minimal
CONFIGURE_ARGS:=	--prefix=/usr \
			--target-os=linux \
			--arch=${CPU_ARCH} \
			--enable-cross-compile \
			--sysroot=${STAGING_TARGET_DIR} \
			--cross-prefix=${TARGET_CROSS} \
			--cc='$(TARGET_CC)' \
			--host-cc=$(CC_FOR_BUILD) \
			--disable-doc \
			--disable-debug \
			--disable-optimizations \
			--disable-stripping \
			--enable-shared \
			--enable-static \
			--enable-gpl \
			--enable-swscale \
			--enable-postproc \
			${CONFIGURE_CPU_OPTS}

libffmpeg-install:
	${INSTALL_DIR} ${IDIR_LIBFFMPEG}/usr/lib
	${CP} ${WRKINST}/usr/lib/libavdevice.so* ${IDIR_LIBFFMPEG}/usr/lib
	${CP} ${WRKINST}/usr/lib/libavformat.so* ${IDIR_LIBFFMPEG}/usr/lib
	${CP} ${WRKINST}/usr/lib/libavfilter.so* ${IDIR_LIBFFMPEG}/usr/lib
	${CP} ${WRKINST}/usr/lib/libavcodec.so* ${IDIR_LIBFFMPEG}/usr/lib
	${CP} ${WRKINST}/usr/lib/libavutil.so* ${IDIR_LIBFFMPEG}/usr/lib
	${CP} ${WRKINST}/usr/lib/libpostproc.so* ${IDIR_LIBFFMPEG}/usr/lib
	${CP} ${WRKINST}/usr/lib/libswscale.so* ${IDIR_LIBFFMPEG}/usr/lib

ffplay-install:
	${INSTALL_DIR} ${IDIR_FFPLAY}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/ffplay ${IDIR_FFPLAY}/usr/bin

ffmpeg-install:
	${INSTALL_DIR} ${IDIR_FFMPEG}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/ffmpeg ${IDIR_FFMPEG}/usr/bin

ffserver-install:
	${INSTALL_DIR} ${IDIR_FFSERVER}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/ffserver ${IDIR_FFSERVER}/usr/bin

ffprobe-install:
	${INSTALL_DIR} ${IDIR_FFPROBE}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/ffprobe ${IDIR_FFPROBE}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
