# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk
include ../rules.mk
include Makefile.inc
include $(ADK_TOPDIR)/mk/os.mk

# disable SSP for libstdc++
ifeq ($(ADK_TARGET_LIB_MUSL),y)
TARGET_CFLAGS:=		$(filter-out -fstack-protector-all,$(TARGET_CFLAGS))
TARGET_CXXFLAGS:=	$(filter-out -fstack-protector-all,$(TARGET_CXXFLAGS))
endif

ifeq ($(ADK_TARGET_ARCH_XTENSA),y)
TARGET_CFLAGS:=		$(filter-out -mtext-section-literals,$(TARGET_CFLAGS))
TARGET_CXXFLAGS:=	$(filter-out -mtext-section-literals,$(TARGET_CXXFLAGS))
endif

# for uClinux, we need to filter out some flags
ifeq ($(ADK_TARGET_UCLINUX),y)
TARGET_CFLAGS:=		$(filter-out -msep-data,$(TARGET_CFLAGS))
TARGET_CXXFLAGS:=	$(filter-out -msep-data,$(TARGET_CXXFLAGS))
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
			--disable-libcilkrts \
			--disable-libquadmath-support \
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

ifeq ($(ADK_TARGET_WITH_NPTL),y)
ifeq ($(ADK_TARGET_LIB_WITHOUT_THREADS),)
GCC_CONFOPTS+=         --enable-tls --enable-threads --enable-libatomic
else
GCC_CONFOPTS+=         --disable-tls --disable-threads --disable-libatomic
endif
endif

ifeq ($(ADK_TARGET_WITH_LT),y)
GCC_CONFOPTS+=         --disable-tls --disable-threads --disable-libatomic
endif

ifeq ($(ADK_TARGET_UCLINUX)$(ADK_TARGET_USE_STATIC_LIBS),y)
GCC_FINAL_CONFOPTS+=	--disable-shared
else
# uClibc/glibc uses libgcc_s.so.1 for pthread_cancel with dlopen
ifeq (ADK_TARGET_LIB_MUSL),y)
GCC_FINAL_CONFOPTS+=	--enable-shared='libstdc++'
else
GCC_FINAL_CONFOPTS+=	--enable-shared='libstdc++,libgcc'
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

#
# architecture specific
#
ifneq ($(ADK_TARGET_GCC_CPU),)
GCC_CONFOPTS+=		--with-cpu=$(ADK_TARGET_GCC_CPU)
endif

ifneq ($(ADK_TARGET_GCC_ARCH),)
GCC_CONFOPTS+=		--with-arch=$(ADK_TARGET_GCC_ARCH)
endif

ifneq ($(ADK_TARGET_FLOAT),)
GCC_CONFOPTS+=		--with-float=$(ADK_TARGET_FLOAT)
endif

ifneq ($(ADK_TARGET_FPU),)
GCC_CONFOPTS+=		--with-fpu=$(ADK_TARGET_FPU)
endif

ifeq ($(ADK_TARGET_ARCH_ARM_WITH_THUMB),y)
GCC_CONFOPTS+=		--with-mode=thumb
endif

ifeq ($(ADK_CPU_CF),y)
GCC_CONFOPTS+=		--enable-multilib --with-arch=cf
endif

ifeq ($(ADK_TARGET_ARCH_M68K)$(ADK_TARGET_ARCH_X86_64)$(ADK_TARGET_ARCH_X86),)
GCC_FINAL_CONFOPTS+=	--disable-biarch --disable-multilib
endif

ifeq ($(ADK_TARGET_ARCH_SH),y)
ifeq ($(ADK_TARGET_LITTLE_ENDIAN),y)
GCC_CONFOPTS+=		--with-endian=little
else
GCC_CONFOPTS+=          --with-endian=big
endif
GCC_FINAL_CONFOPTS+=	--with-multilib-list=m4,m4-nofpu
endif

ifeq ($(ADK_TARGET_ARCH_X86),y)
ifeq ($(ADK_TARGET_KERNEL_64),y)
GCC_FINAL_CONFOPTS+=	--enable-biarch --enable-targets=all --disable-multilib
else
GCC_FINAL_CONFOPTS+=    --disable-biarch --disable-multilib
endif
endif

ifeq ($(ADK_TARGET_ARCH_X86_64),y)
ifneq ($(ADK_TARGET_ABI_X32),)
GCC_FINAL_CONFOPTS+=	--with-abi=x32
else
GCC_FINAL_CONFOPTS+=	--disable-biarch --disable-multilib
endif
endif

ifeq ($(ADK_TARGET_ARCH_PPC),y)
GCC_CONFOPTS+=		--with-long-double-64 --enable-secureplt
endif

ifneq ($(ADK_TARGET_MIPS_ABI),)
GCC_CONFOPTS+=		--with-abi=${ADK_TARGET_MIPS_ABI}
endif

ifeq (${ADK_MAKE_PARALLEL},y)
GCC_MAKEOPTS+=		-j${ADK_MAKE_JOBS}
endif

