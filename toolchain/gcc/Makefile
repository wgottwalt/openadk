# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include ../rules.mk

TARGET_CFLAGS:=	$(filter-out -fstack-protector,$(TARGET_CFLAGS))

include Makefile.inc

GCC_CONFOPTS=		--prefix=$(STAGING_HOST_DIR) \
			--with-bugurl="http://www.openadk.org/" \
			--build=$(GNU_HOST_NAME) \
			--host=$(GNU_HOST_NAME) \
			--target=$(GNU_TARGET_NAME) \
			--with-gmp=$(STAGING_HOST_DIR) \
			--with-mpfr=$(STAGING_HOST_DIR) \
			--with-libelf=$(STAGING_HOST_DIR) \
			--disable-__cxa_atexit \
			--with-gnu-ld \
			--with-gnu-as \
			--disable-libsanitizer \
			--disable-libitm \
			--disable-libmudflap \
			--disable-libgomp \
			--disable-decimal-float \
			--disable-libstdcxx-pch \
			--disable-ppl-version-check \
			--disable-cloog-version-check \
			--without-ppl \
			--without-cloog \
			--without-isl \
			--disable-nls

ifeq ($(ADK_TOOLCHAIN_GCC_SJLJ),y)
GCC_CONFOPTS+=		--enable-sjlj-exceptions
else
GCC_CONFOPTS+=		--disable-sjlj-exceptions
endif

ifeq ($(ADK_LINUX_SH)$(ADK_LINUX_X86_64),)
GCC_CONFOPTS+=		--disable-biarch --disable-multilib
endif
ifeq ($(ADK_LINUX_SH),y)
GCC_CONFOPTS+=		--with-multilib-list=m4,m4-nofpu
endif
ifeq ($(ADK_LINUX_X86_64),y)
ifeq ($(ADK_x32),y)
GCC_CONFOPTS+=		--with-multilib-list=mx32
else
GCC_CONFOPTS+=		--disable-biarch --disable-multilib
endif
endif

ifeq ($(ADK_TOOLCHAIN_GCC_SSP),y)
GCC_CONFOPTS+=		--enable-libssp
else
GCC_CONFOPTS+=		--disable-libssp
endif

ifeq ($(ADK_TOOLCHAIN_GCC_LTO),y)
GCC_CONFOPTS+=		--enable-lto
else
GCC_CONFOPTS+=		--disable-lto
endif

ifeq ($(ARCH),m68k)
ifeq ($(ADK_TARGET_LIBC),uclibc)
GCC_CONFOPTS+=		--disable-tls
else
GCC_CONFOPTS+=		--enable-tls
endif
else
GCC_CONFOPTS+=		--enable-tls
endif

ifeq ($(ADK_LINUX_PPC),y)
ifeq ($(ADK_TARGET_LIBC),uclibc)
GCC_CONFOPTS+=		--disable-target-optspace --with-long-double-128 --enable-secureplt
else
GCC_CONFOPTS+=		--disable-target-optspace --with-long-double-64 --enable-secureplt
endif
else
GCC_CONFOPTS+=		--enable-target-optspace
endif

ifeq ($(ARCH),arm)
GCC_CONFOPTS+=		--with-float=$(ADK_TARGET_FLOAT)
GCC_CONFOPTS+=		--with-mode=$(ADK_TARGET_ARM_MODE)
endif

ifeq ($(ADK_CPU_ARM926EJ_S),y)
GCC_CONFOPTS+=          --with-arch=armv5te --with-tune=arm1176jzf-s
endif

ifeq ($(ADK_CPU_ARM1176JZF_S),y)
GCC_CONFOPTS+=          --with-arch=armv6 --with-tune=arm1176jzf-s --with-fpu=vfp
endif

ifeq ($(ADK_CPU_CORTEX_A9),y)
GCC_CONFOPTS+=          --with-arch=armv7-a --with-tune=cortex-a9 --with-fpu=neon
endif

ifeq ($(ADK_CPU_SPARC_V9),y)
GCC_CONFOPTS+=          --with-cpu=ultrasparc
endif

ifneq ($(ADK_TARGET_MIPS_ABI),)
GCC_CONFOPTS+=		--with-abi=${ADK_TARGET_MIPS_ABI}
endif

ifeq (${ADK_MAKE_PARALLEL},y)
GCC_MAKEOPTS+=		-j${ADK_MAKE_JOBS}
endif

LANGUAGES:=c
ifeq ($(ADK_TOOLCHAIN_GCC_CXX),y)
LANGUAGES:=${LANGUAGES},c++
endif

include ${TOPDIR}/mk/buildhlp.mk

GCC_BUILD_DIR_MINIMAL:=	$(WRKBUILD)-minimal
GCC_BUILD_DIR_INITIAL:=	$(WRKBUILD)-initial
GCC_BUILD_DIR_FINAL:=	$(WRKBUILD)-final

$(GCC_BUILD_DIR_MINIMAL)/.configured:
	mkdir -p $(GCC_BUILD_DIR_MINIMAL)
	# these symlinks are very important, do not remove
	rm -rf $(STAGING_HOST_DIR)/$(GNU_TARGET_NAME)/sys-include
	ln -sf ${STAGING_TARGET_DIR}/usr/include $(STAGING_HOST_DIR)/$(GNU_TARGET_NAME)/sys-include
	rm -rf ${STAGING_HOST_DIR}/$(GNU_TARGET_NAME)/lib
	ln -sf ${STAGING_TARGET_DIR}/lib $(STAGING_HOST_DIR)/$(GNU_TARGET_NAME)/lib
