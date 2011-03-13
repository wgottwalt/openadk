# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libffi
PKG_VERSION:=		3.0.9
PKG_RELEASE:=		2
PKG_MD5SUM:=		1f300a7a7f975d4046f51c3022fa5ff1
PKG_DESCR:=		Foreign Function Interface library
PKG_SECTION:=		libs
PKG_URL:=		http://sourceware.org/libffi/
PKG_SITES:=		ftp://sourceware.org/pub/libffi/

PKG_SUBPKGS:=		LIBFFI LIBFFI_DEV
PKGSC_LIBFFI_DEV:=	devel
PKGSD_LIBFFI_DEV:=	libffi headers

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBFFI,libffi,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBFFI_DEV,libffi-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBFFI_DEV},${PKGSC_LIBFFI_DEV}))

libffi-install:
	${INSTALL_DIR} ${IDIR_LIBFFI}/usr/lib
	${CP} ${WRKINST}/usr/lib/libffi.so* ${IDIR_LIBFFI}/usr/lib

libffi-dev-install:
	${INSTALL_DIR} ${IDIR_LIBFFI_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_LIBFFI_DEV}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
