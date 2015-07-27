# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

_IN_CVTC=		1

include $(ADK_TOPDIR)/rules.mk
include ../rules.mk
include Makefile.inc
include ${ADK_TOPDIR}/mk/buildhlp.mk

TARGET_CFLAGS:=$(filter-out -flto,$(TARGET_CFLAGS))

ifeq ($(ADK_TARGET_HARD_FLOAT),y)
ifeq ($(ADK_TARGET_ARCH_ARM),y)
TARGET_CFLAGS+=		-Wa,-mfloat-abi=hard
endif
ifeq ($(ADK_TARGET_ARCH_MIPS),y)
TARGET_CFLAGS+=		-Wa,-mhard-float
endif
endif

ifeq ($(ADK_TARGET_SOFT_FLOAT),y)
ifeq ($(ADK_TARGET_ARCH_ARM),y)
TARGET_CFLAGS+=		-Wa,-mfloat-abi=soft
endif
ifeq ($(ADK_TARGET_ARCH_MIPS),y)
TARGET_CFLAGS+=		-Wa,-msoft-float
endif
endif

ifeq (${ADK_MAKE_PARALLEL},y)
UCLIBC_MAKEOPTS+=	-j${ADK_MAKE_JOBS}
endif

$(WRKBUILD)/.headers:
	$(SED) 's,^CROSS_COMPILE=.*,CROSS_COMPILE=$(TARGET_CROSS),g' $(WRKBUILD)/Rules.mak
ifeq ($(ADK_TARGET_LIB_UCLIBC_NG_GIT),y)
	PATH='$(HOST_PATH)' sed -e 's^KERNEL_HEADERS.*$$KERNEL_HEADERS=\"${STAGING_TARGET_DIR}/usr/include\"' \
	    $(ADK_TOPDIR)/target/$(ADK_TARGET_ARCH)/uclibc-ng.config >${WRKBUILD}/.config
else
	PATH='$(HOST_PATH)' sed -e 's^KERNEL_HEADERS.*$$KERNEL_HEADERS=\"${STAGING_TARGET_DIR}/usr/include\"' \
	    $(ADK_TOPDIR)/target/$(ADK_TARGET_ARCH)/uclibc.config >${WRKBUILD}/.config
endif
ifeq ($(ADK_TARGET_ENDIAN),little)
	$(SED) 's/.*\(ARCH_LITTLE_ENDIAN\).*/\1=y/' ${WRKBUILD}/.config
	$(SED) 's/.*\(ARCH_WANTS_LITTLE_ENDIAN\).*/\1=y/' ${WRKBUILD}/.config
	$(SED) 's/.*\(ARCH_BIG_ENDIAN\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(ARCH_WANTS_BIG_ENDIAN\).*/# \1 is not set/' ${WRKBUILD}/.config
else
	$(SED) 's/.*\(ARCH_BIG_ENDIAN\).*/\1=y/' ${WRKBUILD}/.config
	$(SED) 's/.*\(ARCH_WANTS_BIG_ENDIAN\).*/\1=y/' ${WRKBUILD}/.config
	$(SED) 's/.*\(ARCH_LITTLE_ENDIAN\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(ARCH_WANTS_LITTLE_ENDIAN\).*/# \1 is not set/' ${WRKBUILD}/.config
endif
ifeq ($(ADK_TARGET_SOFT_FLOAT),y)
	$(SED) 's/.*\(UCLIBC_HAS_FPU\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(UCLIBC_HAS_SOFT_FLOAT\).*/#\1=y/' ${WRKBUILD}/.config
endif
ifeq ($(ADK_TARGET_HARD_FLOAT),y)
	$(SED) 's/.*\(UCLIBC_HAS_FPU\).*/\1=y/' ${WRKBUILD}/.config
	$(SED) 's/.*\(UCLIBC_HAS_SOFT_FLOAT\).*/# \1 is not set/' ${WRKBUILD}/.config
endif
ifeq ($(ADK_TARGET_BINFMT_FDPIC),y)
	$(SED) 's/.*\(UCLIBC_FORMAT_FDPIC_ELF\).*/\1=y/' ${WRKBUILD}/.config
	$(SED) 's/.*\(UCLIBC_FORMAT_FLAT\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(UCLIBC_FORMAT_FLAT_SEP_DATA\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(UCLIBC_FORMAT_FLAT_SHARED\).*/# \1 is not set/' ${WRKBUILD}/.config