ifeq ($(ADK_LINUX_SH),y)
	(cd ${STAGING_TARGET_DIR}/ && ln -sf . m4 && ln -sf . m4-nofpu)
endif
	sed -i '/k prot/agcc_cv_libc_provides_ssp=yes' $(WRKBUILD)/gcc/configure
	cd $(GCC_BUILD_DIR_MINIMAL); PATH='$(TARGET_PATH)' \
		CFLAGS="-O0 -g0" \
		CXXFLAGS="-O0 -g0" \
		$(WRKBUILD)/configure \
			${GCC_CONFOPTS} \
			--enable-languages=c \
			--disable-shared \
			--without-headers
	touch $@

$(GCC_BUILD_DIR_MINIMAL)/.compiled: $(GCC_BUILD_DIR_MINIMAL)/.configured
	PATH='$(TARGET_PATH)' $(MAKE) ${GCC_MAKEOPTS} -C $(GCC_BUILD_DIR_MINIMAL) all-gcc
	touch $@

$(WRKBUILD)/.headers: $(GCC_BUILD_DIR_MINIMAL)/.compiled
	PATH='$(TARGET_PATH)' $(MAKE) -C $(GCC_BUILD_DIR_MINIMAL) install-gcc
	touch $@

$(GCC_BUILD_DIR_INITIAL)/.configured:
	mkdir -p $(GCC_BUILD_DIR_INITIAL)
	cd $(GCC_BUILD_DIR_INITIAL); PATH='$(TARGET_PATH)' \
		CFLAGS="-O0 -g0" \
		CXXFLAGS="-O0 -g0" \
		$(WRKBUILD)/configure \
			${GCC_CONFOPTS} \
			--enable-languages=c \
			--disable-shared \
			--disable-threads \
			--with-sysroot=$(STAGING_TARGET_DIR)
	touch $@


$(GCC_BUILD_DIR_INITIAL)/.compiled: $(GCC_BUILD_DIR_INITIAL)/.configured
	PATH='$(TARGET_PATH)' $(MAKE) ${GCC_MAKEOPTS} -C $(GCC_BUILD_DIR_INITIAL) all-gcc all-target-libgcc
	touch $@

$(WRKBUILD)/.configured: $(GCC_BUILD_DIR_INITIAL)/.compiled
	PATH='$(TARGET_PATH)' $(MAKE) -C $(GCC_BUILD_DIR_INITIAL) install-gcc install-target-libgcc
	touch $@

$(GCC_BUILD_DIR_FINAL)/.configured:
	mkdir -p $(GCC_BUILD_DIR_FINAL)
	cd $(GCC_BUILD_DIR_FINAL); PATH='$(TARGET_PATH)' \
		$(WRKBUILD)/configure \
			${GCC_CONFOPTS} \
			--enable-languages=$(LANGUAGES) \
			--with-build-sysroot='$${prefix}/${STAGING_HOST2TARGET}' \
			--with-sysroot='$${prefix}/${STAGING_HOST2TARGET}' \
			--enable-shared
	touch $@

$(WRKBUILD)/.compiled: $(GCC_BUILD_DIR_FINAL)/.configured
	PATH='$(TARGET_PATH)' $(MAKE) ${GCC_MAKEOPTS} -C $(GCC_BUILD_DIR_FINAL) all
	touch $@

$(WRKBUILD)/.installed: $(WRKBUILD)/.compiled
	PATH='$(TARGET_PATH)' $(MAKE) -C $(GCC_BUILD_DIR_FINAL) install
	# remove duplicate tools, convert hardlinks to symlinks
	set -e; \
	cd $(STAGING_HOST_DIR)/$(GNU_TARGET_NAME)/bin; \
		for app in ar as c++ g++ gcc ld ld.bfd nm objcopy objdump ranlib strip; do \
			ln -sf ../../bin/$(GNU_TARGET_NAME)-$${app} $${app}; \
		done;
	(cd $(STAGING_HOST_DIR)/bin && \
		ln -sf $(GNU_TARGET_NAME)-gcc $(GNU_TARGET_NAME)-gcc-${PKG_VERSION})
	# setup symlink, so that gcc/g++ find cc1plus
	(cd $(STAGING_HOST_DIR)/$(GNU_TARGET_NAME)/ && \
		ln -sf ../libexec .)
	# setup symlink, so that gcc/g++ find stddef.h
	(cd $(STAGING_HOST_DIR)/$(GNU_TARGET_NAME)/lib/ && \
		ln -sf ../../host_${CPU_ARCH}_${ADK_TARGET_LIBC}_${ADK_TARGET_SUFFIX}/lib/gcc .)
	# fix linking g++ apps with libtool
	@-test -d $(STAGING_TARGET_DIR)/lib32 && \
		cd $(STAGING_TARGET_DIR)/lib32 && \
		ln -sf libstdc++.so.6.0.18 libstdc++.so && \
		ln -sf libstdc++.so.6.0.18 libstdc++.so.6
	@-test -d $(STAGING_TARGET_DIR)/libx32 && \
		cd $(STAGING_TARGET_DIR)/libx32 && \
		ln -sf libstdc++.so.6.0.18 libstdc++.so && \
		ln -sf libstdc++.so.6.0.18 libstdc++.so.6
	@-test -d $(STAGING_TARGET_DIR)/lib64 && \
		cd $(STAGING_TARGET_DIR)/lib64 && \
		ln -sf libstdc++.so.6.0.18 libstdc++.so && \
		ln -sf libstdc++.so.6.0.18 libstdc++.so.6
	# cleanup unneeded docs
	rm -rf $(STAGING_HOST_DIR)/share
	touch $@

include ${TOPDIR}/mk/toolchain.mk
