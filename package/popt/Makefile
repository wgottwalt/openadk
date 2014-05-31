# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		popt
PKG_VERSION:=		1.16
PKG_RELEASE:=		4
PKG_MD5SUM:=		3743beefa3dd6247a73f8f7a32c14c33
PKG_DESCR:=		command line option parsing library
PKG_SECTION:=		libs/misc
PKG_BUILDDEP:=		libiconv-tiny
PKG_URL:=		http://rpm5.org/
PKG_SITES:=		http://rpm5.org/files/popt/
PKG_LIBNAME:=		libpopt
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBPOPT,libpopt,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

TARGET_LDFLAGS+=	-liconv

libpopt-install:
	${INSTALL_DIR} ${IDIR_LIBPOPT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libpopt.so* ${IDIR_LIBPOPT}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
