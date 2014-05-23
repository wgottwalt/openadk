# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include ../rules.mk
include $(TOPDIR)/mk/linux.mk
include ${TOPDIR}/mk/kernel-vars.mk
include ${TOPDIR}/mk/buildhlp.mk

$(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/linux-$(KERNEL_VERSION)/.patched:
	$(TRACE) kernel-patch
	$(PATCH) $(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/linux-$(KERNEL_VERSION) \
		../linux/patches/$(KERNEL_VERSION) *.patch $(MAKE_TRACE)
	$(PATCH) $(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/linux-$(KERNEL_VERSION) \
		../$(ARCH)/$(ADK_TARGET_SYSTEM)/patches/$(KERNEL_VERSION) *.patch $(MAKE_TRACE)
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
