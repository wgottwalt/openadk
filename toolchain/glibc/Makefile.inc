# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		glibc
PKG_VERSION:=		2.12.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		a8e77cd873125d9b46ca2e46ee1a13d0
PKG_SITES:=		${MASTER_SITE_GNU:=glibc/}
GLIBC_PORTS_VERSION:=	2.12
GLIBC_CONFOPTS:=	--build=$(GNU_HOST_NAME) \
			--host=$(REAL_GNU_TARGET_NAME) \
			--with-headers=$(TOOLCHAIN_SYSROOT)/usr/include \
			--disable-nls \
			--disable-sanity-checks \
			--disable-nls \
			--without-cvs \
			--disable-profile \
			--disable-debug \
			--without-gd \
			--with-__thread \
			--with-tls \
			--enable-kernel="2.6.0" \
			--enable-add-ons
GLIBC_ENV:=             PATH='${TARGET_PATH}' \
                        BUILD_CC=${HOSTCC} \
                        CFLAGS="$(TARGET_CFLAGS)" \
                        CC=${REAL_GNU_TARGET_NAME}-gcc \
                        CXX=${REAL_GNU_TARGET_NAME}-g++ \
                        AR=${REAL_GNU_TARGET_NAME}-ar \
                        RANLIB=${REAL_GNU_TARGET_NAME}-ranlib \
                        libc_cv_forced_unwind=yes \
                        libc_cv_c_cleanup=yes \
                        libc_cv_gnu99_inline=yes \
			libc_cv_sparc64_tls=yes \
