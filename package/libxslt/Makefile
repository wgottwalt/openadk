# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libxslt
PKG_VERSION:=		1.1.24
PKG_RELEASE:=		1
PKG_MD5SUM:=		e83ec5d27fc4c10c6f612879bea9a153
MASTER_SITES:=		http://xmlsoft.org/sources/ \
			ftp://fr.rpmfind.net/pub/libxml/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBXSLT,libxslt,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--with-libxml-prefix="${STAGING_DIR}/usr" \
			--with-libxml-include-prefix="${STAGING_DIR}/usr/include/libxml2" \
			--with-libxml-libs-prefix="${STAGING_DIR}/usr/lib" \
			--without-python \
			--without-crypto \
			--without-debug \
			--without-mem-debug \
			--without-debugger
BUILD_STYLE=		auto
INSTALL_STYLE=		auto confprog

post-install:
	${INSTALL_DIR} ${IDIR_LIBXSLT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libxslt.so.* ${IDIR_LIBXSLT}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
