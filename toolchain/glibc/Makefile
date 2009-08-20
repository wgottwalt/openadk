# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

#_IN_CVTC=		1

include $(TOPDIR)/rules.mk
include ../rules.mk
include Makefile.inc

include ${TOPDIR}/mk/buildhlp.mk

GLIBC_CONFOPTS:=          \
			--build=$(GNU_HOST_NAME) \
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

GLIBC_ENV:=		PATH='${TARGET_PATH}' \
			BUILD_CC=${HOSTCC} \
			CFLAGS="$(TARGET_CFLAGS_ARCH) -O2 -pipe" \
			CC=${REAL_GNU_TARGET_NAME}-gcc \
			CXX=${REAL_GNU_TARGET_NAME}-g++ \
			AR=${REAL_GNU_TARGET_NAME}-ar \
			RANLIB=${REAL_GNU_TARGET_NAME}-ranlib \
			LD=${REAL_GNU_TARGET_NAME}-ld \
			libc_cv_forced_unwind=yes \
			libc_cv_c_cleanup=yes \
			libc_cv_gnu99_inline=yes \

ifeq ($(ADK_DEVICE_NO_FPU),y)
GLIBC_CONFOPTS+=          --without-fp
endif

GLIBC_BUILD_DIR_INITIAL:=	${WRKDIR}/$(PKG_NAME)-$(PKG_VERSION)-headers
GLIBC_BUILD_DIR_FINAL:=		${WRKDIR}/$(PKG_NAME)-$(PKG_VERSION)-final

$(WRKBUILD)/.headers_configure:
	mkdir -p $(GLIBC_BUILD_DIR_INITIAL)
	(cd $(GLIBC_BUILD_DIR_INITIAL); \
		$(WRKBUILD)/configure \
		--prefix=/usr \
		--with-sysroot=$(TOOLCHAIN_SYSROOT) \
		${GLIBC_CONFOPTS} \
	);
	touch $@

$(WRKBUILD)/.headers: $(WRKBUILD)/.headers_configure
	$(MAKE) -C $(GLIBC_BUILD_DIR_INITIAL) \
		cross-compiling=yes \
		install_root=$(TOOLCHAIN_SYSROOT) \
		CFLAGS="-DBOOTSTRAP_GCC" install-headers
	touch $(TOOLCHAIN_SYSROOT)/usr/include/gnu/stubs.h
	touch $(TOOLCHAIN_SYSROOT)/usr/include/bits/stdio_lim.h
	touch $@

$(WRKBUILD)/.configured: 
	mkdir -p $(GLIBC_BUILD_DIR_FINAL)
	(cd $(GLIBC_BUILD_DIR_FINAL); \
		${GLIBC_ENV} \
		$(WRKBUILD)/configure \
			--prefix=/usr \
			--enable-shared \
			--enable-stackguard-randomization \
			${GLIBC_CONFOPTS} \
	);
	touch $@

$(WRKBUILD)/.compiled:
	${GLIBC_ENV} \
	CFLAGS="$(TARGET_CFLAGS_ARCH) -O2 -pipe" \
	$(MAKE) -C $(GLIBC_BUILD_DIR_FINAL) lib \
		cross-compiling=yes
	touch $@

$(WRKBUILD)/.installed:
	PATH='${TARGET_PATH}' \
	$(MAKE) -C $(GLIBC_BUILD_DIR_FINAL) \
		install_root=$(STAGING_DIR) \
		install-lib-all install-headers \
		install-others cross-compiling=yes
	touch $(STAGING_DIR)/usr/include/gnu/stubs.h
	touch $@

include ${TOPDIR}/mk/toolchain.mk