endif
ifeq ($(ADK_TARGET_BINFMT_FLAT),y)
ifeq ($(ADK_TARGET_BINFMT_FLAT_ONE),y)
	$(SED) 's/.*\(UCLIBC_FORMAT_FLAT\).*/\1=y/' ${WRKBUILD}/.config
	$(SED) 's/.*\(UCLIBC_FORMAT_FLAT_SEP_DATA\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(UCLIBC_FORMAT_FLAT_SHARED\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(UCLIBC_FORMAT_FDPIC_ELF\).*/# \1 is not set/' ${WRKBUILD}/.config
endif
ifeq ($(ADK_TARGET_BINFMT_FLAT_SEP_DATA),y)
	$(SED) 's/.*\(UCLIBC_FORMAT_FLAT_SEP_DATA\).*/\1=y/' ${WRKBUILD}/.config
	$(SED) 's/.*\(UCLIBC_FORMAT_FLAT\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(UCLIBC_FORMAT_FLAT_SHARED\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(UCLIBC_FORMAT_FDPIC_ELF\).*/# \1 is not set/' ${WRKBUILD}/.config
endif
ifeq ($(ADK_TARGET_BINFMT_FLAT_SHARED),y)
	$(SED) 's/.*\(UCLIBC_FORMAT_FLAT_SHARED\).*/\1=y/' ${WRKBUILD}/.config
	$(SED) 's/.*\(UCLIBC_FORMAT_FLAT\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(UCLIBC_FORMAT_FLAT_SEP_DATA\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(UCLIBC_FORMAT_FDPIC_ELF\).*/# \1 is not set/' ${WRKBUILD}/.config
endif
endif
ifeq ($(ADK_TARGET_LIBC_ICONV),y)
	$(SED) 's/.*\(UCLIBC_HAS_LOCALE\).*/\1=y/' ${WRKBUILD}/.config
endif
ifeq ($(ADK_TARGET_UCLINUX),y)
	$(SED) 's/.*\(ARCH_USE_MMU\).*/# \1 is not set/' ${WRKBUILD}/.config
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC_NG_GIT),y)
ifeq ($(ADK_TARGET_WITH_NPTL),y)
	$(SED) 's/.*\(UCLIBC_HAS_THREADS_NATIVE\).*/\1=y/' ${WRKBUILD}/.config
	$(SED) 's/.*\(UCLIBC_HAS_TLS\).*/\1=y/' ${WRKBUILD}/.config
	$(SED) 's/.*\(PTHREADS_DEBUG_SUPPORT\).*/\1=y/' ${WRKBUILD}/.config
	$(SED) 's/.*\(UCLIBC_HAS_LINUXTHREADS\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(HAS_NO_THREADS\).*/# \1 is not set/' ${WRKBUILD}/.config
endif
ifeq ($(ADK_TARGET_WITH_LT),y)
	$(SED) 's/.*\(UCLIBC_HAS_LINUXTHREADS\).*/\1=y/' ${WRKBUILD}/.config
	$(SED) 's/.*\(UCLIBC_HAS_THREADS_NATIVE\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(UCLIBC_HAS_TLS\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(PTHREADS_DEBUG_SUPPORT\).*/\1=y/' ${WRKBUILD}/.config
	$(SED) 's/.*\(HAS_NO_THREADS\).*/# \1 is not set/' ${WRKBUILD}/.config
endif
ifeq ($(ADK_TARGET_LIB_WITHOUT_THREADS)$(ADK_TARGET_WITHOUT_THREADS),y)
	$(SED) 's/.*\(UCLIBC_HAS_LINUXTHREADS\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(UCLIBC_HAS_THREADS_NATIVE\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(UCLIBC_HAS_TLS\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(PTHREADS_DEBUG_SUPPORT\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(HAS_NO_THREADS\).*/\1=y/' ${WRKBUILD}/.config
