# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		glibc
PKG_VERSION:=		2.19
PKG_RELEASE:=		1
PKG_MD5SUM:=		5374d29864b583622b62bfc6b8429418
PKG_SITES:=		${MASTER_SITE_GNU:=glibc/}
ifeq ($(ADK_TARGET_ABI_32),y)
GLIBC_TARGET_NAME:=	i686-openadk-linux-gnu
else
GLIBC_TARGET_NAME:=	$(GNU_TARGET_NAME)
endif
GLIBC_CONFOPTS:=	--build=$(GNU_HOST_NAME) \
			--host=$(GLIBC_TARGET_NAME) \
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
			SHELL='${SHELL}' \
                        BUILD_CC=${CC_FOR_BUILD} \
                        CFLAGS="$(TARGET_CFLAGS)" \
                        CC="${TARGET_CC}" \
                        CXX="${TARGET_CXX}" \
                        AR="${TARGET_AR}" \
                        RANLIB="${TARGET_RANLIB}" \
                        libc_cv_forced_unwind=yes \
			libc_cv_cc_with_libunwind=yes \
                        libc_cv_c_cleanup=yes \
                        libc_cv_gnu99_inline=yes \
			libc_cv_initfini_array=yes \
