# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

TOPDIR=$(shell pwd)
export TOPDIR

ifneq ($(shell umask 2>/dev/null | sed 's/0*022/OK/'),OK)
$(error your umask is not 022)
endif

CONFIG_CONFIG_IN = Config.in
CONFIG = config
DEFCONFIG= 		ADK_DEVELSYSTEM=n \
			ADK_DEBUG=n \
			ADK_STATIC=n \
			ADK_FORCE_PARALLEL=n \
			BUSYBOX_SELINUX=n \
			BUSYBOX_MODPROBE_SMALL=n \
			BUSYBOX_EJECT=n \
			BUSYBOX_BUILD_LIBBUSYBOX=n \
			BUSYBOX_LOCALE_SUPPORT=n \
			BUSYBOX_FEATURE_PREFER_APPLETS=n \
			BUSYBOX_FEATURE_SUID=n \
			BUSYBOX_SELINUXENABLED=n \
			BUSYBOX_FEATURE_INSTALLER=n \
			BUSYBOX_PAM=n \
			BUSYBOX_FLASH_LOCK=n \
			BUSYBOX_FLASH_UNLOCK=n \
			BUSYBOX_FLASH_ERASEALL=n \
			BUSYBOX_PIE=n \
			BUSYBOX_DEBUG=n \
			BUSYBOX_NOMMU=n \
			BUSYBOX_WERROR=n \
			BUSYBOX_STATIC=n \
			ADK_KERNEL_RT2X00_DEBUG=n \
			ADK_KERNEL_ATH5K_DEBUG=n

noconfig_targets:=	menuconfig \
			_config \
			_mconfig \
			tags

MAKECLEAN_SYMBOLS=	ADK_TARGET_LIB_UCLIBC \
			ADK_TARGET_LIB_GLIBC \
			ADK_TARGET_LIB_ECLIBC \
			ADK_DEBUG

POSTCONFIG=		-@ \
	if [ -f .config.old ];then \
	if [ -d .cfg ];then \
	what=cleantarget; \
	for symbol in ${MAKECLEAN_SYMBOLS}; do \
		newval=$$(grep -e "^$$symbol=" -e "^\# $$symbol " .config); \
		oldval=$$(cat .cfg/"$$symbol" 2>&-); \
		[[ $$newval = $$oldval ]] && continue; \
		echo; \
		echo >&2 "WARNING: Toolchain related options have changed, 'make" \
		    "$$what' might be required!"; \
		break; \
	done; \
	fi; \
	if [ "$$(grep ^BUSYBOX .config|md5sum)" != "$$(grep ^BUSYBOX .config.old|md5sum)" ];then \
		if [ -f build_*/w-busybox*/busybox*/.configure_done ];then \
			rm build_*/w-busybox*/busybox*/.configure_done; \
		fi; \
	fi; \
	fi

# Pull in the user's configuration file
ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
-include $(TOPDIR)/.config
endif

ifeq ($(strip $(ADK_HAVE_DOT_CONFIG)),y)
include $(TOPDIR)/rules.mk
include ${TOPDIR}/mk/split-cfg.mk

all: world

.NOTPARALLEL:
.PHONY: all world clean cleantarget cleandir distclean image_clean

world: $(DISTDIR) $(BUILD_DIR) $(TARGET_DIR) $(PACKAGE_DIR) ${TOPDIR}/.cfg/ADK_HAVE_DOT_CONFIG
	${BASH} ${TOPDIR}/scripts/scan-pkgs.sh
ifeq ($(ADK_NATIVE),y)
	$(MAKE) -f mk/build.mk toolchain/kernel-headers-prepare target/config-prepare target/compile package/compile root_clean package/install package_index target/install
else
ifeq ($(ADK_TOOLCHAIN_ONLY),y)
	$(MAKE) -f mk/build.mk toolchain/install package/compile
else
	$(MAKE) -f mk/build.mk toolchain/install target/config-prepare target/compile package/compile root_clean package/install package_index target/install
endif
endif

package_index:
ifeq ($(ADK_TARGET_PACKAGE_IPKG),y)
	-cd ${PACKAGE_DIR} && \
	    ${BASH} ${TOPDIR}/scripts/ipkg-make-index.sh . >Packages
endif

$(DISTDIR):
	mkdir -p $(DISTDIR)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(TARGET_DIR):
	mkdir -p $(TARGET_DIR)

$(PACKAGE_DIR):
	mkdir -p ${PACKAGE_DIR}/.stamps

${STAGING_DIR} ${STAGING_DIR}/etc ${STAGING_TOOLS}:
	mkdir -p ${STAGING_DIR}/{bin,etc,lib,usr/include} \
		${STAGING_TOOLS}/{bin,lib}

