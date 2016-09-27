# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		moc
PKG_VERSION:=		2.5.1
PKG_RELEASE:=		1
PKG_HASH:=		1b419c75a92a85ff4ee7670c65d660c86fef32032c65e89e868b988f80fac4f2
PKG_DESCR:=		console music player
PKG_SECTION:=		mm/audio
PKG_DEPENDS:=		libmad libvorbis libcurl libflac
PKG_DEPENDS+=		libncurses libid3tag
PKG_BUILDDEP:=		ncurses libvorbis curl libmad flac
PKG_BUILDDEP+=		libid3tag libtool
PKG_URL:=		http://moc.daper.net/
PKG_SITES:=		ftp://ftp.daper.net/pub/soft/moc/stable/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MOC,moc,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CPPFLAGS+=	-D_GNU_SOURCE -D_POSIX_SOURCE
TARGET_LDFLAGS+=	-ltinfo

CONFIGURE_ARGS+=	--without-jack \
			--without-oss \
			--disable-cache \
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

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
