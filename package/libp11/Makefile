# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		libp11
PKG_VERSION:=		0.2.7
PKG_RELEASE:=		2
PKG_MD5SUM:=		564ab53ad7353903ddfdc15b153c44fb
PKG_DESCR:=		library implementing a small layer on top of pkcs11 api
PKG_SECTION:=		libs/crypto
PKG_DEPENDS:=		libopenssl libltdl
PKG_BUILDDEP:=		openssl libtool
PKG_URL:=		http://www.opensc-project.org/libp11
PKG_SITES:=		http://www.opensc-project.org/files/libp11/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBP11,libp11,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libp11-install:
	${INSTALL_DIR} ${IDIR_LIBP11}/usr/lib
	${CP} ${WRKINST}/usr/lib/libp11.so* ${IDIR_LIBP11}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
