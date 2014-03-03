# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

_IN_CVTC=		1

include $(TOPDIR)/rules.mk
include ../rules.mk
include Makefile.inc
include ${TOPDIR}/mk/buildhlp.mk

TARGET_CFLAGS:=$(filter-out -flto,$(TARGET_CFLAGS))

ifeq (${ADK_MAKE_PARALLEL},y)
UCLIBC_MAKEOPTS+=	-j${ADK_MAKE_JOBS}
endif

UCLIBCCFG=uclibc.config
ifeq ($(ADK_TARGET_ENDIAN),little)
ifeq ($(ADK_CPU_MIPS64),y)
UCLIBCCFG=uclibc.config.little.mips64
else
UCLIBCCFG=uclibc.config.little
endif
endif
ifeq ($(ADK_TARGET_ENDIAN),big)
ifeq ($(ADK_CPU_MIPS64),y)
UCLIBCCFG=uclibc.config.big.mips64
else
UCLIBCCFG=uclibc.config.big
endif
endif

ifeq ($(ADK_TARGET_SYSTEM_LEMOTE_YEELONG),y)
UCLIBCCFG=uclibc.config.little.mips64
endif

$(WRKBUILD)/.headers:
	$(SED) 's,^CROSS_COMPILE=.*,CROSS_COMPILE=$(TARGET_CROSS),g' $(WRKBUILD)/Rules.mak
	sed -e 's^KERNEL_HEADERS.*$$KERNEL_HEADERS=\"${STAGING_TARGET_DIR}/usr/include\"' \
	    $(TOPDIR)/target/$(ADK_TARGET_ARCH)/$(UCLIBCCFG) >${WRKBUILD}/.config
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
ifneq ($(ADK_PACKAGE_GDB),)
	$(SED) "s/.*\(PTHREADS_DEBUG_SUPPORT\).*/\1=y/" ${WRKBUILD}/.config
endif
ifeq ($(ADK_LINUX_ARM_WITH_THUMB),y)
	$(SED) 's/.*\(COMPILE_IN_THUMB_MODE\).*/\1=y/' ${WRKBUILD}/.config
endif
ifeq ($(ADK_TOOLCHAIN_GCC_USE_SSP),y)
	$(SED) 's,.*UCLIBC_HAS_SSP,UCLIBC_HAS_SSP=y,' ${WRKBUILD}/.config
	echo "UCLIBC_HAS_SSP_COMPAT=n" >> ${WRKBUILD}/.config
	echo "SSP_QUICK_CANARY=n" >> ${WRKBUILD}/.config
	echo "UCLIBC_BUILD_SSP=y" >> ${WRKBUILD}/.config
endif
	echo N|$(MAKE) ${UCLIBC_MAKEOPTS} -C $(WRKBUILD) \
		PREFIX=$(STAGING_TARGET_DIR) \
		DEVEL_PREFIX=/usr/ \
		RUNTIME_PREFIX=$(STAGING_TARGET_DIR) \
		HOSTCC="$(CC_FOR_BUILD)" \
		CPU_CFLAGS="$(TARGET_CFLAGS)" \
		oldconfig
	$(MAKE) ${UCLIBC_MAKEOPTS} -C $(WRKBUILD) \
		PREFIX=$(STAGING_TARGET_DIR) \
		DEVEL_PREFIX=/usr/ \
		RUNTIME_PREFIX=$(STAGING_TARGET_DIR) \
		HOSTCC="$(CC_FOR_BUILD)" \
		CPU_CFLAGS="$(TARGET_CFLAGS)" \
		install_headers
	touch $(WRKBUILD)/.configured
	touch $@

$(WRKBUILD)/.compiled:
	$(MAKE) ${UCLIBC_MAKEOPTS} -C $(WRKBUILD) \
		PREFIX= \
		DEVEL_PREFIX=/ \
		RUNTIME_PREFIX=/ \
		HOSTCC="$(CC_FOR_BUILD)" \
		CPU_CFLAGS="$(TARGET_CFLAGS)" \
		all
	touch $@

$(WRKBUILD)/.install_headers: $(WRKBUILD)/.compiled
	$(MAKE) -C $(WRKBUILD) \
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
ifneq ($(ADK_DEBUG),)
	$(SED) 's,DOSTRIP,DODEBUG,' ${WRKBUILD}/.config
endif
	$(MAKE) -C $(WRKBUILD) \
		PREFIX=$(STAGING_TARGET_DIR) \
		DEVEL_PREFIX=/usr/ \
		DEVEL_PREFIX_LIB=/ \
		RUNTIME_PREFIX=/ \
		CPU_CFLAGS="$(TARGET_CFLAGS)" \
		all install_runtime
	rm -rf $(STAGING_TARGET_DIR)/lib/libc.so
	ln -s libc.so.0 $(STAGING_TARGET_DIR)/lib/libc.so
	# cleanup toolchain
	-find $(STAGING_TARGET_DIR) $(STAGING_HOST_DIR) -name \*.la -delete
ifeq ($(ADK_TOOLCHAIN),y)
	# strip target libs and host tools for toolchain builds
	PATH="$(TARGET_PATH)" debug='0' prefix='${TARGET_CROSS}' ${BASH} ${SCRIPT_DIR}/rstrip.sh $(STAGING_TARGET_DIR)
	debug='0' prefix=' ' ${BASH} ${SCRIPT_DIR}/rstrip.sh $(STAGING_HOST_DIR)
endif
	touch $@

include ${TOPDIR}/mk/toolchain.mk
