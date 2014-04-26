# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libunistring
PKG_VERSION:=		0.9.3
PKG_RELEASE:=		2
PKG_MD5SUM:=		db8eca3b64163abadf8c40e5cecc261f
PKG_DESCR:=		functions for manipulating Unicode strings
PKG_SECTION:=		libs
PKG_URL:=		http://www.gnu.org/software/libunistring/
PKG_SITES:=		${MASTER_SITE_GNU:=libunistring/}
PKG_OPTS:=		dev

PKG_LIBC_DEPENDS:=	uclibc glibc

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBUNISTRING,libunistring,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libunistring-install:
	${INSTALL_DIR} ${IDIR_LIBUNISTRING}/usr/lib
	${CP} ${WRKINST}/usr/lib/libunistring.so* ${IDIR_LIBUNISTRING}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
