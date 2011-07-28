# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		opensc
PKG_VERSION:=		0.11.13
PKG_RELEASE:=		4
PKG_MD5SUM:=		98fa151e947941f9c3f27420fdf47c11
PKG_DESCR:=		utilities to access smart cards
PKG_SECTION:=		crypto
PKG_BUILDDEP:=		openct pcsc-lite openssl readline
PKG_DEPENDS:=		libopensc libopenct pcsc-lite libopenssl libreadline
PKG_URL:=		http://www.opensc-project.org/opensc/
PKG_SITES:=		http://www.opensc-project.org/files/opensc/

PKG_SUBPKGS:=		OPENSC LIBOPENSC LIBOPENSC_DEV
PKGSD_LIBOPENSC:=	opensc library
PKGSC_LIBOPENSC:=	libs
PKGSS_LIBOPENSC:=	libltdl
PKGSB_LIBOPENSC:=	libtool
PKGSD_LIBOPENSC_DEV:=	development files for opensc
PKGSC_LIBOPENSC_DEV:=	devel

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,OPENSC,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBOPENSC,libopensc,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_LIBOPENSC},${PKGSD_LIBOPENSC},${PKGSC_LIBOPENSC}))
$(eval $(call PKG_template,LIBOPENSC_DEV,libopensc-dev,${PKG_VERSION}-${PKG_RELEASE},,${PKGSD_LIBOPENSC_DEV},${PKGSC_LIBOPENSC_DEV}))

CONFIGURE_ARGS+=	--disable-man \
			--disable-iconv \
			--enable-pcsc \
			--enable-openct

post-install:
	${INSTALL_DIR} ${IDIR_OPENSC}/usr/bin
	${INSTALL_DIR} ${IDIR_OPENSC}/usr/share/opensc
	${INSTALL_DATA} ${WRKINST}/usr/share/opensc/* \
		${IDIR_OPENSC}/usr/share/opensc
	${INSTALL_BIN} ${WRKINST}/usr/bin/opensc-explorer \
		 ${IDIR_OPENSC}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/opensc-tool \
		 ${IDIR_OPENSC}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/pkcs15-init \
		 ${IDIR_OPENSC}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/pkcs15-tool \
		 ${IDIR_OPENSC}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/pkcs15-crypt \
		 ${IDIR_OPENSC}/usr/bin

libopensc-install:
	${INSTALL_DIR} ${IDIR_LIBOPENSC}/usr/lib
	${CP} ${WRKINST}/usr/lib/libopensc.so* \
		${IDIR_LIBOPENSC}/usr/lib
	${CP} ${WRKINST}/usr/lib/libpkcs15init.so* \
		${IDIR_LIBOPENSC}/usr/lib
	${CP} ${WRKINST}/usr/lib/libscconf.so* \
		${IDIR_LIBOPENSC}/usr/lib
	${CP} ${WRKINST}/usr/lib/opensc-pkcs11.so \
		${IDIR_LIBOPENSC}/usr/lib

libopensc-dev-install:
	${INSTALL_DIR} ${IDIR_LIBOPENSC_DEV}/usr/include/opensc
	${CP} ${WRKINST}/usr/include/opensc/*.h \
		${IDIR_LIBOPENSC_DEV}/usr/include/opensc

include ${TOPDIR}/mk/pkg-bottom.mk
