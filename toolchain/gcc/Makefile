# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk
include ../rules.mk
include Makefile.inc

# disable SSP for libstdc++
ifeq ($(ADK_TARGET_LIB_MUSL),y)
TARGET_CXXFLAGS:=	$(filter-out -fstack-protector-all,$(TARGET_CXXFLAGS))
endif

GCC_CONFOPTS:=		--prefix=$(TOOLCHAIN_DIR)/usr \
			--with-bugurl="http://www.openadk.org/" \
			--build=$(GNU_HOST_NAME) \
			--host=$(GNU_HOST_NAME) \
			--target=$(GNU_TARGET_NAME) \
			--with-gmp=$(STAGING_HOST_DIR)/usr \
			--with-mpfr=$(STAGING_HOST_DIR)/usr \
			--with-libelf=$(STAGING_HOST_DIR)/usr \
			--disable-__cxa_atexit \
			--with-gnu-ld \
			--with-gnu-as \
			--disable-libsanitizer \
			--disable-install-libiberty \
			--disable-libitm \
			--disable-libmudflap \
			--disable-libgomp \
			--disable-decimal-float \
			--disable-libstdcxx-pch \
			--disable-ppl-version-check \
			--disable-cloog-version-check \
			--with-system-zlib \
			--without-ppl \
			--without-cloog \
			--without-isl \
			--disable-nls

GCC_FINAL_CONFOPTS:=

ifneq ($(ADK_TARGET_WITH_NPTL),)
GCC_CONFOPTS+=         --enable-tls --enable-threads --enable-libatomic
else
GCC_CONFOPTS+=         --disable-tls --disable-threads --disable-libatomic
endif

ifneq ($(ADK_LINUX_XTENSA)$(ADK_LINUX_M68K),y)
GCC_FINAL_CONFOPTS+=	--enable-cxx-flags='$(TARGET_CXXFLAGS)'
endif

# uClibc/glibc uses libgcc_s.so.1 for pthread_cancel with dlopen
ifeq (ADK_TARGET_LIB_MUSL),y)
GCC_FINAL_CONFOPTS+=	--enable-shared='libstdc++'
else
GCC_FINAL_CONFOPTS+=	--enable-shared='libstdc++,libgcc'
endif

ifeq ($(ADK_LINUX_SH)$(ADK_LINUX_X86_64)$(ADK_LINUX_X86),)
GCC_FINAL_CONFOPTS+=	--disable-biarch --disable-multilib
endif

ifeq ($(ADK_LINUX_SH),y)
ifeq ($(ADK_little),y)
GCC_CONFOPTS+=		--with-endian=little
else
GCC_CONFOPTS+=          --with-endian=big
endif
GCC_FINAL_CONFOPTS+=	--enable-multilib --with-multilib-list=m4,m4-nofpu
endif

ifeq ($(ADK_LINUX_X86),y)
ifeq ($(ADK_TARGET_KERNEL_64),y)
GCC_FINAL_CONFOPTS+=	--enable-biarch --enable-targets=all --disable-multilib
else
GCC_FINAL_CONFOPTS+=    --disable-biarch --disable-multilib
endif
endif

ifeq ($(ADK_LINUX_X86_64),y)
ifeq ($(ADK_x32),y)
GCC_FINAL_CONFOPTS+=	--with-abi=x32
endif
ifeq ($(ADK_64),y)
GCC_FINAL_CONFOPTS+=	--disable-biarch --disable-multilib
endif
endif

ifeq ($(ADK_TOOLCHAIN_WITH_SSP),y)
GCC_FINAL_CONFOPTS+=	--enable-libssp
else
GCC_FINAL_CONFOPTS+=	--disable-libssp
endif

ifeq ($(ADK_TOOLCHAIN_WITH_LTO),y)
GCC_CONFOPTS+=		--enable-lto
else
GCC_CONFOPTS+=		--disable-lto
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

ifeq ($(ADK_TARGET_ARCH),arm)
GCC_CONFOPTS+=		--with-float=$(ADK_TARGET_FLOAT)
ifneq ($(ADK_TARGET_FPU),)
GCC_CONFOPTS+=		--with-fpu=$(ADK_TARGET_FPU)
endif
endif

ifeq ($(ADK_CPU_ARM926EJ_S),y)
GCC_CONFOPTS+=		--with-arch=armv5te --with-tune=arm926ej-s
endif

ifeq ($(ADK_CPU_ARM1176JZF_S),y)
GCC_CONFOPTS+=		--with-arch=armv6 --with-tune=arm1176jzf-s
endif

ifeq ($(ADK_CPU_CORTEX_A9),y)
GCC_CONFOPTS+=		--with-arch=armv7-a --with-tune=cortex-a9
endif

ifeq ($(ADK_CPU_SPARC_V9),y)
GCC_CONFOPTS+=		--with-cpu=ultrasparc
endif


ifneq ($(ADK_TARGET_MIPS_ABI),)
GCC_CONFOPTS+=		--with-abi=${ADK_TARGET_MIPS_ABI}
endif

