# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libmad
PKG_VERSION:=		0.15.1b
PKG_RELEASE:=		5
PKG_MD5SUM:=		1be543bc30c56fb6bea1d7bf6a64e66c
PKG_DESCR:=		An high-quality MPEG audio decoding library
PKG_SECTION:=		libs
PKG_URL:=		http://sourceforge.net/projects/mad
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=mad/}
PKG_OPTS:=		dev

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBMAD,libmad,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

FPM:=default
ifeq (${ARCH},i386)
FPM:=intel
endif
ifeq (${ARCH},arm)
FPM:=arm
endif
ifeq (${ARCH},mips)
FPM:=mips
endif
ifeq (${ARCH},ppc)
FPM:=ppc
endif
ifeq (${ARCH},sparc)
FPM:=sparc
endif
ifeq (${ARCH},x86_64)
FPM:=64bit
endif

CONFIGURE_ARGS+=	--enable-fpm=${FPM} \
			--disable-debugging \
			--enable-speed

pre-install:
	${INSTALL_DIR} ${WRKINST}/usr/lib/pkgconfig
	${CP} ./files/mad.pc ${WRKINST}/usr/lib/pkgconfig

libmad-install:
	${INSTALL_DIR} ${IDIR_LIBMAD}/usr/lib
	${CP} ${WRKINST}/usr/lib/libmad.so* ${IDIR_LIBMAD}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
