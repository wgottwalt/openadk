# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		alsa-lib
PKG_VERSION:=		1.0.24.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		7cc05f25e1d5b65da8fb3fdcd540f226
PKG_DESCR:=		ALSA sound library
PKG_SECTION:=		libs
PKG_URL:=		http://www.alsa-project.org/
PKG_SITES:=		ftp://ftp.alsa-project.org/pub/lib/

PKG_SUBPKGS:=		ALSA_LIB ALSA_LIB_DEV
PKGSD_ALSA_LIB_DEV:=	development files for ALSA
PKGSC_ALSA_LIB_DEV:=	devel

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,ALSA_LIB,alsa-lib,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,ALSA_LIB_DEV,alsa-lib-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_ALSA_LIB_DEV},${PKGSC_ALSA_LIB_DEV}))

CONFIGURE_ARGS+=	--disable-python

alsa-lib-install:
	${INSTALL_DIR} ${IDIR_ALSA_LIB}/usr/lib ${IDIR_ALSA_LIB}/usr/share/alsa
	${CP} ${WRKINST}/usr/lib/libasound.so* ${IDIR_ALSA_LIB}/usr/lib
	${CP} ${WRKINST}/usr/share/alsa/* ${IDIR_ALSA_LIB}/usr/share/alsa

alsa-lib-dev-install:
	${INSTALL_DIR} ${IDIR_ALSA_LIB_DEV}/usr/include/{sys,alsa}
	${CP} ${WRKINST}/usr/include/sys/*.h ${IDIR_ALSA_LIB_DEV}/usr/include/sys
	${CP} ${WRKINST}/usr/include/alsa/*.h ${IDIR_ALSA_LIB_DEV}/usr/include/alsa

include ${TOPDIR}/mk/pkg-bottom.mk
