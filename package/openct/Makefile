# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		openct
PKG_VERSION:=		0.6.20
PKG_RELEASE:=		3
PKG_HASH:=		6cd3e2933d29eb1f875c838ee58b8071fd61f0ec8ed5922a86c01c805d181a68
PKG_DESCR:=		drivers for smart card readers
PKG_SECTION:=		app/crypto
PKG_DEPENDS:=		libopenct
PKG_BUILDDEP:=		libtool
PKG_URL:=		https://github.com/OpenSC/openct/wiki
PKG_SITES:=		http://sourceforge.net/projects/opensc/files/openct/
PKG_LIBNAME:=		libopenct
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_SUBPKGS:=		OPENCT LIBOPENCT
PKGSD_LIBOPENCT:=	crypto token library 
PKGSC_LIBOPENCT:=	libs/crypto
PKGSS_LIBOPENCT:=	libltdl libusb
PKGSB_LIBOPENCT:=	libtool libusb

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,OPENCT,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBOPENCT,libopenct,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_LIBOPENCT},${PKGSD_LIBOPENCT},${PKGSC_LIBOPENCT},${PKG_OPTS}))

openct-install:
	${INSTALL_DIR} ${IDIR_OPENCT}/etc ${IDIR_OPENCT}/usr/{sbin,bin}
	${INSTALL_BIN} ${WRKINST}/usr/sbin/openct-control \
		${IDIR_OPENCT}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/ifd* \
		${IDIR_OPENCT}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/bin/openct-tool \
		${IDIR_OPENCT}/usr/bin
	${INSTALL_DATA} ${WRKBUILD}/etc/openct.conf \
		${IDIR_OPENCT}/etc

libopenct-install:
	${INSTALL_DIR} ${IDIR_LIBOPENCT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libopenct.so* \
		${IDIR_LIBOPENCT}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
