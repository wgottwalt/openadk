# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libmad
PKG_VERSION:=		0.15.1b
PKG_RELEASE:=		2
PKG_MD5SUM:=		1be543bc30c56fb6bea1d7bf6a64e66c
PKG_DESCR:=		An high-quality MPEG audio decoding library
PKG_SECTION:=		libs
PKG_URL:=		http://sourceforge.net/projects/mad
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=mad/}

PKG_SUBPKGS:=		LIBMAD LIBMAD_DEV
PKGSD_LIBMAD_DEV:=	development files for libmad
PKGSC_LIBMAD_DEV:=	devel

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBMAD,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBMAD_DEV,libmad-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBMAD_DEV},${PKGSC_LIBMAD_DEV}))

FPM:=default
ifeq (${ARCH},i386)
FPM:=intel
endif
# MIPS optimization is broken for gcc 4.4 (removed h constraint)
#ifeq (${ARCH},mips)
#FPM:=mips
#endif

CONFIGURE_ARGS+=	--enable-fpm=${FPM} \
			--disable-debugging \
			--enable-speed

pre-install:
	${INSTALL_DIR} ${WRKINST}/usr/lib/pkgconfig
	${CP} ./files/mad.pc ${WRKINST}/usr/lib/pkgconfig

post-install:
	${INSTALL_DIR} ${IDIR_LIBMAD}/usr/lib
	${CP} ${WRKINST}/usr/lib/libmad.so* ${IDIR_LIBMAD}/usr/lib/

libmad-dev-install:
	${INSTALL_DIR} ${IDIR_LIBMAD_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/*.h ${IDIR_LIBMAD_DEV}/usr/include/

include ${TOPDIR}/mk/pkg-bottom.mk
