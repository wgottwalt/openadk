# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libp11
PKG_VERSION:=		0.2.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		564ab53ad7353903ddfdc15b153c44fb
PKG_DESCR:=		library implementing a small layer on top of PKCS11 API
PKG_SECTION:=		libs
PKG_DEPENDS:=		libopenssl libltdl
PKG_BUILDDEP:=		openssl libtool
PKG_URL:=		http://www.opensc-project.org/libp11
PKG_SITES:=		http://www.opensc-project.org/files/libp11/

PKG_SUBPKGS:=		LIBP11 LIBP11_DEV
PKGSD_LIBP11_DEV:=	development files for libp11
PKGSC_LIBP11_DEV:=	devel

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBP11,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBP11_DEV,libp11-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBP11_DEV},${PKGSC_LIBP11_DEV}))

SUB_INSTALLS-y:=
SUB_INSTALLS-m:=
SUB_INSTALLS-${ADK_PACKAGE_LIBP11_DEV}+=	libp11-dev-install

post-install: ${SUB_INSTALLS-m} ${SUB_INSTALLS-y}
	${INSTALL_DIR} ${IDIR_LIBP11}/usr/lib
	${CP} ${WRKINST}/usr/lib/libp11.so* ${IDIR_LIBP11}/usr/lib

libp11-dev-install:
	${INSTALL_DIR} ${IDIR_LIBP11_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/*.h ${IDIR_LIBP11_DEV}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