${STAGING_DIR}/etc/ipkg.conf: ${STAGING_DIR}/etc
	echo "dest root /" >${STAGING_DIR}/etc/ipkg.conf
	echo "option offline_root ${TARGET_DIR}" >>$(STAGING_DIR)/etc/ipkg.conf

package/%: ${TOPDIR}/.cfg/ADK_HAVE_DOT_CONFIG ${STAGING_DIR}/etc/ipkg.conf
	$(MAKE) -C package $(patsubst package/%,%,$@)

target/%: ${TOPDIR}/.cfg/ADK_HAVE_DOT_CONFIG
	$(MAKE) -C target $(patsubst target/%,%,$@)

toolchain/%: ${STAGING_DIR}
	$(MAKE) -C toolchain $(patsubst toolchain/%,%,$@)

image:
	$(MAKE) -C target image

switch:
	echo "Saving configuration for target: ${ADK_TARGET}"
	cp -p .config .config.${ADK_TARGET}
	if [ -f .config.old ];then cp -p .config.old .config.old.${ADK_TARGET};fi
	mv .cfg .cfg.${ADK_TARGET}
	if [ -f .config.${TARGET} ];then cp -p .config.${TARGET} .config; \
	cp -p .config.old.${TARGET} .config.old; \
	mv .cfg.${TARGET} .cfg; \
	echo "Setting configuration to target: ${TARGET}"; \
	else echo "No old target config found";mv .config .config.bak; make TARGET=${TARGET};fi

kernelconfig:
	cp $(TOPDIR)/target/$(ADK_TARGET)/kernel.config $(BUILD_DIR)/linux/.config
	make -C $(BUILD_DIR)/linux/ ARCH=$(ARCH) menuconfig
	cp $(BUILD_DIR)/linux/.config $(TOPDIR)/target/$(ADK_TARGET)/kernel.config

#############################################################
#
# Cleanup and misc junk
#
#############################################################
root_clean:
	@$(TRACE) root_clean
	rm -rf $(TARGET_DIR)
	mkdir -p $(TARGET_DIR)

# Do a per-package clean here, too. This way stale headers and
# libraries from cross_*/target/ get wiped away, which keeps
# future package build's configure scripts from returning false
# dependencies information.

clean:
	@$(TRACE) clean
	$(MAKE) -C $(CONFIG) clean
	for d in ${STAGING_PARENT}; do \
		for f in $$(ls $$d/pkg/[a-z]* 2>/dev/null); do  \
			while read file ; do \
				rm $$d/target/$$file 2>/dev/null; \
			done < $$f ; \
			rm $$f ; \
		done \
	done
	rm -rf $(BUILD_DIR) $(BIN_DIR) $(TARGET_DIR) ${TOPDIR}/.cfg
	rm -f ${TOPDIR}/package/*/info.mk

cleankernel:
	@$(TRACE) cleankernel
	rm -rf $(TOOLCHAIN_BUILD_DIR)/linux* $(BUILD_DIR)/linux

cleandir:
	@$(TRACE) cleandir
	@$(MAKE) -C $(CONFIG) clean $(MAKE_TRACE)
	rm -rf $(BUILD_DIR_PFX) $(BIN_DIR_PFX) $(TARGET_DIR_PFX) \
		${TOPDIR}/.cfg*
	rm -rf $(TOOLCHAIN_BUILD_DIR_PFX) $(STAGING_PARENT_PFX) $(TOOLS_BUILD_DIR)
	rm -f .tmpconfig.h ${TOPDIR}/package/*/info.mk

cleantarget:
	@$(TRACE) cleantarget
	@$(MAKE) -C $(CONFIG) clean $(MAKE_TRACE)
	rm -rf $(BUILD_DIR) $(BIN_DIR) $(TARGET_DIR) ${TOPDIR}/.cfg
	rm -rf $(TOOLCHAIN_BUILD_DIR) $(STAGING_PARENT)
	rm -f .tmpconfig.h ${TOPDIR}/package/*/info.mk

distclean:
	@$(TRACE) distclean
	@$(MAKE) -C $(CONFIG) clean $(MAKE_TRACE)
	rm -rf $(BUILD_DIR_PFX) $(BIN_DIR_PFX) $(TARGET_DIR_PFX) $(DISTDIR) \
		${TOPDIR}/.cfg*
	rm -rf $(TOOLCHAIN_BUILD_DIR_PFX) $(STAGING_PARENT_PFX) $(TOOLS_BUILD_DIR)
	rm -f .config* .defconfig .tmpconfig.h all.config \
		${TOPDIR}/package/*/info.mk