ifeq ($(ADK_TARGET_UCLINUX),y)
LANGUAGES:=c
else
LANGUAGES:=c,c++
endif

include ${ADK_TOPDIR}/mk/buildhlp.mk

GCC_BUILD_DIR_MINIMAL:=	$(WRKBUILD)-minimal
GCC_BUILD_DIR_INITIAL:=	$(WRKBUILD)-initial
GCC_BUILD_DIR_FINAL:=	$(WRKBUILD)-final

$(GCC_BUILD_DIR_MINIMAL)/.configured:
ifeq ($(ADK_TARGET_ARCH_XTENSA),y)
	tar xf $(ADK_TOPDIR)/target/xtensa/overlay/xtensa_$(ADK_TARGET_XTENSA).tar \
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
ifeq ($(ADK_TARGET_ARCH_SH),y)
	(cd ${STAGING_TARGET_DIR}/ && ln -sf . m4)
endif
	$(SED) '/k prot/agcc_cv_libc_provides_ssp=yes' $(WRKBUILD)/gcc/configure
	cd $(GCC_BUILD_DIR_MINIMAL); \
		PATH='$(TARGET_PATH)' \
		CC='$(HOST_CC)' \
		CXX='$(HOST_CXX)' \
		CFLAGS="-O0 -g0 -fomit-frame-pointer" \
		CXXFLAGS="-O0 -g0 -fomit-frame-pointer" \
		$(WRKBUILD)/configure \
			${GCC_CONFOPTS} \
			--enable-languages=c \
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
		CC='$(HOST_CC)' \
		CXX='$(HOST_CXX)' \
		CFLAGS="-O0 -g0 -fomit-frame-pointer" \
		CXXFLAGS="-O0 -g0 -fomit-frame-pointer" \
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
		CC='$(HOST_CC)' \
		CXX='$(HOST_CXX)' \
		CFLAGS_FOR_TARGET='$(TARGET_CFLAGS)' \
		CXXFLAGS_FOR_TARGET='$(TARGET_CXXFLAGS)' \
		$(WRKBUILD)/configure \
			${GCC_CONFOPTS} \
			${GCC_FINAL_CONFOPTS} \
			--enable-cxx-flags='-fPIC' \
			--enable-languages=$(LANGUAGES) \
			--with-build-sysroot='$${prefix}/${STAGING_HOST2TARGET}' \
			--with-sysroot='$${prefix}/${STAGING_HOST2TARGET}'
	PATH='$(TARGET_PATH)' $(MAKE) -C $(GCC_BUILD_DIR_FINAL) configure-host
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
		ln -sf $(GNU_TARGET_NAME)-gcc $(GNU_TARGET_NAME)-gcc-${PKG_VERSION} && \
		ln -sf $(GNU_TARGET_NAME)-g++ $(GNU_TARGET_NAME)-g++-${PKG_VERSION} \
	)
ifeq ($(ADK_TARGET_USE_GOLD),y)
	(cd $(TOOLCHAIN_DIR)/usr/bin && \
		ln -sf $(GNU_TARGET_NAME)-ld.gold $(GNU_TARGET_NAME)-ld)
else
ifeq (ADK_TOOLCHAIN_BINUTILS_2_20_1),)
	(cd $(TOOLCHAIN_DIR)/usr/bin && \
		ln -sf $(GNU_TARGET_NAME)-ld.bfd $(GNU_TARGET_NAME)-ld)
endif
endif
	cd $(STAGING_TARGET_DIR)/lib && \
		ln -sf libstdc++.so.6.0.$(LIBSTDCXXVER) libstdc++.so && \
		ln -sf libstdc++.so.6.0.$(LIBSTDCXXVER) libstdc++.so.6
	# cleanup unneeded docs
	rm -rf $(TOOLCHAIN_DIR)/usr/share
ifeq ($(ADK_TARGET_ARCH_M68K),y)
	# create gcc wrapper for uClinux/m68k
	echo "#!/bin/sh" > $(TOOLCHAIN_DIR)/usr/bin/adk-uclinux-gcc
	echo "exec ${GNU_TARGET_NAME}-gcc \"\$$@\" -specs $(ADK_TOPDIR)/toolchain/gcc/m68k-uclinux-gcc.specs" >> $(TOOLCHAIN_DIR)/usr/bin/adk-uclinux-gcc
	chmod a+x $(TOOLCHAIN_DIR)/usr/bin/adk-uclinux-gcc
endif
ifeq ($(ADK_TARGET_ARCH_ARM),y)
	# create gcc wrapper for uClinux/arm
	echo "#!/bin/sh" > $(TOOLCHAIN_DIR)/usr/bin/adk-uclinux-gcc
	echo "exec ${GNU_TARGET_NAME}-gcc \"\$$@\" -specs $(ADK_TOPDIR)/toolchain/gcc/arm-uclinux-gcc.specs" >> $(TOOLCHAIN_DIR)/usr/bin/adk-uclinux-gcc
	chmod a+x $(TOOLCHAIN_DIR)/usr/bin/adk-uclinux-gcc
endif
	touch $@

include ${ADK_TOPDIR}/mk/toolchain.mk
