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
			ADK_FORCE_PARALLEL=n

noconfig_targets:=	menuconfig \
			_config \
			_mconfig \
			tags

MAKECLEAN_SYMBOLS=	ADK_TARGET_LIB_UCLIBC \
			ADK_TARGET_LIB_GLIBC \
			ADK_TARGET_LIB_ECLIBC \
			ADK_IPV6 ADK_CXX ADK_DEBUG

POSTCONFIG=		-@\
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
	mkdir -p ${STAGING_DIR}/{bin,etc,include,lib,usr} \
		${STAGING_TOOLS}/{bin,lib}
	cd ${STAGING_DIR}/usr; ln -s ../include include

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
	else echo "No old target config found";mv .config .config.bak;fi

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
	for d in ${STAGING_PARENT_PFX}; do \
		echo "clean: entering $$d" ; \
		for f in $$(ls $$d/pkg/[a-z]* 2>/dev/null); do  \
			echo "clean: cleaning for $$f" ; \
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
	$(MAKE) -C $(CONFIG) clean
	rm -rf $(BUILD_DIR_PFX) $(BIN_DIR_PFX) $(TARGET_DIR_PFX) ${TOPDIR}/.cfg
	rm -rf $(TOOLCHAIN_BUILD_DIR_PFX) $(STAGING_PARENT_PFX) $(TOOLS_BUILD_DIR)
	rm -f .tmpconfig.h ${TOPDIR}/package/*/info.mk

cleantarget:
	@$(TRACE) cleantarget
	$(MAKE) -C $(CONFIG) clean
	rm -rf $(BUILD_DIR) $(BIN_DIR) $(TARGET_DIR) ${TOPDIR}/.cfg
	rm -rf $(TOOLCHAIN_BUILD_DIR) $(STAGING_PARENT)
	rm -f .tmpconfig.h ${TOPDIR}/package/*/info.mk

distclean:
	@$(TRACE) distclean
	@$(MAKE) -C $(CONFIG) clean
	rm -rf $(BUILD_DIR_PFX) $(BIN_DIR_PFX) $(TARGET_DIR_PFX) $(DISTDIR) ${TOPDIR}/.cfg*
	rm -rf $(TOOLCHAIN_BUILD_DIR_PFX) $(STAGING_PARENT_PFX) $(TOOLS_BUILD_DIR)
	rm -f .config* .tmpconfig.h ${TOPDIR}/package/*/info.mk

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

distclean:
	@$(MAKE) -C $(CONFIG) clean
	@rm -rf $(BUILD_DIR) $(TOOLS_BUILD_DIR) $(BIN_DIR) $(DISTDIR) ${TOPDIR}/.cfg*
	@rm -rf $(TOOLCHAIN_BUILD_DIR) $(STAGING_PARENT) $(TARGET_DIR)
	@rm -f .config* .tmpconfig.h ${TOPDIR}/package/*/info.mk

endif # ifeq ($(strip $(ADK_HAVE_DOT_CONFIG)),y)
