# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		file
PKG_VERSION:=		5.15
PKG_RELEASE:=		1
PKG_MD5SUM:=		3f99565532f548d7540912c4642d1ede
PKG_DESCR:=		a file type guesser
PKG_SECTION:=		utils
PKG_DEPENDS:=		libmagic libgcc
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

include ${TOPDIR}/mk/host.mk
include ${TOPDIR}/mk/package.mk

$(eval $(call HOST_template,FILE,file,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,FILE,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBMAGIC,libmagic,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_LIBMAGIC},${PKGSD_LIBMAGIC},${PKGSC_LIBMAGIC},${PKG_OPTS}))

HOST_CONFIGURE_ARGS+=	--enable-static \
			--disable-shared \
			--disable-warnings
file-hostinstall:
	${INSTALL_BIN} ${HOST_WRKINST}/usr/bin/file \
		${STAGING_HOST_DIR}/usr/bin

file-install:
	${INSTALL_DIR} ${IDIR_FILE}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/file ${IDIR_FILE}/usr/bin

libmagic-install:
	${INSTALL_DIR} ${IDIR_LIBMAGIC}/usr/share/misc
	${INSTALL_DATA} ${WRKINST}/usr/share/misc/magic.mgc \
		${IDIR_LIBMAGIC}/usr/share/misc
	${INSTALL_DIR} ${IDIR_LIBMAGIC}/usr/lib
	${CP} ${WRKINST}/usr/lib/libmagic.so* ${IDIR_LIBMAGIC}/usr/lib

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
