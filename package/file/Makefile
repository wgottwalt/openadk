# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		file
PKG_VERSION:=		5.11
PKG_RELEASE:=		2
PKG_MD5SUM:=		16a407bd66d6c7a832f3a5c0d609c27b
PKG_DESCR:=		a file type guesser
PKG_SECTION:=		utils
PKG_DEPENDS:=		libmagic
PKG_URL:=		http://www.darwinsys.com/file
PKG_SITES:=		ftp://ftp.fu-berlin.de/unix/tools/file/ \
			ftp://ftp.astron.com/pub/file/
PKG_LIBNAME:=		libmagic
PKG_OPTS:=		dev

PKG_SUBPKGS:=		FILE LIBMAGIC
PKGSD_LIBMAGIC:=	file type guesser library
PKGSC_LIBMAGIC:=	libs

ifeq ($(ADK_STATIC),y)
PKG_OPTS+=		libmix
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,FILE,file,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBMAGIC,libmagic,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_LIBMAGIC},${PKGSD_LIBMAGIC},${PKGSC_LIBMAGIC},${PKG_OPTS}))

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

include ${TOPDIR}/mk/pkg-bottom.mk
