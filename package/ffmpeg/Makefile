# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ffmpeg
PKG_VERSION:=		0.6
PKG_RELEASE:=		2
PKG_MD5SUM:=		d6142a9a5821d6a6262a6edb903faa24
PKG_DESCR:=		record, convert and stream audio & video
PKG_SECTION:=		libs
PKG_DEPENDS:=		libfaad2
PKG_BUILDDEP:=		faad2
PKG_URL:=		http://www.ffmpeg.org/
PKG_SITES:=		http://www.ffmpeg.org/releases/

PKG_SUBPKGS:=		FFMPEG FFPLAY
PKGSD_FFPLAY:=		ffmpeg based video player
PKGSC_FFPLAY:=		multimedia
PKGSS_FFPLAY:=		libsdl libpthread ffmpeg
PKGSB_FFPLAY:=		sdl

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,FFMPEG,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,FFPLAY,ffplay,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_FFPLAY},${PKGSD_FFPLAY},${PKGSC_FFPLAY}))

SUB_INSTALLS-y:=
SUB_INSTALLS-m:=
SUB_INSTALLS-${ADK_PACKAGE_FFPLAY}+=	ffplay-install

ifeq ($(ADK_TARGET),alix1c)
CONFIGURE_CPU_OPTS:=	--disable-ssse3 \
			--disable-sse \
			--enable-amd3dnow \
			--enable-amd3dnowext \
			--enable-mmx \
			--enable-mmx2
else
CONFIGURE_CPU_OPTS:=	--disable-ssse3 \
			--disable-sse \
			--disable-amd3dnow \
			--disable-amd3dnowext \
			--disable-mmx \
			--disable-mmx2
endif

# gcc 4.5 produces internal compiler error with -Os
#TCFLAGS:=$(subst Os,O2,$(TCFLAGS))

CONFIG_STYLE:=		minimal

CONFIGURE_ARGS:=	--prefix=/usr \
			--target-os=linux \
			--arch=${CPU_ARCH} \
			--enable-cross-compile \
			--sysroot=${STAGING_DIR} \
			--source-path=${WRKSRC} \
			--cross-prefix=${TARGET_CROSS} \
			--cc=$(TARGET_CC) \
			--host-cc=$(HOSTCC) \
			--disable-debug \
			--disable-optimizations \
			--disable-stripping \
			--enable-shared \
			--enable-static \
			--disable-ffmpeg \
			--disable-ffserver \
			--enable-ffplay \
			--enable-gpl \
			--enable-swscale \
			--enable-postproc \
			--enable-libfaad \
			${CONFIGURE_CPU_OPTS}

post-install: ${SUB_INSTALLS-m} ${SUB_INSTALLS-y}
	${INSTALL_DIR} ${IDIR_FFMPEG}/usr/lib
	${CP} ${WRKINST}/usr/lib/libavdevice.so* ${IDIR_FFMPEG}/usr/lib
	${CP} ${WRKINST}/usr/lib/libavformat.so* ${IDIR_FFMPEG}/usr/lib
	${CP} ${WRKINST}/usr/lib/libavcodec.so* ${IDIR_FFMPEG}/usr/lib
	${CP} ${WRKINST}/usr/lib/libavutil.so* ${IDIR_FFMPEG}/usr/lib
	${CP} ${WRKINST}/usr/lib/libpostproc.so* ${IDIR_FFMPEG}/usr/lib
	${CP} ${WRKINST}/usr/lib/libswscale.so* ${IDIR_FFMPEG}/usr/lib

ffplay-install:
	${INSTALL_DIR} ${IDIR_FFPLAY}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/ffplay ${IDIR_FFPLAY}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
