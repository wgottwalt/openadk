# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		libcapi20
PKG_VERSION:=		3.0.5-cm2
PKG_RELEASE:=		1
PKG_HASH:=		6a54e49109bda85fa2c9356846bc41ab171338afc02d0a85b2fc154667ba5fb9
PKG_DESCR:=		capi library
PKG_SECTION:=		libs/misc
PKG_URL:=		ftp://ftp.melware.net/capi-utils/
PKG_SITES:=		http://distfiles.openadk.org/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBCAPI20,libcapi20,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

pre-install:
	${INSTALL_DIR} ${WRKINST}/usr/lib

libcapi20-install:
	${INSTALL_DIR} ${IDIR_LIBCAPI20}/usr/lib
	${CP} ${WRKINST}/usr/lib/libcapi*.so* ${IDIR_LIBCAPI20}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
