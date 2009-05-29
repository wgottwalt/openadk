# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk
include ${TOPDIR}/toolchain/gcc/Makefile.inc
include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GCC,gcc,${PKG_VERSION}-${PKG_RELEASE}))

TCFLAGS:=		''
TCPPFLAGS:=		''
CONFIGURE_STYLE=	gnu
ifeq ($(ADK_LINUX_MIPS64_LEMOTE),y)
CONFIGURE_ARGS+=	--with-abi=64
endif
CONFIGURE_ARGS+=	--enable-languages=c \
			--host=$(REAL_GNU_TARGET_NAME) \
			--target=$(REAL_GNU_TARGET_NAME) \
			--disable-__cxa_atexit \
			--without-headers \
			--with-gnu-ld \
			--disable-libssp \
			--disable-nls \
			--disable-libmudflap \
			--disable-libgomp \
			--disable-multilib
BUILD_STYLE:=		auto
ALL_TARGET:=		all-gcc all-target-libgcc
INSTALL_STYLE:=		auto
INSTALL_TARGET:=	install-gcc install-target-libgcc

post-install:
	${INSTALL_DIR} ${IDIR_GCC}/usr/lib
	${INSTALL_DIR} ${IDIR_GCC}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/gcc ${IDIR_GCC}/usr/bin/
	${INSTALL_BIN} ${WRKINST}/usr/bin/ccp ${IDIR_GCC}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
