# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		glibc
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		2.19.90
PKG_REPO:=		git://sourceware.org/git/glibc.git
endif
ifeq ($(ADK_TARGET_LIB_GLIBC_2_20),y)
PKG_VERSION:=		2.20
PKG_SITES:=		${MASTER_SITE_GNU:=glibc/}
PKG_RELEASE:=		1
PKG_HASH:=		f84b6d42aecc288d593c397b0a3d02260a33ee686bce0c634eb9b32798f36ba5
endif
ifeq ($(ADK_TARGET_LIB_GLIBC_2_19),y)
PKG_VERSION:=		2.19
PKG_SITES:=		${MASTER_SITE_GNU:=glibc/}
PKG_RELEASE:=		1
PKG_HASH:=		2d3997f588401ea095a0b27227b1d50cdfdd416236f6567b564549d3b46ea2a2
endif
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.xz
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
