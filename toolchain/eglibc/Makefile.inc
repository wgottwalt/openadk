# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		eglibc
PKG_VERSION:=		2.16
PKG_RELEASE:=		1
PKG_MD5SUM:=		97b0956c312e747dcead4c9459ac2aa5
PKG_SITES:=		http://openadk.org/distfiles/
EGLIBC_CONFOPTS:=	--build=$(GNU_HOST_NAME) \
			--without-cvs \
			--disable-profile \
			--disable-debug \
			--enable-kernel=2.6.0 \
			--without-gd \
			--with-__thread \
			--with-tls \
			--enable-add-ons \
			$(NLS)
EGLIBC_ENV:=		PATH='${TARGET_PATH}' \
			BUILD_CC=${CC_FOR_BUILD} \
			GCC_HONOUR_COPTS=s \
			CFLAGS="$(TARGET_CFLAGS)" \
			CC=${REAL_GNU_TARGET_NAME}-gcc \
			CXX=${REAL_GNU_TARGET_NAME}-g++ \
			AR=${REAL_GNU_TARGET_NAME}-ar \
			RANLIB=${REAL_GNU_TARGET_NAME}-ranlib \
			libc_cv_cc_with_libunwind=no \
			libc_cv_forced_unwind=yes \
			libc_cv_c_cleanup=yes \
			libc_cv_gnu99_inline=yes \
			libc_cv_initfini_array=yes \
			libc_cv_slibdir="/lib"