endif
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC_NG_1_0),y)
ifeq ($(ADK_TARGET_WITH_NPTL),y)
	$(SED) 's/.*\(UCLIBC_HAS_THREADS_NATIVE\).*/\1=y/' ${WRKBUILD}/.config
	$(SED) 's/.*\(UCLIBC_HAS_TLS\).*/\1=y/' ${WRKBUILD}/.config
	$(SED) 's/.*\(PTHREADS_DEBUG_SUPPORT\).*/\1=y/' ${WRKBUILD}/.config
	$(SED) 's/.*\(LINUXTHREADS_OLD\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(LINUXTHREADS_NEW\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(HAS_NO_THREADS\).*/# \1 is not set/' ${WRKBUILD}/.config
endif
ifeq ($(ADK_TARGET_WITH_LT),y)
	$(SED) 's/.*\(UCLIBC_HAS_THREADS_NATIVE\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(UCLIBC_HAS_TLS\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(LINUXTHREADS_OLD\).*/\1=y/' ${WRKBUILD}/.config
	$(SED) 's/.*\(LINUXTHREADS_NEW\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(HAS_NO_THREADS\).*/# \1 is not set/' ${WRKBUILD}/.config
endif
ifeq ($(ADK_TARGET_LIB_WITHOUT_THREADS)$(ADK_TARGET_WITHOUT_THREADS),y)
	$(SED) 's/.*\(LINUXTHREADS_OLD\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(LINUXTHREADS_NEW\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(UCLIBC_HAS_THREADS_NATIVE\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(UCLIBC_HAS_TLS\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(PTHREADS_DEBUG_SUPPORT\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(HAS_NO_THREADS\).*/\1=y/' ${WRKBUILD}/.config
endif
endif
ifeq ($(ADK_TARGET_USE_STATIC_LIBS)$(ADK_TARGET_BINFMT_FLAT),)
	$(SED) 's/.*\(HAVE_SHARED\).*/\1=y/' ${WRKBUILD}/.config
else
	$(SED) 's/.*\(HAVE_SHARED\).*/# \1 is not set/' ${WRKBUILD}/.config
endif
ifeq ($(ADK_TARGET_USE_GNU_HASHSTYLE),y)
	$(SED) 's/.*\(LDSO_GNU_HASH_SUPPORT\).*/#\1=y/' ${WRKBUILD}/.config
else
	$(SED) 's/.*\(LDSO_GNU_HASH_SUPPORT\).*/# \1 is not set/' ${WRKBUILD}/.config
endif
ifeq ($(ADK_TARGET_USE_SSP),y)
	$(SED) 's,.*UCLIBC_HAS_SSP,UCLIBC_HAS_SSP=y,' ${WRKBUILD}/.config
	echo "UCLIBC_HAS_SSP_COMPAT=n" >> ${WRKBUILD}/.config
	echo "SSP_QUICK_CANARY=n" >> ${WRKBUILD}/.config
	echo "UCLIBC_BUILD_SSP=y" >> ${WRKBUILD}/.config
endif

#
# architecture specific options
#

# arc
ifeq ($(ADK_TARGET_ARCH_ARC),y)
ifeq ($(ADK_TARGET_CPU_ARC_ARC700),y)
	$(SED) 's/.*\(CONFIG_ARC_CPU_HS\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(CONFIG_ARC_CPU_700\).*/\1=y/' ${WRKBUILD}/.config
endif
ifeq ($(ADK_TARGET_CPU_ARC_ARC_HS),y)
	$(SED) 's/.*\(CONFIG_ARC_CPU_700\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(CONFIG_ARC_CPU_HS\).*/\1=y/' ${WRKBUILD}/.config
endif
endif

# arm
ifeq ($(ADK_TARGET_ARCH_ARM),y)
ifeq ($(ADK_TARGET_ARCH_ARM_WITH_THUMB),y)
	$(SED) 's/.*\(COMPILE_IN_THUMB_MODE\).*/\1=y/' ${WRKBUILD}/.config
	$(SED) 's/.*\(UCLIBC_HAS_CONTEXT_FUNCS\).*/# \1 is not set/' ${WRKBUILD}/.config
endif
endif