ifeq (${ADK_MAKE_PARALLEL},y)
GCC_MAKEOPTS+=		-j${ADK_MAKE_JOBS}
endif

LANGUAGES:=c,c++

include ${ADK_TOPDIR}/mk/buildhlp.mk

GCC_BUILD_DIR_MINIMAL:=	$(WRKBUILD)-minimal
GCC_BUILD_DIR_INITIAL:=	$(WRKBUILD)-initial
GCC_BUILD_DIR_FINAL:=	$(WRKBUILD)-final

$(GCC_BUILD_DIR_MINIMAL)/.configured:
ifeq ($(ADK_LINUX_XTENSA),y)
	tar xf $(ADK_TOPDIR)/target/xtensa/overlay/xtensa_dc232b.tar \
		--strip-components=1 -C $(WRKSRC) gcc
endif
	mkdir -p $(GCC_BUILD_DIR_MINIMAL)
	# these symlinks are very important, do not remove
	rm -rf $(TOOLCHAIN_DIR)/usr/$(GNU_TARGET_NAME)/sys-include
	mkdir -p $(TOOLCHAIN_DIR)/usr/$(GNU_TARGET_NAME)
	(cd $(TOOLCHAIN_DIR)/usr/$(GNU_TARGET_NAME); \
		ln -s ../$(STAGING_HOST2TARGET)/usr/include sys-include)
	rm -rf ${TOOLCHAIN_DIR}/usr/$(GNU_TARGET_NAME)/lib
	(cd $(TOOLCHAIN_DIR)/usr/$(GNU_TARGET_NAME); \
		ln -s ../$(STAGING_HOST2TARGET)/lib lib)
ifeq ($(ADK_LINUX_SH),y)
	(cd ${STAGING_TARGET_DIR}/ && ln -sf . m4 && ln -sf . m4-nofpu)
endif
	$(SED) '/k prot/agcc_cv_libc_provides_ssp=yes' $(WRKBUILD)/gcc/configure
	cd $(GCC_BUILD_DIR_MINIMAL); \
		PATH='$(TARGET_PATH)' \
		CFLAGS="-O0 -g0" \
		CXXFLAGS="-O0 -g0" \
		$(WRKBUILD)/configure \
			${GCC_CONFOPTS} \
			--enable-languages=c \
			--disable-multilib \
			--disable-libssp \
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
	cd $(GCC_BUILD_DIR_INITIAL); \
		PATH='$(TARGET_PATH)' \
		CFLAGS="-O0 -g0" \
		CXXFLAGS="-O0 -g0" \
		$(WRKBUILD)/configure \
			${GCC_CONFOPTS} \
			${GCC_FINAL_CONFOPTS} \
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
	cd $(GCC_BUILD_DIR_FINAL); \
		PATH='$(TARGET_PATH)' \
		$(WRKBUILD)/configure \
			${GCC_CONFOPTS} \
			${GCC_FINAL_CONFOPTS} \
			--enable-languages=$(LANGUAGES) \
			--with-build-sysroot='$${prefix}/${STAGING_HOST2TARGET}' \
			--with-sysroot='$${prefix}/${STAGING_HOST2TARGET}'
	touch $@

$(WRKBUILD)/.compiled: $(GCC_BUILD_DIR_FINAL)/.configured
	cd $(GCC_BUILD_DIR_FINAL); \
		PATH='$(TARGET_PATH)' \
		$(MAKE) ${GCC_MAKEOPTS} all
	touch $@

$(WRKBUILD)/.installed: $(WRKBUILD)/.compiled
	cd $(GCC_BUILD_DIR_FINAL); \
		PATH='$(TARGET_PATH)' \
		$(MAKE) install
	# remove duplicate tools, convert hardlinks to symlinks
	set -e; \
	cd $(TOOLCHAIN_DIR)/usr/$(GNU_TARGET_NAME)/bin; \
		for app in ar as c++ g++ gcc ld ld.gold ld.bfd nm objcopy objdump ranlib strip; do \
			ln -sf ../../bin/$(GNU_TARGET_NAME)-$${app} $${app}; \
		done;
	(cd $(TOOLCHAIN_DIR)/usr/bin && \
		ln -sf $(GNU_TARGET_NAME)-gcc $(GNU_TARGET_NAME)-gcc-${PKG_VERSION})
ifeq ($(ADK_TARGET_USE_GOLD),y)
	(cd $(TOOLCHAIN_DIR)/usr/bin && \
		ln -sf $(GNU_TARGET_NAME)-ld.gold $(GNU_TARGET_NAME)-ld)
else
	(cd $(TOOLCHAIN_DIR)/usr/bin && \
		ln -sf $(GNU_TARGET_NAME)-ld.bfd $(GNU_TARGET_NAME)-ld)
endif
	cd $(STAGING_TARGET_DIR)/lib && \
		ln -sf libstdc++.so.6.0.19 libstdc++.so && \
		ln -sf libstdc++.so.6.0.19 libstdc++.so.6
	# cleanup unneeded docs
	rm -rf $(TOOLCHAIN_DIR)/usr/share
	touch $@

include ${ADK_TOPDIR}/mk/toolchain.mk
