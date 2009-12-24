# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		moc
PKG_VERSION:=		2.4.4
PKG_RELEASE:=		1
PKG_BUILDDEP+=		libvorbis curl libmad flac ffmpeg
PKG_MD5SUM:=		647c770a5542a4ae5437386807a89796
PKG_DESCR:=		console music player
PKG_SECTION:=		sound
PKG_DEPENDS:=		libmad libvorbis libcurl libflac ffmpeg
PKG_URL:=		http://moc.daper.net
PKG_SITES:=		ftp://ftp.daper.net/pub/soft/moc/stable/
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MOC,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--without-jack \
			--without-oss \
			--without-musepack \
			--without-speex \
			--without-sndfile
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_MOC}/usr/bin
	${INSTALL_DIR} ${IDIR_MOC}/usr/lib/moc/decoder_plugins
	${CP} ${WRKINST}/usr/lib/moc/decoder_plugins/*.so \
		${IDIR_MOC}/usr/lib/moc/decoder_plugins
	${INSTALL_BIN} ${WRKINST}/usr/bin/mocp ${IDIR_MOC}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
