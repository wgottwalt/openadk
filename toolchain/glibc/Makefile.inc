# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		glibc
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		git
PKG_REPO:=		git://sourceware.org/git/glibc.git
else
PKG_VERSION:=		$(ADK_LIBC_VERSION)
PKG_SITES:=		${MASTER_SITE_GNU:=glibc/}
endif
PKG_RELEASE:=		1
PKG_MD5SUM:=		e26b8cc666b162f999404b03970f14e4
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
TARGET_CFLAGS:=		$(filter-out -fstack-protector-all,$(TARGET_CFLAGS))
TARGET_LDFLAGS:=	$(filter-out -fstack-protector-all,$(TARGET_LDFLAGS))
GLIBC_ENV:=             PATH='${TARGET_PATH}' \
			CONFIG_SHELL='$(strip ${SHELL})' \
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
