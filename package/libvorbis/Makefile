# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libvorbis
PKG_VERSION:=		1.2.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		478646358c49f34aedcce58948793619
PKG_DESCR:=		The Vorbis General Audio Compression Codec library
PKG_SECTION:=		libs
PKG_BUILDDEP:=		libogg
PKG_URL:=		http://www.xiph.org/vorbis/
PKG_SITES:=		http://downloads.xiph.org/releases/vorbis/

PKG_SUBPKGS:=		LIBVORBIS LIBVORBISENC LIBVORBIS_DEV
PKGSD_LIBVORBIS_DEV:=	development files for libvorbis
PKGSC_LIBVORBIS_DEV:=	devel

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBVORBIS,libvorbis,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBVORBISENC,libvorbisenc,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBVORBIS_DEV,libvorbis-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBVORBIS_DEV},${PKGSC_LIBVORBIS_DEV}))

SUB_INSTALLS-y:=
SUB_INSTALLS-m:=
SUB_INSTALLS-${ADK_PACKAGE_LIBVORBIS_DEV}+=	libvorbis-dev-install

CONFIGURE_ENV+=		LIBS="-lm -logg"
CONFIGURE_ARGS+=	--with-ogg="${STAGING_DIR}/usr" \
			--with-ogg-includes="${STAGING_DIR}/usr/include" \
			--with-ogg-libraries="${STAGING_DIR}/usr/lib"

post-install: ${SUB_INSTALLS-m} ${SUB_INSTALLS-y}
	${INSTALL_DIR} ${IDIR_LIBVORBIS}/usr/lib
	${CP} ${WRKINST}/usr/lib/libvorbis.so* ${IDIR_LIBVORBIS}/usr/lib/
	${CP} ${WRKINST}/usr/lib/libvorbisfile.so* ${IDIR_LIBVORBIS}/usr/lib/
	${INSTALL_DIR} ${IDIR_LIBVORBISENC}/usr/lib
	${CP} ${WRKINST}/usr/lib/libvorbisenc.so* ${IDIR_LIBVORBISENC}/usr/lib/

libvorbis-dev-install:
	${INSTALL_DIR} ${IDIR_LIBVORBIS_DEV}/usr/include/vorbis
	${CP} ${WRKINST}/usr/include/vorbis/*.h ${IDIR_LIBVORBIS_DEV}/usr/include/vorbis

include ${TOPDIR}/mk/pkg-bottom.mk
