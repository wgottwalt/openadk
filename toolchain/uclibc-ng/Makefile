# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

_IN_CVTC=		1

include $(ADK_TOPDIR)/rules.mk
include ../rules.mk
include Makefile.inc
include ${ADK_TOPDIR}/mk/buildhlp.mk

TARGET_CFLAGS:=$(filter-out -flto,$(TARGET_CFLAGS))

ifeq (${ADK_MAKE_PARALLEL},y)
UCLIBC_MAKEOPTS+=	-j${ADK_MAKE_JOBS}
endif

$(WRKBUILD)/.headers:
	$(SED) 's,^CROSS_COMPILE=.*,CROSS_COMPILE=$(TARGET_CROSS),g' $(WRKBUILD)/Rules.mak
	sed -e 's^KERNEL_HEADERS.*$$KERNEL_HEADERS=\"${STAGING_TARGET_DIR}/usr/include\"' \
	    $(ADK_TOPDIR)/target/$(ADK_TARGET_ARCH)/uclibc-ng.config >${WRKBUILD}/.config
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
ifeq ($(ADK_LINUX_ARM),y)
ifeq ($(ADK_TARGET_ABI_EABI),y)
	$(SED) 's/.*\(UCLIBC_HAS_FPU\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(UCLIBC_HAS_SOFT_FLOAT\).*/#\1=y/' ${WRKBUILD}/.config

endif
ifeq ($(ADK_TARGET_ABI_EABIHF),y)
	$(SED) 's/.*\(UCLIBC_HAS_FPU\).*/\1=y/' ${WRKBUILD}/.config
	$(SED) 's/.*\(UCLIBC_HAS_SOFT_FLOAT\).*/# \1 is not set/' ${WRKBUILD}/.config
endif
endif
ifeq ($(ADK_LINUX_64),y)
	$(SED) 's/.*\(CONFIG_MIPS_ISA_MIPS64\).*/\1=y/' ${WRKBUILD}/.config
	$(SED) 's/.*\(CONFIG_MIPS_ISA_MIPS32\).*/# \1 is not set/' ${WRKBUILD}/.config
else
	$(SED) 's/.*\(CONFIG_MIPS_ISA_MIPS32\).*/\1=y/' ${WRKBUILD}/.config
	$(SED) 's/.*\(CONFIG_MIPS_ISA_MIPS64\).*/# \1 is not set/' ${WRKBUILD}/.config
endif
ifeq ($(ADK_n64),y)
	$(SED) 's/.*\(CONFIG_MIPS_N64_ABI\).*/\1=y/' ${WRKBUILD}/.config
	$(SED) 's/.*\(CONFIG_MIPS_O32_ABI\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(CONFIG_MIPS_N32_ABI\).*/# \1 is not set/' ${WRKBUILD}/.config
endif
ifeq ($(ADK_n32),y)
	$(SED) 's/.*\(CONFIG_MIPS_N32_ABI\).*/\1=y/' ${WRKBUILD}/.config
	$(SED) 's/.*\(CONFIG_MIPS_O32_ABI\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(CONFIG_MIPS_N64_ABI\).*/# \1 is not set/' ${WRKBUILD}/.config
endif
ifeq ($(ADK_o32),y)
	$(SED) 's/.*\(CONFIG_MIPS_O32_ABI\).*/\1=y/' ${WRKBUILD}/.config
	$(SED) 's/.*\(CONFIG_MIPS_N32_ABI\).*/# \1 is not set/' ${WRKBUILD}/.config
	$(SED) 's/.*\(CONFIG_MIPS_N64_ABI\).*/# \1 is not set/' ${WRKBUILD}/.config
endif
ifneq ($(ADK_PACKAGE_GDB),)
	$(SED) "s/.*\(PTHREADS_DEBUG_SUPPORT\).*/\1=y/" ${WRKBUILD}/.config
endif
ifeq ($(ADK_LINUX_ARM_WITH_THUMB),y)
	$(SED) 's/.*\(COMPILE_IN_THUMB_MODE\).*/\1=y/' ${WRKBUILD}/.config
