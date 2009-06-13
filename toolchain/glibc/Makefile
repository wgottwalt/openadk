# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

_IN_CVTC=		1

include $(TOPDIR)/rules.mk
include ../rules.mk
include Makefile.inc

include ${TOPDIR}/mk/buildhlp.mk

ifeq ($(ADK_DEVICE_NO_FPU),y)
GLIBC_CONFOPTS:=          --without-fp
endif

GLIBC_BUILD_DIR:=	${WRKDIR}/$(PKG_NAME)-$(PKG_VERSION)-headers
GLIBC_BUILD_DIR2:=	${WRKDIR}/$(PKG_NAME)-$(PKG_VERSION)-final

$(WRKBUILD)/.headers_configure:
	mkdir -p $(GLIBC_BUILD_DIR)
	(cd $(GLIBC_BUILD_DIR); \
		$(WRKBUILD)/configure \
		--prefix=/usr \
		--build=$(GNU_HOST_NAME) \
		--host=$(REAL_GNU_TARGET_NAME) \
		--disable-nls \
		--without-cvs \
		--with-__thread \
		--with-tls \
		--enable-add-ons \
		--enable-kernel="2.6.0" \
		--disable-sanity-checks \
		--with-headers=$(TOOLCHAIN_SYSROOT)/usr/include \
		--with-sysroot=$(TOOLCHAIN_SYSROOT) \
		${GLIBC_CONFOPTS} \
	);
	touch $@

$(WRKBUILD)/.headers: $(WRKBUILD)/.headers_configure
	$(MAKE) -C $(GLIBC_BUILD_DIR) \
		cross-compiling=yes \
		install_root=$(TOOLCHAIN_SYSROOT) \
		CFLAGS="-DBOOTSTRAP_GCC" install-headers
	touch $(TOOLCHAIN_SYSROOT)/usr/include/gnu/stubs.h
	touch $(TOOLCHAIN_SYSROOT)/usr/include/bits/stdio_lim.h
	touch $@

$(WRKBUILD)/.configure_done: 
	mkdir -p $(GLIBC_BUILD_DIR2)
	(cd $(GLIBC_BUILD_DIR2); \
		PATH='${TARGET_PATH}' \
		BUILD_CC=gcc \
		CFLAGS="$(TARGET_CFLAGS_ARCH) -O2 -pipe" \
		CC=${REAL_GNU_TARGET_NAME}-gcc \
		AR=${REAL_GNU_TARGET_NAME}-ar \
		RANLIB=${REAL_GNU_TARGET_NAME}-ranlib \
		LD=${REAL_GNU_TARGET_NAME}-ld \
		libc_cv_forced_unwind=yes \
		libc_cv_c_cleanup=yes \
		libc_cv_gnu99_inline=yes \
		$(WRKBUILD)/configure \
		--prefix=/usr \
		--build=$(GNU_HOST_NAME) \
		--host=$(REAL_GNU_TARGET_NAME) \
		--disable-nls \
		--without-cvs \
		--disable-profile \
		--disable-debug \
		--without-gd \
		--enable-shared \
		--enable-stackguard-randomization \
		--with-__thread \
		--with-tls \
		--enable-add-ons \
		--enable-kernel=2.6.0 \
		--with-headers=$(TOOLCHAIN_SYSROOT)/usr/include \
		${GLIBC_CONFOPTS} \
	);
	touch $@

$(WRKBUILD)/.compiled:
	PATH='${TARGET_PATH}' \
	CFLAGS="$(TARGET_CFLAGS_ARCH) -O2 -pipe" \
	CC=${REAL_GNU_TARGET_NAME}-gcc \
	LD=${REAL_GNU_TARGET_NAME}-ld \
	RANLIB=${REAL_GNU_TARGET_NAME}-ranlib \
	$(MAKE) -C $(GLIBC_BUILD_DIR2) lib \
		cross-compiling=yes
	touch $@

$(WRKBUILD)/.installed:
	PATH='${TARGET_PATH}' \
	$(MAKE) -C $(GLIBC_BUILD_DIR2) \
		install_root=$(STAGING_DIR) \
		install-lib-all install-headers \
		install-others cross-compiling=yes
	touch $(STAGING_DIR)/usr/include/gnu/stubs.h
	touch $@

include ${TOPDIR}/mk/toolchain.mk
