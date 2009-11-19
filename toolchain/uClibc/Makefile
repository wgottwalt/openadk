# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

_IN_CVTC=		1

include $(TOPDIR)/rules.mk
include ../rules.mk
include Makefile.inc
include ${TOPDIR}/mk/buildhlp.mk

#workaround for mips and gcc 4.4, where -Os does not inline code in ld.so
ifeq ($(ARCH),mips)
TARGET_CFLAGS:=$(subst Os,O2,$(TARGET_CFLAGS))
endif
#workaround for cris and gcc 4.4, where -Os generates ICE
ifeq ($(ARCH),cris)
TARGET_CFLAGS:=$(subst Os,O2,$(TARGET_CFLAGS))
endif

$(WRKBUILD)/.headers:
	$(SED) 's,^CROSS=.*,CROSS=$(TARGET_CROSS),g' $(WRKBUILD)/Rules.mak
	sed -e 's^KERNEL_HEADERS.*$$KERNEL_HEADERS=\"${TOOLCHAIN_SYSROOT}/usr/include\"' \
	    $(TOPDIR)/target/$(ADK_TARGET)/uclibc.config >${WRKBUILD}/.config
ifeq ($(ADK_IPV6),y)
	$(SED) 's,# UCLIBC_HAS_IPV6.*,UCLIBC_HAS_IPV6=y,' \
		${WRKBUILD}/.config
endif
ifeq ($(ADK_SSP),y)
	$(SED) 's,# UCLIBC_HAS_SSP.*,UCLIBC_HAS_SSP=y,' \
		${WRKBUILD}/.config
	echo 'UCLIBC_BUILD_SSP=y' >> ${WRKBUILD}/.config
	echo '# UCLIBC_HAS_SSP_COMPAT is not set' >> ${WRKBUILD}/.config
	echo '# SSP_QUICK_CANARY is not set' >> ${WRKBUILD}/.config
	echo 'PROPOLICE_BLOCK_ABRT=y' >> ${WRKBUILD}/.config
	echo '# PROPOLICE_BLOCK_SEGV is not set' >> ${WRKBUILD}/.config
endif
ifneq ($(ADK_DEBUG),)
	$(SED) 's,DOSTRIP,DODEBUG,' ${WRKBUILD}/.config
endif
	$(MAKE) -C $(WRKBUILD) \
		PREFIX=$(TOOLCHAIN_SYSROOT)/ \
		DEVEL_PREFIX=/usr/ \
		RUNTIME_PREFIX=$(TOOLCHAIN_SYSROOT)/ \
		HOSTCC="$(HOSTCC)" \
		CPU_CFLAGS="$(TARGET_CFLAGS)" \
		install_headers
	touch $(WRKBUILD)/.configured
	touch $@

$(WRKBUILD)/.compiled: 
	$(MAKE) -C $(WRKBUILD) \
		PREFIX= \
		DEVEL_PREFIX=/ \
		RUNTIME_PREFIX=/ \
		HOSTCC="$(HOSTCC)" \
		CPU_CFLAGS="$(TARGET_CFLAGS)" \
		all
	touch $@

$(WRKBUILD)/.install_headers: $(WRKBUILD)/.compiled
	$(MAKE) -C $(WRKBUILD) \
		PREFIX=$(STAGING_DIR) \
		DEVEL_PREFIX=/ \
		RUNTIME_PREFIX=/ \
		CPU_CFLAGS="$(TARGET_CFLAGS)" \
		install_dev
	touch $@

$(WRKBUILD)/.installed: $(WRKBUILD)/.install_headers
	$(MAKE) -C $(WRKBUILD) \
		PREFIX=$(STAGING_DIR) \
		DEVEL_PREFIX=/ \
		RUNTIME_PREFIX=/ \
		CPU_CFLAGS="$(TARGET_CFLAGS)" \
		install_runtime
	rm -rf $(STAGING_DIR)/lib/libc.so
	ln -s libc.so.0 $(STAGING_DIR)/lib/libc.so
	touch $@

include ${TOPDIR}/mk/toolchain.mk
