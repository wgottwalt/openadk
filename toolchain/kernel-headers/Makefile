# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include ../rules.mk
include $(TOPDIR)/mk/linux.mk
include ${TOPDIR}/mk/buildhlp.mk

$(WRKBUILD)/.headers:
	$(MAKE) -C $(WRKBUILD) HOSTCC=$(CC_FOR_BUILD) ARCH=$(ARCH) V=1 \
		INSTALL_HDR_PATH=$(STAGING_DIR)/usr \
		headers_install
ifeq ($(ADK_TARGET_WITH_MULTILIB),y)
ifeq ($(ADK_LINUX_MIPS),y)
	$(MAKE) -C $(WRKBUILD) HOSTCC=$(CC_FOR_BUILD) ARCH=mips V=1 \
		INSTALL_HDR_PATH=$(STAGING_TARGET_DIR)-n32/usr \
		headers_install
	$(MAKE) -C $(WRKBUILD) HOSTCC=$(CC_FOR_BUILD) ARCH=mips V=1 \
		INSTALL_HDR_PATH=$(STAGING_TARGET_DIR)-64/usr \
		headers_install
	$(MAKE) -C $(WRKBUILD) HOSTCC=$(CC_FOR_BUILD) ARCH=mips V=1 \
		INSTALL_HDR_PATH=$(STAGING_TARGET_DIR)-o32/usr \
		headers_install
endif
ifeq ($(ADK_LINUX_X86_64),y)
	$(MAKE) -C $(WRKBUILD) HOSTCC=$(CC_FOR_BUILD) ARCH=x86 V=1 \
		INSTALL_HDR_PATH=$(STAGING_TARGET_DIR)-32/usr \
		headers_install
	$(MAKE) -C $(WRKBUILD) HOSTCC=$(CC_FOR_BUILD) ARCH=x86 V=1 \
		INSTALL_HDR_PATH=$(STAGING_TARGET_DIR)-x32/usr \
		headers_install
	$(MAKE) -C $(WRKBUILD) HOSTCC=$(CC_FOR_BUILD) ARCH=x86 V=1 \
		INSTALL_HDR_PATH=$(STAGING_TARGET_DIR)-64/usr \
		headers_install
endif
endif
	$(MAKE) -C $(WRKBUILD) HOSTCC=$(CC_FOR_BUILD) ARCH=$(ARCH) V=1 \
		INSTALL_HDR_PATH=$(LINUX_HEADER_DIR) \
		headers_install
ifeq ($(ARCH),cris)
ifeq ($(CPU_ARCH),crisv32)
	cd $(STAGING_DIR)/usr/include && ln -sf arch-v32/arch arch
else
	cd $(STAGING_DIR)/usr/include && ln -sf arch-v10/arch arch
endif
endif
	touch $@

include ${TOPDIR}/mk/toolchain.mk
