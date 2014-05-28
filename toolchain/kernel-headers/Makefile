# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include ../rules.mk
include $(TOPDIR)/mk/linux.mk
include ${TOPDIR}/mk/kernel-vars.mk
include ${TOPDIR}/mk/buildhlp.mk

$(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/linux-$(KERNEL_VERSION)/.patched:
ifneq ($(ADK_DISABLE_KERNEL_PATCHES),y)
	$(TRACE) kernel-patch
	$(PATCH) $(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/linux-$(KERNEL_VERSION) \
		$(TOPDIR)/target/linux/patches/$(KERNEL_VERSION) *.patch $(MAKE_TRACE)
endif
ifneq ($(ADK_DISABLE_TARGET_KERNEL_PATCHES),y)
	$(TRACE) kernel-target-patch
	$(PATCH) $(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/linux-$(KERNEL_VERSION) \
		$(TOPDIR)/target/$(ARCH)/$(ADK_TARGET_SYSTEM)/patches/$(KERNEL_VERSION) *.patch $(MAKE_TRACE)
endif
ifeq ($(ADK_KERNEL_ADDON_YAFFS2),y)
	$(TRACE) yaffs2-kernel-patch
	$(PATCH) $(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/linux-$(KERNEL_VERSION) \
		$(TOPDIR)/target/linux/patches/$(KERNEL_VERSION) patch-yaffs2 $(MAKE_TRACE)
endif
ifeq ($(ADK_KERNEL_ADDON_GRSEC),y)
	$(TRACE) grsec-kernel-patch
	$(PATCH) $(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/linux-$(KERNEL_VERSION) \
		$(TOPDIR)/target/linux/patches/$(KERNEL_VERSION) patch-grsec $(MAKE_TRACE)
endif
ifeq ($(ADK_KERNEL_ADDON_MPTCP),y)
	$(TRACE) mptcp-kernel-patch
	$(PATCH) $(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/linux-$(KERNEL_VERSION) \
		$(TOPDIR)/target/linux/patches/$(KERNEL_VERSION) patch-mptcp $(MAKE_TRACE)
endif
	touch $@

$(WRKBUILD)/.headers: $(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/linux-$(KERNEL_VERSION)/.patched
	${KERNEL_MAKE_ENV} $(MAKE) -C $(WRKBUILD) ${KERNEL_MAKE_OPTS} headers_check
	${KERNEL_MAKE_ENV} $(MAKE) -C $(WRKBUILD) ${KERNEL_MAKE_OPTS} \
		INSTALL_HDR_PATH=$(STAGING_TARGET_DIR)/usr \
		headers_install
	@-find $(STAGING_TARGET_DIR)/usr/include -name .install -delete
	@-find $(STAGING_TARGET_DIR)/usr/include -name ..install.cmd -delete
	touch $@

include ${TOPDIR}/mk/toolchain.mk
