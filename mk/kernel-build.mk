# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/linux.mk
include ${TOPDIR}/mk/buildhlp.mk

KERNEL_PKGDIR:=$(LINUX_BUILD_DIR)/kernel-pkg

KERNEL_MAKE_OPTS:=	-C "${LINUX_DIR}" V=1
ifneq ($(ADK_NATIVE),y)
KERNEL_MAKE_OPTS+=	CROSS_COMPILE="$(TARGET_CROSS)" ARCH=$(ARCH) CC="$(TARGET_CC)"
endif

$(TOOLCHAIN_BUILD_DIR)/linux-$(KERNEL_VERSION)/.patched:
	$(TRACE) target/$(DEVICE)-kernel-patch
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
	echo N | $(MAKE) ${KERNEL_MAKE_OPTS} oldconfig $(MAKE_TRACE)
	$(MAKE) ${KERNEL_MAKE_OPTS} prepare scripts $(MAKE_TRACE)
	touch -c $(LINUX_DIR)/.config

$(LINUX_DIR)/vmlinux: $(LINUX_DIR)/.config
	$(TRACE) target/$(DEVICE)-kernel-compile
	$(MAKE) ${KERNEL_MAKE_OPTS} -j${ADK_MAKE_JOBS} $(MAKE_TRACE)
	$(TRACE) target/$(DEVICE)-kernel-modules-install
	rm -rf $(LINUX_BUILD_DIR)/modules
	$(MAKE) ${KERNEL_MAKE_OPTS} DEPMOD=true \
		INSTALL_MOD_PATH=$(LINUX_BUILD_DIR)/modules \
		modules_install $(MAKE_TRACE)
	$(TRACE) target/$(DEVICE)-create-packages
	$(MAKE) $(KERNEL_PKG) $(TARGETS) 
	touch -c $(LINUX_DIR)/vmlinux

$(KERNEL_PKG):
	$(TRACE) target/$(DEVICE)-create-kernel-package
	rm -rf $(KERNEL_PKGDIR)
	@mkdir -p $(KERNEL_PKGDIR)/etc
	${BASH} ${SCRIPT_DIR}/make-ipkg-dir.sh ${KERNEL_PKGDIR} \
	    ../linux/kernel.control ${DEVICE}-${KERNEL_VERSION} ${CPU_ARCH}
	$(PKG_BUILD) $(KERNEL_PKGDIR) $(PACKAGE_DIR) $(MAKE_TRACE)

prepare:
compile: $(LINUX_DIR)/vmlinux
install: compile
ifneq ($(strip $(INSTALL_TARGETS)),)
	$(TRACE) target/${DEVICE}-modules-install
	$(PKG_INSTALL) $(INSTALL_TARGETS) $(MAKE_TRACE)
endif

clean:
	rm -rf $(LINUX_BUILD_DIR)
	rm -f $(TARGETS)
