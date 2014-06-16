# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		moc
PKG_VERSION:=		2.5.0-beta2
PKG_RELEASE:=		1
PKG_MD5SUM:=		da87b90b57934234589b63e347921458
PKG_DESCR:=		console music player
PKG_SECTION:=		mm/audio
PKG_DEPENDS:=		libmad libvorbis libcurl libflac
PKG_DEPENDS+=		libncurses libid3tag
PKG_BUILDDEP:=		ncurses libvorbis curl libmad flac
PKG_BUILDDEP+=		libid3tag db libtool
PKG_URL:=		http://moc.daper.net/
PKG_SITES:=		ftp://ftp.daper.net/pub/soft/moc/unstable/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MOC,moc,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CPPFLAGS+=	-D_GNU_SOURCE -D_POSIX_SOURCE
TARGET_LDFLAGS+=	-ltinfo
CONFIGURE_ARGS+=	--without-jack \
			--without-oss \
			--without-musepack \
			--without-speex \
			--without-ffmpeg \
			--without-sndfile

moc-install:
	${INSTALL_DIR} ${IDIR_MOC}/usr/bin
	${INSTALL_DIR} ${IDIR_MOC}/usr/lib/moc/decoder_plugins
	${CP} ${WRKINST}/usr/lib/moc/decoder_plugins/*.so \
		${IDIR_MOC}/usr/lib/moc/decoder_plugins
	${INSTALL_BIN} ${WRKINST}/usr/bin/mocp ${IDIR_MOC}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
