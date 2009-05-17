# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk
include ${TOPDIR}/toolchain/gcc/Makefile.inc
include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GCC,gcc,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--enable-languages=c \
			--enable-shared \
			--disable-__cxa_atexit \
			--with-gnu-ld \
			--disable-libssp \
			--disable-nls \
			--disable-libmudflap \
			--disable-libgomp \
			--disable-multilib
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_GCC}/usr/lib
	${INSTALL_DIR} ${IDIR_GCC}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/gcc ${IDIR_GCC}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
