# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		file
PKG_VERSION:=		5.17
PKG_RELEASE:=		1
PKG_MD5SUM:=		e19c47e069ced7b01ccb4db402cc01d3
PKG_DESCR:=		file type guesser
PKG_SECTION:=		utils
PKG_BUILDDEP:=		file-host
PKG_DEPENDS:=		libmagic
PKG_URL:=		http://www.darwinsys.com/file
PKG_SITES:=		ftp://ftp.fu-berlin.de/unix/tools/file/ \
			ftp://ftp.astron.com/pub/file/
PKG_LIBNAME:=		libmagic
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

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

HOST_STYLE:=		auto
HOST_CONFIGURE_ARGS+=	--enable-static \
			--disable-shared \
			--disable-warnings

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