# cris
ifeq ($(ADK_TARGET_ARCH_CRIS),y)
ifeq ($(ADK_CPU_CRIS_V32),y)
	$(SED) 's/.*\(CONFIG_CRIS=\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(CONFIG_CRISV32\).*/\1=y/' ${WRKBUILD}/.config
endif
ifeq ($(ADK_CPU_CRIS_V10),y)
	$(SED) 's/.*\(CONFIG_CRIS=\).*/\1=y/' ${WRKBUILD}/.config
	$(SED) 's/.*\(CONFIG_CRISV32\).*/# \1 is not set/' ${WRKBUILD}/.config
endif
endif

# mips
ifeq ($(ADK_TARGET_ARCH_MIPS),y)
ifeq ($(ADK_CPU_MIPS32R2),y)
	$(SED) 's/.*\(CONFIG_MIPS_ISA_MIPS32 \).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(CONFIG_MIPS_ISA_MIPS32R2\).*/\1=y/' ${WRKBUILD}/.config
endif
endif

# sh
ifeq ($(ADK_TARGET_ARCH_SH),y)
ifeq ($(ADK_CPU_SH4),y)
	$(SED) 's/.*\(CONFIG_SH2A=\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(CONFIG_SH2=\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(CONFIG_SH3=\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(CONFIG_SH4\).*/\1=y/' ${WRKBUILD}/.config
endif
ifeq ($(ADK_CPU_SH3),y)
	$(SED) 's/.*\(CONFIG_SH2A=\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(CONFIG_SH2=\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(CONFIG_SH4=\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(CONFIG_SH3\).*/\1=y/' ${WRKBUILD}/.config
endif
ifeq ($(ADK_CPU_SH2),y)
	$(SED) 's/.*\(CONFIG_SH2A=\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(CONFIG_SH3=\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(CONFIG_SH4=\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(CONFIG_SH2\).*/\1=y/' ${WRKBUILD}/.config
endif
ifeq ($(ADK_CPU_SH2A),y)
	$(SED) 's/.*\(CONFIG_SH2A=\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(CONFIG_SH3=\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(CONFIG_SH4=\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(CONFIG_SH2A\).*/\1=y/' ${WRKBUILD}/.config
endif
endif

# x86
ifeq ($(ADK_TARGET_ARCH_X86),y)
ifeq ($(ADK_CPU_I486),y)
	$(SED) 's/.*\(CONFIG_686\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(CONFIG_586\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(CONFIG_486\).*/\1=y/' ${WRKBUILD}/.config
endif
ifeq ($(ADK_CPU_I586),y)
	$(SED) 's/.*\(CONFIG_686\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(CONFIG_586\).*/\1=y/' ${WRKBUILD}/.config
	$(SED) 's/.*\(CONFIG_486\).*/# \1 is not set/' ${WRKBUILD}/.config
endif
ifeq ($(ADK_CPU_I686),y)
	$(SED) 's/.*\(CONFIG_686\).*/\1=y/' ${WRKBUILD}/.config
	$(SED) 's/.*\(CONFIG_586\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(CONFIG_486\).*/# \1 is not set/' ${WRKBUILD}/.config
endif
endif

# mips64
ifeq ($(ADK_TARGET_ARCH_MIPS64),y)
	$(SED) 's/.*\(CONFIG_MIPS_ISA_MIPS64\).*/\1=y/' ${WRKBUILD}/.config
	$(SED) 's/.*\(CONFIG_MIPS_ISA_MIPS32\).*/# \1 is not set/' ${WRKBUILD}/.config
ifeq ($(ADK_TARGET_ABI_N64),y)
	$(SED) 's/.*\(CONFIG_MIPS_N64_ABI\).*/\1=y/' ${WRKBUILD}/.config
	$(SED) 's/.*\(CONFIG_MIPS_O32_ABI\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(CONFIG_MIPS_N32_ABI\).*/# \1 is not set/' ${WRKBUILD}/.config
endif
ifeq ($(ADK_TARGET_ABI_N32),y)
	$(SED) 's/.*\(CONFIG_MIPS_N32_ABI\).*/\1=y/' ${WRKBUILD}/.config
	$(SED) 's/.*\(CONFIG_MIPS_O32_ABI\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(CONFIG_MIPS_N64_ABI\).*/# \1 is not set/' ${WRKBUILD}/.config
