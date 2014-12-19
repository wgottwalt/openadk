# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk
include ../rules.mk
include $(ADK_TOPDIR)/mk/kernel-ver.mk
include $(ADK_TOPDIR)/mk/linux.mk
include $(ADK_TOPDIR)/mk/kernel-vars.mk
include $(ADK_TOPDIR)/mk/buildhlp.mk

$(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/linux-$(KERNEL_VERSION)/.patched:
ifeq ($(ADK_TARGET_SYSTEM_PCENGINES_APU),y)
ifeq ($(ADK_KERNEL_ROOT_NFS),y)
	cd $(DL_DIR) && wget http://openadk.org/distfiles/realtek-firmware-1.1.tar.xz
	tar xf $(DL_DIR)/realtek-firmware-1.1.tar.xz \
		--strip-components=2 -C $(WRKSRC)/firmware realtek-firmware-1.1
endif
endif
ifeq ($(ADK_TARGET_ARCH_XTENSA),y)
	tar xf $(ADK_TOPDIR)/target/xtensa/overlay/xtensa_dc232b.tar \
		--strip-components=1 -C $(WRKSRC) linux
endif
ifneq ($(ADK_DISABLE_KERNEL_PATCHES),y)
	$(TRACE) kernel-patch
	$(PATCH) $(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/linux-$(KERNEL_VERSION) \
		$(ADK_TOPDIR)/target/linux/patches/$(KERNEL_VERSION) *.patch $(MAKE_TRACE)
endif
ifneq ($(ADK_DISABLE_TARGET_KERNEL_PATCHES),y)
	$(TRACE) kernel-target-patch
	$(PATCH) $(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/linux-$(KERNEL_VERSION) \
		$(ADK_TOPDIR)/target/$(ADK_TARGET_ARCH)/$(ADK_TARGET_SYSTEM)/patches/$(KERNEL_VERSION) *.patch $(MAKE_TRACE)
endif
ifeq ($(ADK_KERNEL_ADDON_FBLOGO),y)
	$(TRACE) fblogo-kernel-patch
	$(PATCH) $(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/linux-$(KERNEL_VERSION) \
		$(ADK_TOPDIR)/target/linux/patches/$(KERNEL_VERSION) patch-fblogo $(MAKE_TRACE)
endif
ifeq ($(ADK_KERNEL_ADDON_YAFFS2),y)
	$(TRACE) yaffs2-kernel-patch
	$(PATCH) $(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/linux-$(KERNEL_VERSION) \
		$(ADK_TOPDIR)/target/linux/patches/$(KERNEL_VERSION) patch-yaffs2 $(MAKE_TRACE)
endif
ifeq ($(ADK_KERNEL_ADDON_GRSEC),y)
	$(TRACE) grsec-kernel-patch
	$(PATCH) $(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/linux-$(KERNEL_VERSION) \
		$(ADK_TOPDIR)/target/linux/patches/$(KERNEL_VERSION) patch-grsec $(MAKE_TRACE)
endif
ifeq ($(ADK_KERNEL_ADDON_MPTCP),y)
	$(TRACE) mptcp-kernel-patch
	$(PATCH) $(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/linux-$(KERNEL_VERSION) \
		$(ADK_TOPDIR)/target/linux/patches/$(KERNEL_VERSION) patch-mptcp $(MAKE_TRACE)
endif
ifeq ($(ADK_KERNEL_ADDON_DIETNET),y)
	$(TRACE) dietnet-kernel-patch
	$(PATCH) $(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/linux-$(KERNEL_VERSION) \
		$(ADK_TOPDIR)/target/linux/patches/$(KERNEL_VERSION) patch-dietnet $(MAKE_TRACE)
endif
	touch $@

$(WRKBUILD)/.headers: $(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/linux-$(KERNEL_VERSION)/.patched
	$(KERNEL_MAKE_ENV) $(MAKE) -C $(WRKBUILD) $(KERNEL_MAKE_OPTS) headers_check
	$(KERNEL_MAKE_ENV) $(MAKE) -C $(WRKBUILD) $(KERNEL_MAKE_OPTS) \
		INSTALL_HDR_PATH=$(STAGING_TARGET_DIR)/usr \
		headers_install
ifeq ($(ADK_TARGET_ARCH_CRIS),y)
ifeq ($(ADK_TARGET_CPU_ARCH),crisv32)
	cd $(STAGING_TARGET_DIR)/usr/include && ln -sf arch-v32/arch arch
else
	cd $(STAGING_TARGET_DIR)/usr/include && ln -sf arch-v10/arch arch
endif
endif
	@-find $(STAGING_TARGET_DIR)/usr/include -name .install -delete
	@-find $(STAGING_TARGET_DIR)/usr/include -name ..install.cmd -delete
	touch $@

include ${ADK_TOPDIR}/mk/toolchain.mk
