# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libgpg-error
PKG_VERSION:=		1.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		8599b96c911b1df1be24a6ff4ec3c364
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2
MASTER_SITES:=		ftp://ftp.gnupg.org/gcrypt/libgpg-error/ \
			http://mirrors.rootmode.com/ftp.gnupg.org/libgpg-error/ \
			http://gulus.usherbrooke.ca/pub/appl/GnuPG/libgpg-error/ \
			http://gnupg.unixmexico.org/ftp/libgpg-error/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBGPG_ERROR,libgpg-error,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto confprog

post-install:
	${INSTALL_DIR} ${IDIR_LIBGPG_ERROR}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgpg-error.so.* ${IDIR_LIBGPG_ERROR}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
