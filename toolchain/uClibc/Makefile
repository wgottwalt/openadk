# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

_IN_CVTC=		1

include $(TOPDIR)/rules.mk
include ../rules.mk
include Makefile.inc
include ${TOPDIR}/mk/buildhlp.mk

ifeq (${ADK_MAKE_PARALLEL},y)
UCLIBC_MAKEOPTS+=	-j${ADK_MAKE_JOBS}
endif

$(WRKBUILD)/.headers:
	$(SED) 's,^CROSS=.*,CROSS=$(TARGET_CROSS),g' $(WRKBUILD)/Rules.mak
	sed -e 's^KERNEL_HEADERS.*$$KERNEL_HEADERS=\"${STAGING_TARGET_DIR}/usr/include\"' \
	    $(TOPDIR)/target/$(ADK_TARGET_ARCH)/uclibc.config >${WRKBUILD}/.config
ifneq ($(ADK_DEBUG),)
	$(SED) 's,DOSTRIP,DODEBUG,' ${WRKBUILD}/.config
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
		HOSTCC="$(HOSTCC)" \
		CPU_CFLAGS="$(TARGET_CFLAGS)" \
		oldconfig
	$(MAKE) ${UCLIBC_MAKEOPTS} -C $(WRKBUILD) \
		PREFIX=$(STAGING_TARGET_DIR) \
		DEVEL_PREFIX=/usr/ \
		RUNTIME_PREFIX=$(STAGING_TARGET_DIR) \
		HOSTCC="$(HOSTCC)" \
		CPU_CFLAGS="$(TARGET_CFLAGS)" \
		install_headers
	touch $(WRKBUILD)/.configured
	touch $@

$(WRKBUILD)/.compiled:
	$(MAKE) ${UCLIBC_MAKEOPTS} -C $(WRKBUILD) \
		PREFIX= \
		DEVEL_PREFIX=/ \
		RUNTIME_PREFIX=/ \
		HOSTCC="$(HOSTCC)" \
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
	$(MAKE) -C $(WRKBUILD) \
		PREFIX=$(STAGING_TARGET_DIR) \
		DEVEL_PREFIX=/usr/ \
		DEVEL_PREFIX_LIB=/ \
		RUNTIME_PREFIX=/ \
		CPU_CFLAGS="$(TARGET_CFLAGS)" \
		install_runtime
	rm -rf $(STAGING_TARGET_DIR)/lib/libc.so
	ln -s libc.so.0 $(STAGING_TARGET_DIR)/lib/libc.so
	touch $@

include ${TOPDIR}/mk/toolchain.mk
