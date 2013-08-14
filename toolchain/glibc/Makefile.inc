# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		glibc
PKG_VERSION:=		2.17
PKG_RELEASE:=		1
PKG_MD5SUM:=		8a7f11b9ac5d0d5efa4c82175b5a9c1b
PKG_SITES:=		${MASTER_SITE_GNU:=glibc/}
GLIBC_CONFOPTS:=	--build=$(GNU_HOST_NAME) \
			--host=$(REAL_GNU_TARGET_NAME) \
			--with-headers=$(STAGING_TARGET_DIR)/usr/include \
			--disable-sanity-checks \
			--disable-nls \
			--without-cvs \
			--disable-profile \
			--disable-debug \
			--without-gd \
			--disable-nscd \
			--with-__thread \
			--with-tls \
			--enable-kernel="2.6.0" \
			--enable-add-ons
GLIBC_ENV:=             PATH='${TARGET_PATH}' \
                        BUILD_CC=${CC_FOR_BUILD} \
                        CFLAGS="$(TARGET_CFLAGS_LIBC)" \
                        CC=${REAL_GNU_TARGET_NAME}-gcc \
                        CXX=${REAL_GNU_TARGET_NAME}-g++ \
                        AR=${REAL_GNU_TARGET_NAME}-ar \
                        RANLIB=${REAL_GNU_TARGET_NAME}-ranlib \
                        libc_cv_forced_unwind=yes \
			libc_cv_cc_with_libunwind=yes \
                        libc_cv_c_cleanup=yes \
                        libc_cv_gnu99_inline=yes \
			libc_cv_sparc64_tls=yes \
			libc_cv_slibdir="/lib" \
			libc_cv_initfini_array=yes \
