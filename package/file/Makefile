# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		file
PKG_VERSION:=		5.04
PKG_RELEASE:=		1
PKG_MD5SUM:=		accade81ff1cc774904b47c72c8aeea0
PKG_DESCR:=		a file type guesser
PKG_SECTION:=		utils
PKG_URL:=		http://www.darwinsys.com/file
PKG_SITES:=		ftp://ftp.fu-berlin.de/unix/tools/file/ \
			ftp://ftp.astron.com/pub/file/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,FILE,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

pre-configure:
	(cd ${WRKBUILD}; rm -rf config.{cache,status} ; \
		CFLAGS="-static" \
		./configure --enable-static --disable-shared \
		--disable-warnings \
	);
	${MAKE} -C ${WRKBUILD}
	${INSTALL_BIN} ${WRKBUILD}/src/file ${WRKBUILD}/magic
	${MAKE} -C ${WRKBUILD} clean

post-install:
	${INSTALL_DIR} ${IDIR_FILE}/usr/bin ${IDIR_FILE}/usr/lib \
		${IDIR_FILE}/usr/share/misc
	${INSTALL_BIN} ${WRKINST}/usr/bin/file ${IDIR_FILE}/usr/bin
	${INSTALL_DATA} ${WRKINST}/usr/share/misc/magic.mgc \
		${IDIR_FILE}/usr/share/misc
	${CP} ${WRKINST}/usr/lib/libmagic.so.* ${IDIR_FILE}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
