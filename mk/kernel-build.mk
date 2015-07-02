# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk
include ${ADK_TOPDIR}/mk/kernel-ver.mk
include $(ADK_TOPDIR)/mk/linux.mk
include ${ADK_TOPDIR}/mk/kernel-vars.mk

KERNEL_FILE:=$(ADK_TARGET_KERNEL)
KERNEL_TARGET:=$(ADK_TARGET_KERNEL)
ifeq ($(ADK_TARGET_KERNEL_LINUXBIN),y)
KERNEL_FILE:=vmlinux
KERNEL_TARGET:=$(ADK_TARGET_KERNEL)
endif
ifeq ($(ADK_TARGET_KERNEL_ZIMAGE),y)
KERNEL_FILE:=vmlinux
KERNEL_TARGET:=$(ADK_TARGET_KERNEL)
endif
ifeq ($(ADK_TARGET_KERNEL_BZIMAGE),y)
KERNEL_FILE:=vmlinux
KERNEL_TARGET:=all
endif
ifeq ($(ADK_TARGET_KERNEL_IMAGE),y)
KERNEL_FILE:=vmlinux
KERNEL_TARGET:=$(ADK_TARGET_KERNEL)
endif

$(LINUX_DIR)/.prepared: $(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/linux-$(KERNEL_VERSION)/.patched
	$(TRACE) target/kernel-prepare
	ln -sf $(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/linux-$(KERNEL_VERSION) $(LINUX_DIR)
	mkdir -p $(LINUX_BUILD_DIR)/kmod-control
	touch $@

$(LINUX_DIR)/.config: $(LINUX_DIR)/.prepared $(BUILD_DIR)/.kernelconfig $(ADK_TOPDIR)/mk/modules.mk
	$(TRACE) target/$(ADK_TARGET_ARCH)-kernel-configure
	-for f in $(TARGETS);do if [ -f $$f ];then rm $$f;fi;done
	$(CP) $(BUILD_DIR)/.kernelconfig $(LINUX_DIR)/mini.config
	${KERNEL_MAKE_ENV} $(MAKE) -C "${LINUX_DIR}" ${KERNEL_MAKE_OPTS} KCONFIG_ALLCONFIG=mini.config allnoconfig $(MAKE_TRACE)
	touch -c $(LINUX_DIR)/.config

$(LINUX_DIR)/$(KERNEL_FILE): $(LINUX_DIR)/.config
	$(TRACE) target/$(ADK_TARGET_ARCH)-kernel-compile
	${KERNEL_MAKE_ENV} $(MAKE) -C "${LINUX_DIR}" ${KERNEL_MAKE_OPTS} -j${ADK_MAKE_JOBS} LOCALVERSION="" $(KERNEL_TARGET) modules $(MAKE_TRACE)
	touch -c $(LINUX_DIR)/$(KERNEL_FILE)

$(LINUX_BUILD_DIR)/modules: $(LINUX_DIR)/$(KERNEL_FILE)
	$(TRACE) target/$(ADK_TARGET_ARCH)-kernel-modules-install
	rm -rf $(LINUX_BUILD_DIR)/modules
	${KERNEL_MAKE_ENV} $(MAKE) -C "${LINUX_DIR}" ${KERNEL_MAKE_OPTS} \
		DEPMOD=$(STAGING_HOST_DIR)/usr/bin/depmod \
		INSTALL_MOD_PATH=$(LINUX_BUILD_DIR)/modules \
		LOCALVERSION="" \
		modules_install $(MAKE_TRACE)
	$(TRACE) target/$(ADK_TARGET_ARCH)-create-packages
	@mkdir -p ${PACKAGE_DIR}
ifneq ($(strip $(TARGETS)),)
	$(MAKE) $(TARGETS)
endif

$(INSTALL_TARGETS): $(LINUX_BUILD_DIR)/modules

prepare:
compile: $(LINUX_BUILD_DIR)/modules
install: compile $(INSTALL_TARGETS)
ifneq ($(strip $(INSTALL_TARGETS)),)
	$(TRACE) target/${ADK_TARGET_ARCH}-modules-install
ifeq ($(ADK_TARGET_PACKAGE_IPKG)$(ADK_TARGET_PACKAGE_OPKG),y)
	$(PKG_INSTALL) $(INSTALL_TARGETS) $(MAKE_TRACE)
else
	$(foreach pkg,$(INSTALL_TARGETS),$(shell $(PKG_INSTALL) $(pkg)))
endif
endif

clean:
	rm -rf $(LINUX_BUILD_DIR)
	rm -f $(TARGETS)
