# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		glibc
PKG_VERSION:=		2.19
PKG_RELEASE:=		1
PKG_MD5SUM:=		5374d29864b583622b62bfc6b8429418
PKG_SITES:=		${MASTER_SITE_GNU:=glibc/}
GLIBC_CONFOPTS:=	--build=$(GNU_HOST_NAME) \
			--host=$(GNU_TARGET_NAME) \
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
			--enable-kernel="2.6.32" \
			--enable-add-ons
GLIBC_ENV:=             PATH='${TARGET_PATH}' \
                        BUILD_CC=${CC_FOR_BUILD} \
                        CFLAGS="$(TARGET_CFLAGS_LIBC)" \
                        CC=${GNU_TARGET_NAME}-gcc \
                        CXX=${GNU_TARGET_NAME}-g++ \
                        AR=${GNU_TARGET_NAME}-ar \
                        RANLIB=${GNU_TARGET_NAME}-ranlib \
                        libc_cv_forced_unwind=yes \
			libc_cv_cc_with_libunwind=yes \
                        libc_cv_c_cleanup=yes \
                        libc_cv_gnu99_inline=yes \
			libc_cv_sparc64_tls=yes \
			libc_cv_slibdir="/lib" \
			libc_cv_initfini_array=yes \
