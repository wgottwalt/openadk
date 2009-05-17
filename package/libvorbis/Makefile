# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libvorbis
PKG_VERSION:=		1.2.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		478646358c49f34aedcce58948793619
MASTER_SITES:=		http://downloads.xiph.org/releases/vorbis/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBVORBIS,libvorbis,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))
$(eval $(call PKG_template,LIBVORBISENC,libvorbisenc,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ENV+=		LIBS="-lm -logg"
CONFIGURE_ARGS+=	--with-ogg="${STAGING_DIR}/usr" \
			--with-ogg-includes="${STAGING_DIR}/usr/include" \
			--with-ogg-libraries="${STAGING_DIR}/usr/lib"
BUILD_STYLE=		auto
INSTALL_STYLE=		auto confprog

post-install:
	${INSTALL_DIR} ${IDIR_LIBVORBIS}/usr/lib
	${CP} ${WRKINST}/usr/lib/libvorbis.so.* ${IDIR_LIBVORBIS}/usr/lib/
	${CP} ${WRKINST}/usr/lib/libvorbisfile.so.* ${IDIR_LIBVORBIS}/usr/lib/
	${INSTALL_DIR} ${IDIR_LIBVORBISENC}/usr/lib
	${CP} ${WRKINST}/usr/lib/libvorbisenc.so.* ${IDIR_LIBVORBISENC}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
