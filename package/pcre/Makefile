# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		pcre
PKG_VERSION:=		8.02
PKG_RELEASE:=		1
PKG_MD5SUM:=		214462e9718e3f9197cba114dc6b00b8
PKG_DESCR:=		a Perl Compatible Regular Expression library
PKG_SECTION:=		libs
PKG_URL:=		http://www.pcre.org
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=pcre/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBPCRE,libpcre,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-cpp
XAKE_FLAGS+=		${TARGET_CONFIGURE_OPTS} CFLAGS='${TCFLAGS}'

post-install:
	${INSTALL_DIR} ${IDIR_LIBPCRE}/usr/lib
	${CP} ${WRKINST}/usr/lib/libpcre{,posix}.so* ${IDIR_LIBPCRE}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
