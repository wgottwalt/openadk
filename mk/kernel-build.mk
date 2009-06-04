# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/linux.mk
include ${TOPDIR}/mk/buildhlp.mk

KERNEL_IDIR:=$(LINUX_BUILD_DIR)/kernel-ipkg

$(TOOLCHAIN_BUILD_DIR)/linux-$(KERNEL_VERSION)/.patched:
	$(TRACE) target/$(DEVICE)-kernel-patch
	$(PATCH) $(TOOLCHAIN_BUILD_DIR)/linux-$(KERNEL_VERSION) ../linux/patches *.patch $(MAKE_TRACE)
	$(PATCH) $(TOOLCHAIN_BUILD_DIR)/linux-$(KERNEL_VERSION) ../linux/patches/$(KERNEL_VERSION) *.patch $(MAKE_TRACE)
	$(PATCH) $(TOOLCHAIN_BUILD_DIR)/linux-$(KERNEL_VERSION) ../$(DEVICE)/patches *.patch $(MAKE_TRACE)
	touch $@

$(LINUX_DIR)/.prepared: $(TOOLCHAIN_BUILD_DIR)/linux-$(KERNEL_VERSION)/.patched
	$(TRACE) target/$(DEVICE)-kernel-prepare
	ln -sf $(TOOLCHAIN_BUILD_DIR)/linux-$(KERNEL_VERSION) $(LINUX_DIR)
	mkdir -p $(LINUX_BUILD_DIR)/kmod-control
	touch $@

$(LINUX_DIR)/.config: $(LINUX_DIR)/.prepared $(BUILD_DIR)/.kernelconfig
	$(TRACE) target/$(DEVICE)-kernel-configure
	for f in $(TARGETS);do if [ -f $$f ];then rm $$f;fi;done $(MAKE_TRACE)
	$(CP) $(BUILD_DIR)/.kernelconfig $(LINUX_DIR)/.config
ifeq ($(ADK_NATIVE),y)
	echo N | $(MAKE) -C $(LINUX_DIR) oldconfig $(MAKE_TRACE)
	$(MAKE) -C $(LINUX_DIR) V=1 prepare scripts $(MAKE_TRACE)
else
	echo N | $(MAKE) -C $(LINUX_DIR) CROSS_COMPILE="$(KERNEL_CROSS)" ARCH=$(ARCH) CC="$(TARGET_CC)" oldconfig $(MAKE_TRACE)
	$(MAKE) -C $(LINUX_DIR) V=1 CROSS_COMPILE="$(KERNEL_CROSS)" ARCH=$(ARCH) CC="$(TARGET_CC)" prepare scripts $(MAKE_TRACE)
endif
	touch -c $(LINUX_DIR)/.config

$(LINUX_DIR)/vmlinux: $(LINUX_DIR)/.config
	$(TRACE) target/$(DEVICE)-kernel-compile
ifeq ($(ADK_NATIVE),y)
	$(MAKE) -C $(LINUX_DIR) V=1 $(MAKE_TRACE)
	$(TRACE) target/$(DEVICE)-kernel-modules-install
	rm -rf $(LINUX_BUILD_DIR)/modules
	$(MAKE) -C "$(LINUX_DIR)" V=1 DEPMOD=true INSTALL_MOD_PATH=$(LINUX_BUILD_DIR)/modules modules_install $(MAKE_TRACE)
else
	$(MAKE) -C $(LINUX_DIR) V=1 CROSS_COMPILE="$(KERNEL_CROSS)" ARCH=$(ARCH) CC="$(TARGET_CC)" $(MAKE_TRACE)
	$(TRACE) target/$(DEVICE)-kernel-modules-install
	rm -rf $(LINUX_BUILD_DIR)/modules
	$(MAKE) -C "$(LINUX_DIR)" V=1 CROSS_COMPILE="$(KERNEL_CROSS)" ARCH=$(ARCH) DEPMOD=true INSTALL_MOD_PATH=$(LINUX_BUILD_DIR)/modules modules_install $(MAKE_TRACE)
endif
	$(TRACE) target/$(DEVICE)-create-packages
	$(MAKE) $(KERNEL_IPKG) $(TARGETS) 
	touch -c $(LINUX_DIR)/vmlinux

$(KERNEL_IPKG):
	$(TRACE) target/$(DEVICE)-create-kernel-package
	rm -rf $(KERNEL_IDIR)
	@mkdir -p $(KERNEL_IDIR)/etc
	${BASH} ${SCRIPT_DIR}/make-ipkg-dir.sh ${KERNEL_IDIR} \
	    ../linux/kernel.control ${DEVICE}-${KERNEL_VERSION} ${CPU_ARCH}
	$(IPKG_BUILD) $(KERNEL_IDIR) $(PACKAGE_DIR) $(MAKE_TRACE)

prepare:
compile: $(LINUX_DIR)/vmlinux
install: compile
ifneq ($(strip $(INSTALL_TARGETS)),)
	$(TRACE) target/${DEVICE}-modules-install
	$(IPKG) install $(INSTALL_TARGETS) $(MAKE_TRACE)
endif

clean:
	rm -rf $(LINUX_BUILD_DIR)
	rm -f $(TARGETS)
