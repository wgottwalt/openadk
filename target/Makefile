# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/rootfs.mk

all: install

### Kernel .config Creation
# The following target combines all kernel-related variables and
# config files into a single one to be used as the final kernel
# configuration when building. This is how it's done:
# 1) fetch all ADK_KPACKAGE_KMOD_* vars into 
#    .kernelconfig.modules and set them to "m"
# 2) fetch all enabled ADK_KERNEL_* vars into
#    .kernelconfig.kernel (no conversion, as they are booleans)
# 3) repeat 2) for the disabled ones and save them into
#    .kernelconfig.nokernel (to overwrite defaults)
# 4) get the device-specific static kernel config and place it into
#    .kernelconfig.board
# 5) prepare for merging:
#    * if a variable is disabled in .kernelconfig.board and
#      enabled in either of .kernelconfig.{modules,kernel},
#      remove it from .kernelconfig.board
#    * append ${FS_CMDLINE} to the kernel commandline inside
#      .kernelconfig.board
# 6) merge (cat) it all together into .kernelconfig.tmp
# 7) check if .kernelconfig.tmp differs from the current one
#    (.kernelconfig) at all, overwriting the current one
#    only if it does (so the timestamp stays intact)
# 8) remove the temporary .kernelconfig.tmp
###
config-prepare: $(TOPDIR)/.config
	@sed -n '/^ADK_KPACKAGE_KMOD/s//CONFIG/p' ${TOPDIR}/.config | \
	    sed 's/=y/=m/' >${BUILD_DIR}/.kernelconfig.modules
	@sed -n '/^ADK_KERNEL/s//CONFIG/p' ${TOPDIR}/.config \
	    >${BUILD_DIR}/.kernelconfig.kernel
	@sed -n '/^ADK_MOD_KERNEL/s//CONFIG/p' ${TOPDIR}/.config | \
	    sed 's/=y/=m/' >${BUILD_DIR}/.kernelconfig.modkernel
	@sed -n '/^# ADK_KERNEL/s//# CONFIG/p' ${TOPDIR}/.config \
	    >${BUILD_DIR}/.kernelconfig.nokernel
# if native build, first try /proc/config.gz
ifeq ($(ADK_NATIVE),y)
	@if [ -f /proc/config.gz ];then zcat /proc/config.gz > ${BUILD_DIR}/.kernelconfig.board; else cp ${ADK_TARGET}/kernel.config.$(ARCH) ${BUILD_DIR}/.kernelconfig.board; fi
else
	@cp ${ADK_TARGET}/kernel.config ${BUILD_DIR}/.kernelconfig.board
endif
	@(cat ${BUILD_DIR}/.kernelconfig.{modules,kernel} | \
	    while IFS='=' read symbol value; do \
		sed -i -e "/^# $$symbol/d" ${BUILD_DIR}/.kernelconfig.board; \
	done;)
	@sed -i -e 's#^\(CONFIG_.*CMDLINE="\)\(.*\)"#\1\2 ${FS_CMDLINE}"#' \
		${BUILD_DIR}/.kernelconfig.board
ifeq ($(ADK_KERNEL_DEBUG_WITH_KGDB),y)
	@sed -i -e 's#^\(CONFIG_.*CMDLINE="\)\(.*\)"#\1\2 kgdbwait kgdboc=ttyS0,115200"#' \
		${BUILD_DIR}/.kernelconfig.board
endif
	@cd ${BUILD_DIR} && cat .kernelconfig.board .kernelconfig.nokernel \
	    .kernelconfig.kernel .kernelconfig.modkernel .kernelconfig.modules \
	    >.kernelconfig.tmp
	@cd ${BUILD_DIR} && cmp -s .kernelconfig.tmp .kernelconfig || \
	    cp .kernelconfig.tmp .kernelconfig
	@-rm -f ${BUILD_DIR}/.kernelconfig.tmp

prepare: $(ADK_TARGET)-prepare
compile: $(ADK_TARGET)-compile
image: $(ADK_TARGET)-imageclean $(ADK_TARGET)-imageinstall
install: $(ADK_TARGET)-imageclean $(ADK_TARGET)-install $(ADK_TARGET)-imageinstall
clean: $(ADK_TARGET)-clean $(ADK_TARGET)-imageclean

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
	@echo 'Login as user root with password ${ADK_RUNTIME_PASSWORD} via ssh or console'
