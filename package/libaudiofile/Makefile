# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		audiofile
PKG_VERSION:=		0.2.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		a39be317a7b1971b408805dc5e371862
PKG_DESCR:=		audiofile library
PKG_SECTION:=		libs
PKG_URL:=		http://www.68k.org/~michael/audiofile/
PKG_SITES:=		http://www.68k.org/~michael/audiofile/

PKG_SUBPKGS:=		LIBAUDIOFILE LIBAUDIOFILE_DEV
PKGSC_LIBAUDIOFILE_DEV:=devel
PKGSD_LIBAUDIOFILE_DEV:=audiofile headers

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBAUDIOFILE,libaudiofile,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBAUDIOFILE_DEV,libaudiofile-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBAUDIOFILE_DEV},${PKGSC_LIBAUDIOFILE_DEV}))

CONFIGURE_ENV+=		ac_cv_linux_vers=2
CONFIGURE_ARGS+=	--with-build-cc=${CC_FOR_BUILD}

libaudiofile-install:
	${INSTALL_DIR} ${IDIR_LIBAUDIOFILE}/usr/lib
	${CP} ${WRKINST}/usr/lib/libaudiofile.so* ${IDIR_LIBAUDIOFILE}/usr/lib/

libaudiofile-dev-install:
	${INSTALL_DIR} ${IDIR_LIBAUDIOFILE_DEV}/usr/lib/pkgconfig
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/*.pc \
		${IDIR_LIBAUDIOFILE_DEV}/usr/lib/pkgconfig
	${INSTALL_DIR} ${IDIR_LIBAUDIOFILE_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/*.h ${IDIR_LIBAUDIOFILE_DEV}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
