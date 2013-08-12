# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		pcre
PKG_VERSION:=		8.31
PKG_RELEASE:=		1
PKG_MD5SUM:=		fab1bb3b91a4c35398263a5c1e0858c1
PKG_DESCR:=		a Perl Compatible Regular Expression library
PKG_SECTION:=		libs
PKG_URL:=		http://www.pcre.org/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=pcre/}

PKG_SUBPKGS:=		LIBPCRE LIBPCRE_DEV LIBPCRECPP
PKGSD_LIBPCRE_DEV:=	PCRE headers
PKGSC_LIBPCRE_DEV:=	devel
PKGSD_LIBPCRECPP:=	PCRE c++ library

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBPCRE,libpcre,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBPCRECPP,libpcrecpp,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBPCRE_DEV,libpcre-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

XAKE_FLAGS+=		${TARGET_CONFIGURE_OPTS}

libpcre-install:
	${INSTALL_DIR} ${IDIR_LIBPCRE}/usr/lib
	${CP} ${WRKINST}/usr/lib/libpcre{,posix}.so* ${IDIR_LIBPCRE}/usr/lib

libpcrecpp-install:
	${INSTALL_DIR} ${IDIR_LIBPCRECPP}/usr/lib
	${CP} ${WRKINST}/usr/lib/libpcrecpp.so* ${IDIR_LIBPCRECPP}/usr/lib

libpcre-dev-install:
	${INSTALL_DIR} ${IDIR_LIBPCRE_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/*.h \
		${IDIR_LIBPCRE_DEV}/usr/include
	${INSTALL_DIR} ${IDIR_LIBPCRE_DEV}/usr/lib/pkgconfig
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/*.pc \
		${IDIR_LIBPCRE_DEV}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