else # ifeq ($(strip $(ADK_HAVE_DOT_CONFIG)),y)

include $(TOPDIR)/prereq.mk

all: menuconfig
	@echo "Start the build with \"make\" or with \"make v\" to be verbose"

# configuration
# ---------------------------------------------------------------------------

# force entering the subdir, as dependency checking is done there
.PHONY: $(CONFIG)/conf $(CONFIG)/mconf

$(CONFIG)/conf:
	@$(MAKE) -C $(CONFIG) conf

$(CONFIG)/mconf:
	@$(MAKE) -C $(CONFIG)

defconfig:
	@if [ ! -z "$(TARGET)" ];then \
		grep "^config" target/Config.in |grep -i "$(TARGET)"|sed -e "s#^config \(.*\)#\1=y#" > $(TOPDIR)/.defconfig; \
		for symbol in ${DEFCONFIG}; do \
			echo $$symbol >> $(TOPDIR)/.defconfig; \
		done; \
	fi
ifneq (,$(filter %_qemu,${TARGET}))
	@echo ADK_LINUX_QEMU=y >> $(TOPDIR)/.defconfig
endif
ifneq (,$(filter %_rescue,${TARGET}))
	@echo ADK_LINUX_RESCUE=y >> $(TOPDIR)/.defconfig
endif
	@if [ ! -z "$(TARGET)" ];then \
		$(CONFIG)/conf -D .defconfig $(CONFIG_CONFIG_IN); \
	fi

modconfig:
	@if [ ! -z "$(TARGET)" ];then \
		grep "^config" target/Config.in |grep -i "$(TARGET)"|sed -e "s#^config \(.*\)#\1=y#" > $(TOPDIR)/all.config; \
		for symbol in ${DEFCONFIG}; do \
			echo $$symbol >> $(TOPDIR)/all.config; \
		done; \
	fi
	@if [ ! -z "$(FS)" ];then \
		grep "^config" target/Config.in \
			|grep -i "$(FS)" \
			|sed -e "s#^config \(.*\)#\1=y#" \
			>> $(TOPDIR)/all.config; \
	fi
	@if [ ! -z "$(PKG)" ];then \
		grep "^config" target/Config.in \
			|grep -i "$(PKG)" \
			|sed -e "s#^config \(.*\)#\1=y#" \
			>> $(TOPDIR)/all.config; \
	fi
	@if [ ! -z "$(LIBC)" ];then \
		grep "^config" target/Config.in \
			|grep -i "$(LIBC)" \
			|sed -e "s#^config \(.*\)#\1=y#" \
			>> $(TOPDIR)/all.config; \
	fi
ifneq (,$(filter %_qemu,${TARGET}))

	@echo ADK_LINUX_QEMU=y >> $(TOPDIR)/all.config
endif
ifneq (,$(filter %_rescue,${TARGET}))
	@echo ADK_LINUX_RESCUE=y >> $(TOPDIR)/all.config
endif

menuconfig: $(CONFIG)/mconf defconfig
	@$(CONFIG)/mconf $(CONFIG_CONFIG_IN)
	${POSTCONFIG}

_config: $(CONFIG)/conf
	-@touch .config
	@$(CONFIG)/conf ${W} $(CONFIG_CONFIG_IN) >/dev/null
	${POSTCONFIG}

.NOTPARALLEL: _mconfig
_mconfig: ${CONFIG}/conf _mconfig2 _config
_mconfig2: ${CONFIG}/conf modconfig
	@${CONFIG}/conf -m ${RCONFIG} >/dev/null

# build all targets and combinations
bulk:
	mkdir $(TOPDIR)/bulk
	$(MAKE) TARGET=alix1c LIBC=uclibc FS=nfsroot PKG=ipkg allmodconfig
	$(MAKE) v
	$(CP) $(BIN_DIR) $(TOPDIR)/bulk
	$(MAKE) cleantarget
	
distclean:
	@$(MAKE) -C $(CONFIG) clean
	@rm -rf $(BUILD_DIR) $(TOOLS_BUILD_DIR) $(BIN_DIR) $(DISTDIR) \
		${TOPDIR}/.cfg*
	@rm -rf $(TOOLCHAIN_BUILD_DIR) $(STAGING_PARENT) $(TARGET_DIR)
	@rm -f .config* .defconfig all.config .tmpconfig.h \
		${TOPDIR}/package/*/info.mk

endif # ifeq ($(strip $(ADK_HAVE_DOT_CONFIG)),y)
