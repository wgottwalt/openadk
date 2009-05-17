# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		pcre
PKG_VERSION:=		7.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		5ca11a81b753de24fb87ddc872ccaa67
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=pcre/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBPCRE,libpcre,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--enable-utf8
# C++ support uses libstdc++ not uClibc++ so disable it
CONFIGURE_ARGS+=	--disable-cpp
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto
XAKE_FLAGS+=		${TARGET_CONFIGURE_OPTS} CFLAGS='${TCFLAGS}'

#pre-build:
#	${MAKE} -C '${WRKBUILD}' \
#	    CC_FOR_BUILD='${HOSTCC}' \
#	    LINK_FOR_BUILD='${HOSTCC}' \
#	    CFLAGS_FOR_BUILD='${HOSTCFLAGS}' \
#	    dftables

post-install:
	${INSTALL_DIR} ${IDIR_LIBPCRE}/usr/lib
	${CP} ${WRKINST}/usr/lib/libpcre{,posix}.so.* ${IDIR_LIBPCRE}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
