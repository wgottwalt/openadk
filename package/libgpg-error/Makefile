# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libgpg-error
PKG_VERSION:=		1.9
PKG_RELEASE:=		1
PKG_MD5SUM:=		521b98aa9395e7eaf0ef2236233a0796
PKG_DESCR:=		a helper library for common error codes and descriptions
PKG_SECTION:=		libs
PKG_URL:=		http://www.gnupg.org/
PKG_SITES:=		ftp://ftp.gnupg.org/gcrypt/libgpg-error/

PKG_SUBPKGS:=		LIBGPG_ERROR LIBGPG_ERROR_DEV
PKGSD_LIBGPG_ERROR_DEV:=common error code and description headers
PKGSC_LIBGPG_ERROR_DEV:=devel

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBGPG_ERROR,libgpg-error,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBGPG_ERROR_DEV,libgpg-error-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBGPG_ERROR_DEV},${PKGSC_LIBGPG_ERROR_DEV}))

libgpg-error-install:
	${INSTALL_DIR} ${IDIR_LIBGPG_ERROR}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgpg-error.so* \
		${IDIR_LIBGPG_ERROR}/usr/lib

libgpg-error-dev-install:
	${INSTALL_DIR} ${IDIR_LIBGPG_ERROR_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/gpg-error.h \
		${IDIR_LIBGPG_ERROR_DEV}/usr/include
	${INSTALL_DIR} ${IDIR_LIBGPG_ERROR_DEV}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/gpg-error-config \
		${IDIR_LIBGPG_ERROR_DEV}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
