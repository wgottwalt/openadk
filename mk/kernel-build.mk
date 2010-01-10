# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/linux.mk
include ${TOPDIR}/mk/buildhlp.mk
include ${TOPDIR}/mk/kernel-vars.mk

KERNEL_PKGDIR:=$(LINUX_BUILD_DIR)/kernel-pkg

$(TOOLCHAIN_BUILD_DIR)/linux-$(KERNEL_VERSION)/.patched:
	$(TRACE) target/$(ADK_TARGET)-kernel-patch
	$(PATCH) $(TOOLCHAIN_BUILD_DIR)/linux-$(KERNEL_VERSION) ../linux/patches/$(KERNEL_VERSION) *.patch $(MAKE_TRACE)
	$(PATCH) $(TOOLCHAIN_BUILD_DIR)/linux-$(KERNEL_VERSION) ../$(ADK_TARGET)/patches *.patch $(MAKE_TRACE)
	touch $@

$(LINUX_DIR)/.prepared: $(TOOLCHAIN_BUILD_DIR)/linux-$(KERNEL_VERSION)/.patched
	$(TRACE) target/$(ADK_TARGET)-kernel-prepare
	ln -sf $(TOOLCHAIN_BUILD_DIR)/linux-$(KERNEL_VERSION) $(LINUX_DIR)
	mkdir -p $(LINUX_BUILD_DIR)/kmod-control
	touch $@

$(LINUX_DIR)/.config: $(LINUX_DIR)/.prepared $(BUILD_DIR)/.kernelconfig
	$(TRACE) target/$(ADK_TARGET)-kernel-configure
	for f in $(TARGETS);do if [ -f $$f ];then rm $$f;fi;done $(MAKE_TRACE)
	$(CP) $(BUILD_DIR)/.kernelconfig $(LINUX_DIR)/.config
	echo N | $(MAKE) ${KERNEL_MAKE_OPTS} oldconfig $(MAKE_TRACE)
	$(MAKE) ${KERNEL_MAKE_OPTS} prepare scripts $(MAKE_TRACE)
	touch -c $(LINUX_DIR)/.config

$(LINUX_DIR)/vmlinux: $(LINUX_DIR)/.config
	$(TRACE) target/$(ADK_TARGET)-kernel-compile
	$(MAKE) ${KERNEL_MAKE_OPTS} -j${ADK_MAKE_JOBS} $(MAKE_TRACE)
	$(TRACE) target/$(ADK_TARGET)-kernel-modules-install
	rm -rf $(LINUX_BUILD_DIR)/modules
	$(MAKE) ${KERNEL_MAKE_OPTS} DEPMOD=true \
		INSTALL_MOD_PATH=$(LINUX_BUILD_DIR)/modules \
		modules_install $(MAKE_TRACE)
	$(TRACE) target/$(ADK_TARGET)-create-packages
	$(MAKE) $(KERNEL_PKG) $(TARGETS) 
	touch -c $(LINUX_DIR)/vmlinux

$(KERNEL_PKG):
	$(TRACE) target/$(ADK_TARGET)-create-kernel-package
	rm -rf $(KERNEL_PKGDIR)
	@mkdir -p $(KERNEL_PKGDIR)/etc
	${BASH} ${SCRIPT_DIR}/make-ipkg-dir.sh ${KERNEL_PKGDIR} \
	    ../linux/kernel.control ${ADK_TARGET}-${KERNEL_VERSION} ${CPU_ARCH}
	$(PKG_BUILD) $(KERNEL_PKGDIR) $(PACKAGE_DIR) $(MAKE_TRACE)

prepare:
compile: $(LINUX_DIR)/vmlinux
install: compile
ifneq ($(strip $(INSTALL_TARGETS)),)
	$(TRACE) target/${ADK_TARGET}-modules-install
ifeq ($(ADK_TARGET_PACKAGE_IPKG),y)
	$(PKG_INSTALL) $(INSTALL_TARGETS) $(MAKE_TRACE)
else
	$(foreach pkg,$(INSTALL_TARGETS),$(shell $(PKG_INSTALL) $(pkg)))
endif
endif

clean:
	rm -rf $(LINUX_BUILD_DIR)
	rm -f $(TARGETS)
