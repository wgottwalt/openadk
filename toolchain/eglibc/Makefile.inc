# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		eglibc
PKG_VERSION:=		2.19
PKG_RELEASE:=		1
PKG_MD5SUM:=		b54dfce017ee3132f7b2a8d8f46067cf
PKG_SITES:=		http://openadk.org/distfiles/
EGLIBC_CONFOPTS:=	--build=$(GNU_HOST_NAME) \
			--without-cvs \
			--disable-profile \
			--disable-debug \
			--enable-kernel=2.6.32 \
			--without-gd \
			--disable-nscd \
			--with-__thread \
			--with-tls \
			--disable-obsolete-rpc \
			--enable-add-ons \
			--disable-nls
EGLIBC_ENV:=		PATH='${TARGET_PATH}' \
			BUILD_CC=${CC_FOR_BUILD} \
			GCC_HONOUR_COPTS=s \
			CFLAGS="$(TARGET_CFLAGS_LIBC)" \
			CC=${GNU_TARGET_NAME}-gcc \
			CXX=${GNU_TARGET_NAME}-g++ \
			AR=${GNU_TARGET_NAME}-ar \
			RANLIB=${GNU_TARGET_NAME}-ranlib \
			libc_cv_cc_with_libunwind=no \
			libc_cv_forced_unwind=yes \
			libc_cv_c_cleanup=yes \
			libc_cv_gnu99_inline=yes \
			libc_cv_initfini_array=yes \
			libc_cv_slibdir="/lib"
