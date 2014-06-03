# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/mk/kernel-ver.mk

LINUX_KMOD_SUFFIX=ko
MODULES_SUBDIR := lib/modules/$(KERNEL_MOD_VERSION)
LINUX_BUILD_DIR := $(BUILD_DIR)/linux-$(ADK_TARGET_ARCH)
KMOD_BUILD_DIR := $(LINUX_BUILD_DIR)/linux-modules
MODULES_DIR := $(LINUX_BUILD_DIR)/modules/$(MODULES_SUBDIR)
TARGET_MODULES_DIR := $(LINUX_TARGET_DIR)/$(MODULES_SUBDIR)

INSTALL_TARGETS:= $(KERNEL_PKG)
NOINSTALL_TARGETS:=
TARGETS:=

# KMOD_template
#
# Adds a target for creating a package containing
# the specified (kernel-provided) modules.
# Parameters:
# 1: the config symbol name (without leading 'ADK_KERNEL_')
#    this _must_ be equal to the kernel config symbol name
# 2: the name for the package, should be unique
# 3: actual modules to add; absolute path inside $(MODULES_DIR)
#    OMIT THE KERNEL-SPECIFIC EXTENSION!
# 4: order of module loading at system startup; the modules in $(3) are (in their order)
#    added to this file, if $(6) is non-empty
# 5: the kmod packages this package depends on
#
define KMOD_template

IDEPENDK_$(1):=kernel ($(KERNEL_VERSION)) $(foreach pkg,$(5),", $(pkg)")

PKG_$(1) := $(PACKAGE_DIR)/kmod-$(2)_$(KERNEL_VERSION)-$(KERNEL_RELEASE)_$(ADK_TARGET_CPU_ARCH).$(PKG_SUFFIX)
I_$(1) := $(KMOD_BUILD_DIR)/ipkg/$(2)

ifeq ($${ADK_TARGET_KERNEL_CUSTOMISING},y)
ifeq ($$(ADK_KERNEL_$(1)),m)
TARGETS+=$$(PKG_$(1))
INSTALL_TARGETS+=$$(PKG_$(1))
endif
endif

$$(PKG_$(1)):
	rm -rf $$(I_$(1))
	@mkdir -p $$(I_$(1))
	echo "Package: kmod-$(2)" > $(LINUX_BUILD_DIR)/kmod-control/kmod-$(2).control
	echo "Priority: optional" >> $(LINUX_BUILD_DIR)/kmod-control/kmod-$(2).control
	echo "Section: sys" >> $(LINUX_BUILD_DIR)/kmod-control/kmod-$(2).control
	echo "Description: kernel module $(2)" >> $(LINUX_BUILD_DIR)/kmod-control/kmod-$(2).control
	${BASH} ${SCRIPT_DIR}/make-ipkg-dir.sh $$(I_$(1)) \
	    $(LINUX_BUILD_DIR)/kmod-control/kmod-$(2).control \
	    $(KERNEL_VERSION)-$(KERNEL_RELEASE) $(ADK_TARGET_CPU_ARCH)
	echo "Depends: $$(IDEPENDK_$(1))" >> $$(I_$(1))/CONTROL/control
ifneq ($(strip $(3)),)
	mkdir -p $$(I_$(1))/lib/modules/$(KERNEL_MOD_VERSION)
	$(CP) $(foreach mod,$(3),$(mod).$(LINUX_KMOD_SUFFIX)) $$(I_$(1))/lib/modules/$(KERNEL_MOD_VERSION)
ifneq ($(4),)
	mkdir -p $$(I_$(1))/etc/modules.d
	for module in $(notdir $(3)); do \
		echo $$$$module >> $$(I_$(1))/etc/modules.d/$(4)-$(2); \
	done
	echo "#!/bin/sh" >> $$(I_$(1))/CONTROL/postinst
	echo "if [ -z \"\$$$${IPKG_INSTROOT}\" ]; then" >> $$(I_$(1))/CONTROL/postinst
	echo ". /etc/functions.sh" >> $$(I_$(1))/CONTROL/postinst
	echo "load_modules /etc/modules.d/$(4)-$(2)" >> $$(I_$(1))/CONTROL/postinst
	echo "fi" >> $$(I_$(1))/CONTROL/postinst
	chmod 0755 $$(I_$(1))/CONTROL/postinst
endif
endif
	$${RSTRIP} $${I_$(1)} $(MAKE_TRACE)
	$(PKG_BUILD) $$(I_$(1)) $(PACKAGE_DIR) $(MAKE_TRACE)
endef

include $(BUILD_DIR)/.kernelconfig
