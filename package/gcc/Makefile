# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk
include ${TOPDIR}/toolchain/gcc/Makefile.inc

PKG_DESCR:=		GNU compiler collection
PKG_SECTION:=		comp
PKG_DEPENDS:=		mpfr
PKG_OPTS:=		noremove
PKG_BUILDDEP+=		gmp mpfr

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GCC,gcc,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

TCFLAGS:=		''
TCPPFLAGS:=		''
CONFIGURE_STYLE:=	gnu
ifeq ($(ADK_LINUX_MIPS64_LEMOTE),y)
CONFIGURE_ARGS+=	--with-abi=64
endif
CONFIGURE_ARGS+=	--enable-languages=c,c++ \
			--libexecdir=/usr/lib \
			--host=$(REAL_GNU_TARGET_NAME) \
			--target=$(REAL_GNU_TARGET_NAME) \
			--disable-__cxa_atexit \
			--without-headers \
			--with-gnu-ld \
			--disable-libssp \
			--disable-nls \
			--disable-sjlj-exceptions \
			--disable-biarch \
			--disable-libmudflap \
			--disable-libgomp \
			--disable-multilib \
			--disable-libstdcxx-pch
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_GCC}/usr/lib/gcc ${IDIR_GCC}/usr/bin
	${INSTALL_DIR} ${IDIR_GCC}/lib ${IDIR_GCC}/usr/include/c++
	${INSTALL_BIN} ${WRKINST}/usr/bin/gcc ${IDIR_GCC}/usr/bin/
	${INSTALL_BIN} ${WRKINST}/usr/bin/g++ ${IDIR_GCC}/usr/bin/
	cd ${IDIR_GCC}/usr/bin/ && ln -sf g++ c++
	${INSTALL_BIN} ${WRKINST}/usr/bin/cpp ${IDIR_GCC}/usr/bin/
	${CP} ${WRKINST}/usr/lib/libstdc++*so* ${IDIR_GCC}/usr/lib/
	${CP} ${WRKINST}/usr/include/c++/* ${IDIR_GCC}/usr/include/c++/
	cd ${IDIR_GCC}/lib && ln -sf ../usr/bin/cpp .
	${CP} ${WRKINST}/usr/lib/gcc/* ${IDIR_GCC}/usr/lib/gcc/
ifeq ($(ADK_TARGET_LIB_UCLIBC),y)
	${CP} ${STAGING_DIR}/lib/crt* ${IDIR_GCC}/usr/lib
else
	${CP} ${STAGING_DIR}/usr/lib/crt* ${IDIR_GCC}/usr/lib
	${CP} ${STAGING_DIR}/usr/lib/libc_nonshared.a ${IDIR_GCC}/usr/lib
endif
	rm -rf ${IDIR_GCC}/usr/lib/gcc/*/*/install-tools

include ${TOPDIR}/mk/pkg-bottom.mk
