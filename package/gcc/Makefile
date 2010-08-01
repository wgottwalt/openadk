# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk
include ${TOPDIR}/toolchain/gcc/Makefile.inc

PKG_DESCR:=		GNU compiler collection
PKG_SECTION:=		lang
PKG_OPTS:=		noremove
PKG_DEPENDS:=		libgmp mpfr
PKG_BUILDDEP+=		gmp mpfr

ifeq ($(ADK_TARGET_LIB_UCLIBC),y)
PKG_DEPENDS+=		uclibc-dev
PKG_BUILDDEP+=		uclibc
endif
ifeq ($(ADK_TARGET_LIB_EGLIBC),y)
PKG_DEPENDS+=		eglibc-dev
PKG_BUILDDEP+=		eglibc
endif
ifeq ($(ADK_TARGET_LIB_GLIBC),y)
PKG_DEPENDS+=		glibc-dev
PKG_BUILDDEP+=		glibc
endif

PKG_TARGET_DEPENDS:=	!ag241

WRKBUILD=               ${WRKDIR}/${PKG_NAME}-obj

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GCC,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

TCFLAGS:=		''
TCPPFLAGS:=		''

ifeq ($(ADK_LINUX_64),y)
CONFIGURE_ARGS+=       --with-abi=64
endif

CONFIGURE_ARGS+=	--enable-languages=c,c++ \
			--host=$(REAL_GNU_TARGET_NAME) \
			--target=$(REAL_GNU_TARGET_NAME) \
			--disable-__cxa_atexit \
			--without-headers \
			--libexecdir=/usr/lib \
			--disable-libssp \
			--disable-nls \
			--disable-sjlj-exceptions \
			--disable-biarch \
			--disable-libmudflap \
			--disable-libgomp \
			--disable-multilib \
			--disable-libstdcxx-pch

post-install:
	${INSTALL_DIR} ${IDIR_GCC}/usr/lib/gcc ${IDIR_GCC}/usr/bin
	${INSTALL_DIR} ${IDIR_GCC}/lib ${IDIR_GCC}/usr/include/c++
	${INSTALL_BIN} ${WRKINST}/usr/bin/gcc ${IDIR_GCC}/usr/bin/
	${INSTALL_BIN} ${WRKINST}/usr/bin/g++ ${IDIR_GCC}/usr/bin/
	cd ${IDIR_GCC}/usr/bin/ && ln -sf g++ c++
	cd ${IDIR_GCC}/usr/bin/ && ln -sf gcc cc
	${INSTALL_BIN} ${WRKINST}/usr/bin/cpp ${IDIR_GCC}/usr/bin/
	${CP} ${WRKINST}/usr/lib/libstdc++*so* ${IDIR_GCC}/usr/lib/
	${CP} ${WRKINST}/usr/include/c++/* ${IDIR_GCC}/usr/include/c++/
	cd ${IDIR_GCC}/lib && ln -sf ../usr/bin/cpp .
	${CP} ${WRKINST}/usr/lib/gcc/* ${IDIR_GCC}/usr/lib/gcc/
	rm -rf ${IDIR_GCC}/usr/lib/gcc/*/*/install-tools

include ${TOPDIR}/mk/pkg-bottom.mk
