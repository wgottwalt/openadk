# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

TOPDIR=$(shell pwd)
export TOPDIR

ifneq ($(shell umask 2>/dev/null | sed 's/0*022/OK/'),OK)
$(error your umask is not 022)
endif

CONFIG_CONFIG_IN = Config.in
CONFIG = config

noconfig_targets:=	menuconfig \
			_config \
			_mconfig \
			tags

MAKECLEAN_SYMBOLS=	ADK_TARGET_LIB_UCLIBC ADK_TARGET_LIB_GLIBC ADK_SSP \
			ADK_IPV6 ADK_CXX ADK_DEBUG
POSTCONFIG=		-@\
	if [ -f .config.old ];then \
	if [ -d .cfg ];then \
	what=cleandevice; \
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
.PHONY: all world clean cleandevice cleandir distclean image_clean

world: $(DISTDIR) $(BUILD_DIR) $(TARGET_DIR) $(PACKAGE_DIR) ${TOPDIR}/.cfg/ADK_HAVE_DOT_CONFIG
	${BASH} ${TOPDIR}/scripts/scan-pkgs.sh
ifeq ($(ADK_NATIVE),y)
	$(MAKE) -f mk/build.mk toolchain/kernel-headers-prepare target/config-prepare target/compile package/compile root_clean package/install package_index target/install
else
	$(MAKE) -f mk/build.mk toolchain/install target/config-prepare target/compile package/compile root_clean package/install package_index target/install
endif

package_index:
	-cd ${PACKAGE_DIR} && \
	    ${BASH} ${TOPDIR}/scripts/ipkg-make-index.sh . >Packages

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
	echo "Saving configuration for device: ${DEVICE}"
	cp .config .config.${DEVICE}
	mv .cfg .cfg.${DEVICE}
	if [ -f .config.${DEV} ];then cp .config.${DEV} .config; \
	cp .config.${DEV} .config.old; \
	mv .cfg.${DEV} .cfg; \
	echo "Setting configuration to device: ${DEV}"; \
	else echo "No old device config found";mv .config .config.bak;fi

#############################################################
#
# Cleanup and misc junk
#
#############################################################
root_clean:
	@$(TRACE) root_clean
	rm -rf $(TARGET_DIR)

clean:
	@$(TRACE) clean
	$(MAKE) -C $(CONFIG) clean
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

cleandevice:
	@$(TRACE) cleandevice
	$(MAKE) -C $(CONFIG) clean
	rm -rf $(BUILD_DIR) $(BIN_DIR) $(TARGET_DIR) ${TOPDIR}/.cfg
	rm -rf $(TOOLCHAIN_BUILD_DIR) $(STAGING_PARENT)
	rm -f .tmpconfig.h ${TOPDIR}/package/*/info.mk

distclean:
	@$(TRACE) distclean
	$(MAKE) -C $(CONFIG) clean
	rm -rf $(BUILD_DIR_PFX) $(BIN_DIR_PFX) $(TARGET_DIR_PFX) $(DISTDIR) ${TOPDIR}/.cfg
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

menuconfig: $(CONFIG)/mconf
	@$(CONFIG)/mconf $(CONFIG_CONFIG_IN)
	${POSTCONFIG}

_config: $(CONFIG)/conf
	-@touch .config
	@$(CONFIG)/conf ${W} $(CONFIG_CONFIG_IN) >/dev/null
	${POSTCONFIG}

.NOTPARALLEL: _mconfig
_mconfig: ${CONFIG}/conf _mconfig2 _config
_mconfig2: ${CONFIG}/conf
	@${CONFIG}/conf -M ${RCONFIG} >/dev/null

distclean:
	@$(MAKE) -C $(CONFIG) clean
	rm -rf $(BUILD_DIR) $(TOOLS_BUILD_DIR) $(BIN_DIR) $(DISTDIR) ${TOPDIR}/.cfg
	rm -rf $(TOOLCHAIN_BUILD_DIR) $(STAGING_PARENT) $(TARGET_DIR)
	rm -f .config* .tmpconfig.h ${TOPDIR}/package/*/info.mk

endif # ifeq ($(strip $(ADK_HAVE_DOT_CONFIG)),y)
