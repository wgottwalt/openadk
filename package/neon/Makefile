# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME=		neon
PKG_VERSION=		0.28.4
PKG_RELEASE=		1
PKG_MD5SUM=		6c3b94362af743d046e198e9fcbe4a85
MASTER_SITES=		http://webdav.org/neon/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,NEON,neon,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--with-ssl=openssl \
			--without-gssapi \
			--with-libxml2
BUILD_STYLE=		auto
INSTALL_STYLE=		auto confprog

post-install:
	${INSTALL_DIR} ${IDIR_NEON}/usr/lib
	$(CP) ${WRKINST}/usr/lib/lib*.so.* ${IDIR_NEON}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
