# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include ../rules.mk
include $(TOPDIR)/mk/linux.mk
include ${TOPDIR}/mk/buildhlp.mk

$(WRKBUILD)/.headers:
	$(MAKE) -C $(WRKBUILD) HOSTCC=$(HOSTCC) ARCH=$(ARCH) V=1 \
		INSTALL_HDR_PATH=$(STAGING_TARGET_DIR)/usr \
		headers_install
	$(MAKE) -C $(WRKBUILD) HOSTCC=$(HOSTCC) ARCH=$(ARCH) V=1 \
		INSTALL_HDR_PATH=$(TOOLCHAIN_SYSROOT)/usr \
		headers_install
	$(MAKE) -C $(WRKBUILD) HOSTCC=$(HOSTCC) ARCH=$(ARCH) V=1 \
		INSTALL_HDR_PATH=$(LINUX_HEADER_DIR) \
		headers_install
	# cryptodev.h from ocf-linux-20080917
	mkdir -p ${STAGING_TARGET_DIR}/usr/include/crypto
	cp files/cryptodev.h ${STAGING_TARGET_DIR}/usr/include/crypto/
ifeq ($(ARCH),cris)
ifeq ($(CPU_ARCH),crisv32)
	cd $(STAGING_TARGET_DIR)/usr/include && ln -sf arch-v32/arch arch
	cd $(TOOLCHAIN_SYSROOT)/usr/include && ln -sf arch-v32/arch arch
else
	cd $(STAGING_TARGET_DIR)/usr/include && ln -sf arch-v10/arch arch
	cd $(TOOLCHAIN_SYSROOT)/usr/include && ln -sf arch-v10/arch arch
endif
endif
	touch $@

include ${TOPDIR}/mk/toolchain.mk