endif
ifeq ($(ADK_TARGET_USE_SSP),y)
	$(SED) 's,.*UCLIBC_HAS_SSP,UCLIBC_HAS_SSP=y,' ${WRKBUILD}/.config
	echo "UCLIBC_HAS_SSP_COMPAT=n" >> ${WRKBUILD}/.config
	echo "SSP_QUICK_CANARY=n" >> ${WRKBUILD}/.config
	echo "UCLIBC_BUILD_SSP=y" >> ${WRKBUILD}/.config
endif
	echo N| PATH='$(HOST_PATH)' $(MAKE) ${UCLIBC_MAKEOPTS} -C $(WRKBUILD) \
		PREFIX=$(STAGING_TARGET_DIR) \
		DEVEL_PREFIX=/usr/ \
		RUNTIME_PREFIX=$(STAGING_TARGET_DIR) \
		HOSTCC="$(HOST_CC)" \
		CPU_CFLAGS="$(TARGET_CFLAGS)" \
		V=1 \
		oldconfig
	PATH='$(HOST_PATH)' $(MAKE) ${UCLIBC_MAKEOPTS} -C $(WRKBUILD) \
		PREFIX=$(STAGING_TARGET_DIR) \
		DEVEL_PREFIX=/usr/ \
		RUNTIME_PREFIX=$(STAGING_TARGET_DIR) \
		HOSTCC="$(HOST_CC)" \
		CPU_CFLAGS="$(TARGET_CFLAGS)" \
		V=1 \
		install_headers
	touch $(WRKBUILD)/.configured
	touch $@

$(WRKBUILD)/.compiled:
	PATH='$(HOST_PATH)' $(MAKE) ${UCLIBC_MAKEOPTS} -C $(WRKBUILD) \
		PREFIX= \
		DEVEL_PREFIX=/ \
		RUNTIME_PREFIX=/ \
		HOSTCC="$(HOST_CC)" \
		CPU_CFLAGS="$(TARGET_CFLAGS)" \
		all
	touch $@

$(WRKBUILD)/.install_headers: $(WRKBUILD)/.compiled
	PATH='$(HOST_PATH)' $(MAKE) -C $(WRKBUILD) \
		PREFIX=$(STAGING_TARGET_DIR) \
		DEVEL_PREFIX=/usr/ \
		DEVEL_PREFIX_LIB=/ \
		RUNTIME_PREFIX=/ \
		CPU_CFLAGS="$(TARGET_CFLAGS)" \
		install_dev
	touch $@

$(WRKBUILD)/.installed: $(WRKBUILD)/.install_headers
	touch $@

$(WRKBUILD)/.fixup:
	PATH='$(HOST_PATH)' $(MAKE) -C $(WRKBUILD) \
		PREFIX=$(STAGING_TARGET_DIR) \
		DEVEL_PREFIX=/usr/ \
		DEVEL_PREFIX_LIB=/ \
		RUNTIME_PREFIX=/ \
		CPU_CFLAGS="$(TARGET_CFLAGS)" \
		all install_runtime
ifeq ($(ADK_UCLIBC_TEST),y)
	PATH='$(HOST_PATH)' $(MAKE) -C $(WRKBUILD)/test \
		UCLIBC_ONLY=1 \
		TEST_INSTALLED_UCLIBC=1 \
		CPU_CFLAGS="$(TARGET_CFLAGS)" \
		compile
endif
ifeq ($(ADK_TARGET_TOOLCHAIN),y)
	# cleanup toolchain
	-find $(STAGING_TARGET_DIR) $(STAGING_HOST_DIR) -name \*.la -delete
	# strip target libs and host tools for toolchain builds
	PATH="$(TARGET_PATH)" debug='0' prefix='${TARGET_CROSS}' ${BASH} ${SCRIPT_DIR}/rstrip.sh \
		$(STAGING_TARGET_DIR) $(TOOLCHAIN_DIR)/usr/lib/gcc/$(GNU_TARGET_NAME)
	debug='0' prefix=' ' ${BASH} ${SCRIPT_DIR}/rstrip.sh $(TOOLCHAIN_DIR)/usr/bin
endif
	touch $@

include ${ADK_TOPDIR}/mk/toolchain.mk
