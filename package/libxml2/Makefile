# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libxml2
PKG_VERSION:=		2.7.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		dc43ff7ae6aded45f578c87b7b0c8766
MASTER_SITES:=		http://xmlsoft.org/sources/ \
			ftp://fr.rpmfind.net/pub/libxml/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBXML2,libxml2,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--without-c14n \
			--without-catalog \
			--without-debug \
			--without-docbook \
			--with-html \
			--without-ftp \
			--without-http \
			--without-iconv \
			--without-iso8859x \
			--without-legacy \
			--with-output \
			--without-pattern \
			--without-push \
			--without-python \
			--with-reader \
			--without-readline \
			--without-regexps \
			--with-sax1 \
			--with-schemas \
			--with-threads \
			--with-tree \
			--with-valid \
			--with-writer \
			--with-xinclude \
			--with-xpath \
			--with-xptr \
			--with-zlib

BUILD_STYLE=		auto
INSTALL_STYLE=		auto confprog

post-install:
	${INSTALL_DIR} ${IDIR_LIBXML2}/usr/lib
	${CP} ${WRKINST}/usr/lib/libxml2.so.* ${IDIR_LIBXML2}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
