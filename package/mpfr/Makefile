# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk
include ${TOPDIR}/toolchain/mpfr/Makefile.inc

PKG_DESCR:=		multi precision library
PKG_SECTION:=		libs
PKG_URL:=		http://www.mpfr.org/
PKG_SUBPKGS:=		MPFR MPFR_DEV
PKGSC_MPFR_DEV:=	devel
PKGSD_MPFR_DEV:=	mpfr headers

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MPFR,mpfr,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,MPFR_DEV,mpfr-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_MPFR_DEV},${PKGSC_MPFR_DEV}))

TARGET_CFLAGS:=         $(filter-out -flto,$(TARGET_CFLAGS))

mpfr-install:
	${INSTALL_DIR} ${IDIR_MPFR}/usr/lib
	${CP} ${WRKINST}/usr/lib/libmpfr.so* ${IDIR_MPFR}/usr/lib

mpfr-dev-install:
	${INSTALL_DIR} ${IDIR_MPFR_DEV}/usr/include
	$(CP) $(WRKINST)/usr/include/* ${IDIR_MPFR_DEV}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
