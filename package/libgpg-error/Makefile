# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libgpg-error
PKG_VERSION:=		1.8
PKG_RELEASE:=		1
PKG_MD5SUM:=		1d2005268a2f096db28cf9cf77b3229a
PKG_DESCR:=		a helper library for common error codes and descriptions
PKG_SECTION:=		libs
PKG_URL:=		http://www.gnupg.org
PKG_SITES:=		ftp://ftp.gnupg.org/gcrypt/libgpg-error/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBGPG_ERROR,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	${INSTALL_DIR} ${IDIR_LIBGPG_ERROR}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgpg-error.so* \
		${IDIR_LIBGPG_ERROR}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
