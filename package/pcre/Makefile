# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		pcre
PKG_VERSION:=		8.34
PKG_RELEASE:=		1
PKG_MD5SUM:=		eb34b2c9c727fd64940d6fd9a00995eb
PKG_DESCR:=		a Perl Compatible Regular Expression library
PKG_SECTION:=		libs
PKG_BUILDDEPS:=		gettext-tiny
PKG_URL:=		http://www.pcre.org/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=pcre/}
PKG_LIBNAME:=		libpcre
PKG_OPTS:=		dev

PKG_SUBPKGS:=		LIBPCRE LIBPCRECPP
PKGSD_LIBPCRECPP:=	PCRE c++ library

ifeq ($(ADK_STATIC),y)
PKG_OPTS+=		libmix
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBPCRE,libpcre,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,LIBPCRECPP,libpcrecpp,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBPCRECPP},${PKG_SECTION}))

CONFIGURE_ARGS+=	--enable-utf
XAKE_FLAGS+=		${TARGET_CONFIGURE_OPTS}

libpcre-install:
	${INSTALL_DIR} ${IDIR_LIBPCRE}/usr/lib
	${CP} ${WRKINST}/usr/lib/libpcre{,posix}.so* ${IDIR_LIBPCRE}/usr/lib

libpcrecpp-install:
	${INSTALL_DIR} ${IDIR_LIBPCRECPP}/usr/lib
	${CP} ${WRKINST}/usr/lib/libpcrecpp.so* ${IDIR_LIBPCRECPP}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
