# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		mxml
PKG_VERSION:=		2.10
PKG_RELEASE:=		1
PKG_HASH:=		267ff58b64ddc767170d71dab0c729c06f45e1df9a9b6f75180b564f09767891
PKG_DESCR:=		lightweight xml library
PKG_SECTION:=		libs/data
PKG_URL:=		http://www.msweet.org/
PKG_SITES:=		https://github.com/michaelrsweet/mxml/releases/download/release-2.10/
PKG_LIBNAME:=		libmxml
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBMXML,libmxml,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

FAKE_FLAGS+=		BUILDROOT=${WRKINST}

libmxml-install:
	${INSTALL_DIR} ${IDIR_LIBMXML}/usr/lib
	${CP} ${WRKINST}/usr/lib/libmxml.so* ${IDIR_LIBMXML}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
