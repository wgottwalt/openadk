# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		libp11
PKG_VERSION:=		0.2.8
PKG_RELEASE:=		1
PKG_HASH:=		a4121015503ade98074b5e2a2517fc8a139f8b28aed10021db2bb77283f40691
PKG_DESCR:=		library implementing a small layer on top of pkcs11 api
PKG_SECTION:=		libs/crypto
PKG_DEPENDS:=		libltdl libressl
PKG_BUILDDEP:=		libtool libressl
PKG_URL:=		https://github.com/OpenSC/libp11/wiki
PKG_SITES:=		http://sourceforge.net/projects/opensc/files/libp11/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBP11,libp11,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libp11-install:
	${INSTALL_DIR} ${IDIR_LIBP11}/usr/lib
	${CP} ${WRKINST}/usr/lib/libp11.so* ${IDIR_LIBP11}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
