# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libxml2
PKG_VERSION:=		2.7.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		7740a8ec23878a2f50120e1faa2730f2
PKG_DESCR:=		XML C parser and toolkit
PKG_SECTION:=		libs
PKG_DEPENDS:=		zlib
PKG_BUILDDEP:=		zlib
PKG_URL:=		http://www.xmlsoft.org/
PKG_SITES:=		http://xmlsoft.org/sources/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBXML2,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

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

post-install:
	${INSTALL_DIR} ${IDIR_LIBXML2}/usr/lib
	${CP} ${WRKINST}/usr/lib/libxml2.so* ${IDIR_LIBXML2}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
