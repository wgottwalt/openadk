# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		file
PKG_VERSION:=		5.04
PKG_RELEASE:=		1
PKG_MD5SUM:=		accade81ff1cc774904b47c72c8aeea0
PKG_DESCR:=		a file type guesser
PKG_SECTION:=		utils
PKG_DEPENDS:=		libmagic
PKG_URL:=		http://www.darwinsys.com/file
PKG_SITES:=		ftp://ftp.fu-berlin.de/unix/tools/file/ \
			ftp://ftp.astron.com/pub/file/

PKG_SUBPKGS:=		FILE LIBMAGIC LIBMAGIC_DEV
PKGSD_LIBMAGIC:=	file type guesser library
PKGSC_LIBMAGIC:=	libs
PKGSD_LIBMAGIC_DEV:=	file type guesser headers
PKGSC_LIBMAGIC_DEV:=	devel

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,FILE,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBMAGIC,libmagic,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_LIBMAGIC},${PKGSD_LIBMAGIC},${PKGSC_LIBMAGIC}))
$(eval $(call PKG_template,LIBMAGIC_DEV,libmagic-dev,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_LIBMAGIC_DEV},${PKGSD_LIBMAGIC_DEV},${PKGSC_LIBMAGIC_DEV}))

pre-configure:
	(cd ${WRKBUILD}; rm -rf config.{cache,status} ; \
		./configure --enable-static --disable-shared \
		--disable-warnings \
	);
	${MAKE} -C ${WRKBUILD}
	${INSTALL_BIN} ${WRKBUILD}/src/file ${WRKBUILD}/magic
	${MAKE} -C ${WRKBUILD} clean

file-install:
	${INSTALL_DIR} ${IDIR_FILE}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/file ${IDIR_FILE}/usr/bin

libmagic-install:
	${INSTALL_DIR} ${IDIR_LIBMAGIC}/usr/share/misc
	${INSTALL_DATA} ${WRKINST}/usr/share/misc/magic.mgc \
		${IDIR_LIBMAGIC}/usr/share/misc
	${INSTALL_DIR} ${IDIR_LIBMAGIC}/usr/lib
	${CP} ${WRKINST}/usr/lib/libmagic.so* ${IDIR_LIBMAGIC}/usr/lib

libmagic-dev-install:
	${INSTALL_DIR} ${IDIR_LIBMAGIC_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_LIBMAGIC_DEV}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
