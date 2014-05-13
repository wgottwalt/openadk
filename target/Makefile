# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/rootfs.mk

all: install

### Kernel .config Creation
# The following target combines all kernel-related variables and
# config files into a single one to be used as the final kernel
# configuration when building. This is how it's done:
# 1) fetch all enabled ADK_KERNEL_* vars into
#    .kernelconfig.kernel
# 2) get the global and device-specific static kernel config and place it into
#    .kernelconfig.board
# 3) append ${FS_CMDLINE} to the kernel commandline inside .kernelconfig.board
# 4) merge both together into .kernelconfig.tmp
# 5) check if .kernelconfig.tmp differs from the current one
#    (.kernelconfig) at all, overwriting the current one
#    only if it does (so the timestamp stays intact)
# 6) remove the temporary .kernelconfig.tmp
###
ADK_PACKAGE_CRYPTINIT_ROOT:=$(strip $(subst ",, $(ADK_PACKAGE_CRYPTINIT_ROOT)))
ADK_PACKAGE_CRYPTINIT_SWAP:=$(strip $(subst ",, $(ADK_PACKAGE_CRYPTINIT_SWAP)))
ADK_PACKAGE_CMDLINE:=root=$(ADK_PACKAGE_CRYPTINIT_ROOT) swap=$(ADK_PACKAGE_CRYPTINIT_SWAP) resume=/dev/mapper/swapcrypt

ifeq (${ADK_TARGET_KERNEL_CUSTOMISING},y)
config-prepare: $(TOPDIR)/.config
	@sed -n '/^ADK_KERNEL/s//CONFIG/p' ${TOPDIR}/.config \
	    >${BUILD_DIR}/.kernelconfig.kernel
	@if [ -f ${ADK_TARGET_ARCH}/kernel/${ADK_TARGET_KERNEL_MINICONFIG} ];then \
		cat ${TOPDIR}/target/linux/kernel.config \
		    ${ADK_TARGET_ARCH}/kernel/${ADK_TARGET_KERNEL_MINICONFIG} > ${BUILD_DIR}/.kernelconfig.board; \
	else \
		echo "no miniconfig found for target system"; \
		exit 1; \
	fi
ifeq ($(ADK_TARGET_ROOTFS_NFSROOT),)
	@sed -i -e 's#^\(CONFIG_.*CMDLINE="\)\(.*\)"#\1\2 ro"#' \
		${BUILD_DIR}/.kernelconfig.board
endif
	@sed -i -e 's#^\(CONFIG_.*CMDLINE="\)\(.*\)"#\1\2 ${FS_CMDLINE}"#' \
		${BUILD_DIR}/.kernelconfig.board
ifneq ($(ADK_TARGET_CMDLINE),)
	@sed -i -e 's#^\(CONFIG_.*CMDLINE="\)\(.*\)"#\1\2 ${ADK_TARGET_CMDLINE}"#' \
		${BUILD_DIR}/.kernelconfig.board
endif
ifeq ($(ADK_TARGET_QEMU_WITH_GRAPHIC),y)
	@sed -i -e 's#^\(CONFIG_.*CMDLINE="\)\(.*\)"#\1\2 console=tty0"#' \
		${BUILD_DIR}/.kernelconfig.board
endif
ifneq ($(ADK_PACKAGE_CRYPTINIT_ROOT),)
	@sed -i -e 's#^\(CONFIG_.*CMDLINE="\)\(.*\)"#\1\2 ${ADK_PACKAGE_CMDLINE}"#' \
		${BUILD_DIR}/.kernelconfig.board
endif
ifeq ($(ADK_QUIET_KERNEL),y)
	@sed -i -e 's#^\(CONFIG_.*CMDLINE="\)\(.*\)"#\1\2 quiet"#' \
		${BUILD_DIR}/.kernelconfig.board
endif
ifeq ($(ADK_KERNEL_DEBUG_WITH_KGDB),y)
	@sed -i -e 's#^\(CONFIG_.*CMDLINE="\)\(.*\)"#\1\2 kgdbwait kgdboc=ttyS0,115200"#' \
		${BUILD_DIR}/.kernelconfig.board
endif
ifeq ($(ADK_KERNEL_NETCONSOLE),y)
	@sed -i -e 's#^\(CONFIG_.*CMDLINE="\)\(.*\)"#\1\2 netconsole=@$(ADK_PARAMETER_NETCONSOLE_SRC_IP)/,@$(ADK_PARAMETER_NETCONSOLE_DST_IP)/"#' \
		${BUILD_DIR}/.kernelconfig.board
endif
	@cd ${BUILD_DIR} && cat .kernelconfig.board .kernelconfig.kernel \
	    >.kernelconfig.tmp
	@cd ${BUILD_DIR} && cmp -s .kernelconfig.tmp .kernelconfig || \
	    cp .kernelconfig.tmp .kernelconfig
	@-rm -f ${BUILD_DIR}/.kernelconfig.tmp
else
config-prepare: $(TOPDIR)/.config
	@if [ -f ${ADK_TARGET_ARCH}/kernel/${ADK_TARGET_KERNEL_MINICONFIG} ];then \
		cat ${TOPDIR}/target/linux/kernel.config \
		    ${ADK_TARGET_ARCH}/kernel/${ADK_TARGET_KERNEL_MINICONFIG} > ${BUILD_DIR}/.kernelconfig.board; \
	else \
		echo "no miniconfig found for target system"; \
		exit 1; \
	fi
endif

prepare: $(ADK_TARGET_ARCH)-prepare
compile: $(ADK_TARGET_ARCH)-compile
image: $(ADK_TARGET_ARCH)-imageclean $(ADK_TARGET_ARCH)-imageinstall
install: $(ADK_TARGET_ARCH)-imageclean $(ADK_TARGET_ARCH)-install $(ADK_TARGET_ARCH)-imageinstall
clean: $(ADK_TARGET_ARCH)-clean $(ADK_TARGET_ARCH)-imageclean

%-clean:
	$(TRACE) target/$(patsubst %-clean,%,$@)-clean
	$(MAKE) -C $(patsubst %-clean,%,$@) clean
%-imageclean:
	$(TRACE) target/$(patsubst %-imageclean,%,$@)-imageclean
	$(MAKE) -C $(patsubst %-imageclean,%,$@) imageclean
%-prepare:
	$(TRACE) target/$(patsubst %-prepare,%,$@)-prepare
	$(MAKE) -C $(patsubst %-prepare,%,$@) prepare
%-imageprepare:
	$(TRACE) target/$(patsubst %-imageprepare,%,$@)-imageprepare
	$(MAKE) -C $(patsubst %-imageprepare,%,$@) imageprepare
%-compile: %-prepare
	$(TRACE) target/$(patsubst %-compile,%,$@)-compile
	$(MAKE) -C $(patsubst %-compile,%,$@) compile
%-install: %-compile
	$(TRACE) target/$(patsubst %-install,%,$@)-install
	$(MAKE) -C $(patsubst %-install,%,$@) install
%-imageinstall: %-imageprepare
	$(TRACE) target/$(patsubst %-imageinstall,%,$@)-imageinstall
	$(MAKE) -C $(patsubst %-imageinstall,%,$@) imageinstall
	@echo 'Login as user root with password ${ADK_RUNTIME_PASSWORD} via ssh or console.'
