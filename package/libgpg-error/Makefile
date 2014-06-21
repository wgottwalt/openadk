# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		libgpg-error
PKG_VERSION:=		1.12
PKG_RELEASE:=		1
PKG_MD5SUM:=		8f0eb41a344d19ac2aa9bd101dfb9ce6
PKG_DESCR:=		helper library for common error codes and descriptions
PKG_SECTION:=		libs/misc
PKG_URL:=		http://www.gnupg.org/
PKG_SITES:=		ftp://ftp.gnupg.org/gcrypt/libgpg-error/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBGPG_ERROR,libgpg-error,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libgpg-error-install:
	${INSTALL_DIR} ${IDIR_LIBGPG_ERROR}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgpg-error.so* \
		${IDIR_LIBGPG_ERROR}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