endif
ifeq ($(ADK_TARGET_ABI_O32),y)
	$(SED) 's/.*\(CONFIG_MIPS_O32_ABI\).*/\1=y/' ${WRKBUILD}/.config
	$(SED) 's/.*\(CONFIG_MIPS_N32_ABI\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(CONFIG_MIPS_N64_ABI\).*/# \1 is not set/' ${WRKBUILD}/.config
endif
endif
	echo N|PATH='$(HOST_PATH)' $(MAKE) ${UCLIBC_MAKEOPTS} -C $(WRKBUILD) \
		PREFIX=$(STAGING_TARGET_DIR) \
		DEVEL_PREFIX=/usr/ \
		RUNTIME_PREFIX=$(STAGING_TARGET_DIR) \
		HOSTCC="$(HOST_CC)" \
		UCLIBC_EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
		UCLIBC_EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
		oldconfig
	PATH='$(HOST_PATH)' $(MAKE) ${UCLIBC_MAKEOPTS} -C $(WRKBUILD) \
		PREFIX=$(STAGING_TARGET_DIR) \
		DEVEL_PREFIX=/usr/ \
		RUNTIME_PREFIX=$(STAGING_TARGET_DIR) \
		HOSTCC="$(HOST_CC)" \
		UCLIBC_EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
		UCLIBC_EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
		install_headers
	touch $(WRKBUILD)/.configured
	touch $@

$(WRKBUILD)/.compiled:
	PATH='$(HOST_PATH)' $(MAKE) ${UCLIBC_MAKEOPTS} -C $(WRKBUILD) \
		PREFIX= \
		DEVEL_PREFIX=/ \
		RUNTIME_PREFIX=/ \
		HOSTCC="$(HOST_CC)" \
		UCLIBC_EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
		UCLIBC_EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
		VERBOSE=1 \
		all
	touch $@

$(WRKBUILD)/.install_headers: $(WRKBUILD)/.compiled
	PATH='$(HOST_PATH)' $(MAKE) -C $(WRKBUILD) \
		PREFIX=$(STAGING_TARGET_DIR) \
		DEVEL_PREFIX=/usr/ \
		DEVEL_PREFIX_LIB=/ \
		RUNTIME_PREFIX=/ \
		UCLIBC_EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
		UCLIBC_EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
		VERBOSE=1 \
		install_dev
	touch $@

$(WRKBUILD)/.installed: $(WRKBUILD)/.install_headers
	PATH='$(HOST_PATH)' $(MAKE) -C $(WRKBUILD) \
		PREFIX=$(STAGING_TARGET_DIR) \
		DEVEL_PREFIX=/usr/ \
		DEVEL_PREFIX_LIB=/ \
		RUNTIME_PREFIX=/ \
		UCLIBC_EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
		UCLIBC_EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
		VERBOSE=1 \
		install_runtime
	touch $@

$(WRKBUILD)/.fixup:
ifeq ($(ADK_UCLIBC_TEST),y)
	PATH='$(HOST_PATH)' $(MAKE) -C $(WRKBUILD) \
		CC='$(TARGET_CC)' \
		TEST_INSTALLED_UCLIBC=1 \
		UCLIBC_ONLY=1 \
		UCLIBC_EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
		UCLIBC_EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
		VERBOSE=1 \
		test_compile test_gen
endif
ifeq ($(ADK_TARGET_TOOLCHAIN),y)
	# cleanup toolchain
	-find $(STAGING_TARGET_DIR) $(STAGING_HOST_DIR) -name \*.la -exec rm {} \;
	# strip target libs and host tools for toolchain builds
	PATH="$(TARGET_PATH)" debug='0' prefix='${TARGET_CROSS}' ${BASH} ${SCRIPT_DIR}/rstrip.sh \
		$(STAGING_TARGET_DIR) $(TOOLCHAIN_DIR)/usr/lib/gcc/$(GNU_TARGET_NAME)
	debug='0' prefix=' ' ${BASH} ${SCRIPT_DIR}/rstrip.sh $(TOOLCHAIN_DIR)/usr/bin
endif
	touch $@

include ${ADK_TOPDIR}/mk/toolchain.mk
