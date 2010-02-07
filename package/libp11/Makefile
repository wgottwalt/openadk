# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libp11
PKG_VERSION:=		0.2.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		9e2c5cbececde245e2d2f535bd49ce35
PKG_DESCR:=		library implementing a small layer on top of PKCS11 API
PKG_SECTION:=		libs
PKG_DEPENDS:=		libopenssl libltdl
PKG_BUILDDEP+=		openssl libtool
PKG_URL:=		http://www.opensc-project.org/libp11
PKG_SITES:=		http://www.opensc-project.org/files/libp11/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBP11,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	${INSTALL_DIR} ${IDIR_LIBP11}/usr/lib
	${CP} ${WRKINST}/usr/lib/libp11.so* ${IDIR_LIBP11}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
