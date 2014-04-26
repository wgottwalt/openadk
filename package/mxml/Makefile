# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		mxml
PKG_VERSION:=		2.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		68977789ae64985dddbd1a1a1652642e
PKG_DESCR:=		lightweight XML library
PKG_SECTION:=		libs
PKG_URL:=		http://www.msweet.org/projects.php?Z3
PKG_SITES:=		http://www.msweet.org/files/project3/
PKG_LIBNAME:=		libmxml
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBMXML,libmxml,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

FAKE_FLAGS+=		BUILDROOT=${WRKINST}

libmxml-install:
	${INSTALL_DIR} ${IDIR_LIBMXML}/usr/lib
	${CP} ${WRKINST}/usr/lib/libmxml.so* ${IDIR_LIBMXML}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
