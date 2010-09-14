# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

TOPDIR=$(shell pwd)
export TOPDIR

ifneq ($(shell umask 2>/dev/null | sed 's/0*022/OK/'),OK)
$(error your umask is not 022)
endif

CONFIG_CONFIG_IN = Config.in
CONFIG = config
DEFCONFIG=		ADK_DEVELSYSTEM=n \
			ADK_DEBUG=n \
			ADK_STATIC=n \
			ADK_MAKE_PARALLEL=y \
			ADK_MAKE_JOBS=4 \
			ADK_FORCE_PARALLEL=n \
			ADK_PACKAGE_BZR=n \
			ADK_PACKAGE_GRUB=n \
			ADK_PACKAGE_AUFS2_UTIL=n \
			ADK_PACKAGE_BASE_FILES=y \
			ADK_PACKAGE_MGETTY=n \
			ADK_COMPILE_HEIMDAL=n \
			ADK_PACKAGE_HEIMDAL_PKINIT=n \
			ADK_PACKAGE_HEIMDAL_SERVER=n \
			ADK_PACKAGE_LIBHEIMDAL=n \
			ADK_PACKAGE_LIBHEIMDAL_CLIENT=n \
			BUSYBOX_BBCONFIG=n \
			BUSYBOX_SELINUX=n \
			BUSYBOX_INSTALL_NO_USR=n \
			BUSYBOX_MODPROBE_SMALL=n \
			BUSYBOX_EJECT=n \
			BUSYBOX_BUILD_LIBBUSYBOX=n \
			BUSYBOX_FEATURE_2_4_MODULES=n \
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
			BUSYBOX_TASKSET=n \
			BUSYBOX_DEBUG=n \
			BUSYBOX_NOMMU=n \
			BUSYBOX_WERROR=n \
			BUSYBOX_STATIC=n \
			BUSYBOX_FEATURE_AIX_LABEL=n \
			BUSYBOX_FEATURE_SUN_LABEL=n \
			BUSYBOX_FEATURE_OSF_LABEL=n \
			BUSYBOX_FEATURE_SGI_LABEL=n \
			ADK_KERNEL_RT2X00_DEBUG=n \
			ADK_KERNEL_ATH5K_DEBUG=n \
			ADK_KERNEL_DEBUG_WITH_KGDB=n

noconfig_targets:=	menuconfig \
			guiconfig \
			_config \
			_mconfig \
			distclean \
			defconfig \
			tags

POSTCONFIG=		-@ \
	if [ -f .config.old ];then \
		rebuild=0; \
		if [ "$$(grep ^BUSYBOX .config|md5sum)" != "$$(grep ^BUSYBOX .config.old|md5sum)" ];then \
			touch .rebuild.busybox;\
			rebuild=1;\
		fi; \
		if [ "$$(grep ^ADK_RUNTIME_PASSWORD .config|md5sum)" != "$$(grep ^ADK_RUNTIME_PASSWORD .config.old|md5sum)" ];then \
			touch .rebuild.base-files;\
			rebuild=1;\
		fi; \
		if [ $$rebuild -eq 1 ];then \
			cp .config .config.old; \
		fi; \
	fi

# Pull in the user's configuration file
ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
-include $(TOPDIR)/.config
endif

ifeq ($(strip $(ADK_HAVE_DOT_CONFIG)),y)
include $(TOPDIR)/rules.mk

all: world

${TOPDIR}/package/Depends.mk: ${TOPDIR}/.config $(wildcard ${TOPDIR}/package/*/Makefile)
	$(TOPDIR)/bin/tools/depmaker > ${TOPDIR}/package/Depends.mk


.NOTPARALLEL:
.PHONY: all world clean cleantarget cleandir distclean image_clean

world: $(DISTDIR) $(BUILD_DIR) $(TARGET_DIR) $(PACKAGE_DIR)
	${BASH} ${TOPDIR}/scripts/scan-pkgs.sh
ifeq ($(ADK_NATIVE),y)
	$(MAKE) -f mk/build.mk toolchain/kernel-headers-prepare tools/install target/config-prepare target/compile package/compile root_clean package/install package_index target/install
else
ifeq ($(ADK_TOOLCHAIN_ONLY),y)
	$(MAKE) -f mk/build.mk toolchain/install tools/install package/compile
else
	$(MAKE) -f mk/build.mk toolchain/install tools/install target/config-prepare target/compile package/compile root_clean package/install target/install package_index
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
ifeq ($(ADK_TARGET_PACKAGE_IPKG),y)
	echo "dest root /" >${STAGING_DIR}/etc/ipkg.conf
	echo "option offline_root ${TARGET_DIR}" >>$(STAGING_DIR)/etc/ipkg.conf
endif

package/%: ${STAGING_DIR}/etc/ipkg.conf ${TOPDIR}/package/Depends.mk
	$(MAKE) -C package $(patsubst package/%,%,$@)

target/%:
	$(MAKE) -C target $(patsubst target/%,%,$@)

toolchain/%: ${STAGING_DIR}
	$(MAKE) -C toolchain $(patsubst toolchain/%,%,$@)

tools/%:
	$(MAKE) -C tools $(patsubst tools/%,%,$@)

image:
	$(MAKE) -C target image

switch:
	echo "Saving configuration for target: ${ADK_TARGET}"
	cp -p .config .config.${ADK_TARGET}
	if [ -f .config.old ];then cp -p .config.old .config.old.${ADK_TARGET};fi
	if [ -f .config.split ];then cp -p .config.split .config.split.${ADK_TARGET};fi
	if [ -f .config.${TARGET} ];then cp -p .config.${TARGET} .config; \
	cp -p .config.old.${TARGET} .config.old; \
	cp -p .config.split.${TARGET} .config.split; \
	echo "Setting configuration to target: ${TARGET}"; \
	else echo "No old target config found";mv .config .config.bak; make TARGET=${TARGET};fi

kernelconfig:
	cp $(TOPDIR)/target/$(ADK_TARGET)/kernel.config $(BUILD_DIR)/linux/.config
	$(MAKE) -C $(BUILD_DIR)/linux/ ARCH=$(ARCH) menuconfig
	cp $(BUILD_DIR)/linux/.config $(TOPDIR)/target/$(ADK_TARGET)/kernel.config

# create a new package from package/.template
newpackage:
	@echo "Creating new package $(PKG)"
	$(CP) $(TOPDIR)/package/.template $(TOPDIR)/package/$(PKG)
	pkg=$$(echo $(PKG)|tr '[:lower:]-' '[:upper:]_'); \
		$(SED) "s#@UPKG@#$$pkg#" $(TOPDIR)/package/$(PKG)/Makefile
	$(SED) 's#@PKG@#$(PKG)#' $(TOPDIR)/package/$(PKG)/Makefile
	$(SED) 's#@VER@#$(VER)#' $(TOPDIR)/package/$(PKG)/Makefile
	@echo "Edit package/$(PKG)/Makefile to complete"
	@echo "choose PKG_SECTION to add it to an existent submenu"  

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
	rm -rf $(BUILD_DIR) $(BIN_DIR) $(TARGET_DIR) \
		${TOPDIR}/.cfg_${ADK_TARGET}_${ADK_LIBC} \
	    	${TOPDIR}/package/pkglist.d
	rm -f ${TOPDIR}/package/*/info.mk ${TOPDIR}/package/Depends.mk

cleankernel:
	@$(TRACE) cleankernel
	rm -rf $(TOOLCHAIN_BUILD_DIR)/w-linux* $(BUILD_DIR)/linux

cleandir:
	@$(TRACE) cleandir
	@$(MAKE) -C $(CONFIG) clean $(MAKE_TRACE)
	rm -rf $(BUILD_DIR_PFX) $(BIN_DIR_PFX) $(TARGET_DIR_PFX) \
	    ${TOPDIR}/.cfg* ${TOPDIR}/package/pkglist.d
	rm -rf $(TOOLCHAIN_BUILD_DIR_PFX) $(STAGING_PARENT_PFX) \
	    $(TOOLS_BUILD_DIR)
	rm -f .menu .tmpconfig.h ${TOPDIR}/package/*/info.mk \
	    ${TOPDIR}/package/Depends.mk ${TOPDIR}/prereq.mk \
	    .busyboxcfg

cleantarget:
	@$(TRACE) cleantarget
	@$(MAKE) -C $(CONFIG) clean $(MAKE_TRACE)
	rm -rf $(BUILD_DIR) $(BIN_DIR) $(TARGET_DIR) \
		${TOPDIR}/.cfg_${ADK_TARGET}_${ADK_LIBC}
	rm -rf $(TOOLCHAIN_BUILD_DIR) $(STAGING_PARENT)
	rm -f .tmpconfig.h ${TOPDIR}/package/*/info.mk \
		.busyboxcfg all.config .defconfig

distclean:
	@$(TRACE) distclean
	@$(MAKE) -C $(CONFIG) clean $(MAKE_TRACE)
	@rm -rf $(BUILD_DIR_PFX) $(BIN_DIR_PFX) $(TARGET_DIR_PFX) $(DISTDIR) \
	    ${TOPDIR}/.cfg* ${TOPDIR}/package/pkglist.d
	@rm -rf $(TOOLCHAIN_BUILD_DIR_PFX) $(STAGING_PARENT_PFX) \
		$(TOOLS_BUILD_DIR)
	@rm -f .config* .defconfig .tmpconfig.h all.config ${TOPDIR}/prereq.mk \
	    .menu ${TOPDIR}/package/*/info.mk ${TOPDIR}/package/Depends.mk \
	    .busyboxcfg .ADK_HAVE_DOT_CONFIG

else # ! ifeq ($(strip $(ADK_HAVE_DOT_CONFIG)),y)

ifeq ($(filter-out distclean,${MAKECMDGOALS}),)
include ${TOPDIR}/mk/vars.mk
else
include $(TOPDIR)/prereq.mk
export BASH HOSTCC HOSTCFLAGS HOSTCXX HOSTCXXFLAGS MAKE LANGUAGE LC_ALL OStype PATH
endif

all: menuconfig
	@echo "Start the build with \"make\" or with \"make v\" to be verbose"

# configuration
# ---------------------------------------------------------------------------

# force entering the subdir, as dependency checking is done there
.PHONY: $(CONFIG)/conf $(CONFIG)/mconf $(CONFIG)/gconf

$(CONFIG)/conf:
	@$(MAKE) -C $(CONFIG) conf

$(CONFIG)/mconf:
	@$(MAKE) -C $(CONFIG)

$(CONFIG)/gconf:
	@$(MAKE) -C $(CONFIG) gconf

defconfig: .menu $(CONFIG)/conf
ifeq (${OStype},Linux)
	@echo ADK_HOST_LINUX=y > $(TOPDIR)/.defconfig
endif
ifeq (${OStype},FreeBSD)
	@echo ADK_HOST_FREEBSD=y > $(TOPDIR)/.defconfig
endif
ifeq (${OStype},MirBSD)
	@echo ADK_HOST_MIRBSD=y > $(TOPDIR)/.defconfig
endif
ifeq (${OStype},OpenBSD)
	@echo ADK_HOST_OPENBSD=y > $(TOPDIR)/.defconfig
endif
ifeq (${OStype},NetBSD)
	@echo ADK_HOST_NETBSD=y > $(TOPDIR)/.defconfig
endif
ifeq (${OStype},Darwin)
	@echo ADK_HOST_DARWIN=y > $(TOPDIR)/.defconfig
endif
ifneq (,$(filter CYGWIN%,${OStype}))
	@echo ADK_HOST_CYGWIN=y > $(TOPDIR)/.defconfig
endif
	@if [ ! -z "$(TARGET)" ];then \
		grep "^config" target/Config.in \
			|grep -i "$(TARGET)"\$$ \
			|sed -e "s#^config \(.*\)#\1=y#" \
			 >> $(TOPDIR)/.defconfig; \
	fi
	@for symbol in ${DEFCONFIG}; do \
		echo $$symbol >> $(TOPDIR)/.defconfig; \
	done
	@if [ ! -z "$(FS)" ];then \
		grep "^config" target/Config.in \
			|grep -i "$(FS)" \
			|sed -e "s#^config \(.*\)#\1=y#" \
			>> $(TOPDIR)/.defconfig; \
	fi
	@if [ ! -z "$(PKG)" ];then \
		grep "^config" target/Config.in \
			|grep -i "$(PKG)" \
			|sed -e "s#^config \(.*\)#\1=y#" \
			>> $(TOPDIR)/.defconfig; \
	fi
	@if [ ! -z "$(LIBC)" ];then \
		grep "^config" target/Config.in \
			|grep -i "$(LIBC)" \
			|sed -e "s#^config \(.*\)#\1=y#" \
			>> $(TOPDIR)/.defconfig; \
	fi
ifneq (,$(filter %_qemu,${TARGET}))
	@echo ADK_LINUX_QEMU=y >> $(TOPDIR)/.defconfig
endif
ifneq (,$(filter %_toolchain,${TARGET}))
	@echo ADK_LINUX_TOOLCHAIN=y >> $(TOPDIR)/.defconfig
endif
ifneq (,$(filter rescue%,${TARGET}))
	@echo ADK_LINUX_RESCUE=y >> $(TOPDIR)/.defconfig
endif
ifneq (,$(filter rb%,${TARGET}))
	@echo ADK_LINUX_MIKROTIK=y >> $(TOPDIR)/.defconfig
endif
ifneq (,$(filter alix%,${TARGET}))
	@echo ADK_LINUX_ALIX=y >> $(TOPDIR)/.defconfig
endif
ifneq (,$(filter wrap%,${TARGET}))
	@echo ADK_LINUX_ALIX=y >> $(TOPDIR)/.defconfig
endif
	@if [ ! -z "$(TARGET)" ];then \
		$(CONFIG)/conf -D .defconfig $(CONFIG_CONFIG_IN); \
	fi

modconfig:
ifeq (${OStype},Linux)
	@echo ADK_HOST_LINUX=y > $(TOPDIR)/all.config
endif
ifeq (${OStype},FreeBSD)
	@echo ADK_HOST_FREEBSD=y > $(TOPDIR)/all.config
endif
ifeq (${OStype},MirBSD)
	@echo ADK_HOST_MIRBSD=y > $(TOPDIR)/all.config
endif
ifeq (${OStype},OpenBSD)
	@echo ADK_HOST_OPENBSD=y > $(TOPDIR)/all.config
endif
ifeq (${OStype},NetBSD)
	@echo ADK_HOST_NETBSD=y > $(TOPDIR)/all.config
endif
ifeq (${OStype},Darwin)
	@echo ADK_HOST_DARWIN=y > $(TOPDIR)/all.config
endif
ifneq (,$(filter CYGWIN%,${OStype}))
	@echo ADK_HOST_CYGWIN=y > $(TOPDIR)/all.config
endif
	@if [ ! -z "$(TARGET)" ];then \
		grep "^config" target/Config.in \
			|grep -i "$(TARGET)"\$$ \
			|sed -e "s#^config \(.*\)#\1=y#" \
			>> $(TOPDIR)/all.config; \
	fi
	@for symbol in ${DEFCONFIG}; do \
		echo $$symbol >> $(TOPDIR)/all.config; \
	done
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
ifneq (,$(filter %_toolchain,${TARGET}))
	@echo ADK_LINUX_TOOLCHAIN=y >> $(TOPDIR)/all.config
endif
ifneq (,$(filter %_rescue,${TARGET}))
	@echo ADK_LINUX_RESCUE=y >> $(TOPDIR)/all.config
endif
ifneq (,$(filter rb%,${TARGET}))
	@echo ADK_LINUX_MIKROTIK=y >> $(TOPDIR)/all.config
endif
ifneq (,$(filter alix%,${TARGET}))
	@echo ADK_LINUX_ALIX=y >> $(TOPDIR)/all.config
endif
ifneq (,$(filter wrap%,${TARGET}))
	@echo ADK_LINUX_ALIX=y >> $(TOPDIR)/all.config
endif

menuconfig: $(CONFIG)/mconf defconfig .menu package/Config.in.auto
	@if [ ! -f .config ];then \
		$(CONFIG)/conf -D .defconfig $(CONFIG_CONFIG_IN); \
	fi
	@$(CONFIG)/mconf $(CONFIG_CONFIG_IN)
	${POSTCONFIG}

guiconfig: $(CONFIG)/gconf defconfig .menu
	@if [ ! -f .config ];then \
		$(CONFIG)/conf -D .defconfig $(CONFIG_CONFIG_IN); \
	fi
	@$(CONFIG)/gconf $(CONFIG_CONFIG_IN)
	${POSTCONFIG}

_config: $(CONFIG)/conf .menu
	-@touch .config
	@$(CONFIG)/conf ${W} $(CONFIG_CONFIG_IN)
	${POSTCONFIG}

.NOTPARALLEL: _mconfig
_mconfig: ${CONFIG}/conf _mconfig2 _config
_mconfig2: ${CONFIG}/conf modconfig .menu
	@${CONFIG}/conf -m ${RCONFIG} >/dev/null

distclean:
	@$(MAKE) -C $(CONFIG) clean
	@rm -rf $(BUILD_DIR_PFX) $(BIN_DIR_PFX) $(TARGET_DIR_PFX) $(DISTDIR) \
	    ${TOPDIR}/.cfg* ${TOPDIR}/package/pkglist.d 
	@rm -rf $(TOOLCHAIN_BUILD_DIR_PFX) $(STAGING_PARENT_PFX) $(TOOLS_BUILD_DIR)
	@rm -f .config* .defconfig .tmpconfig.h all.config ${TOPDIR}/prereq.mk \
	    .menu ${TOPDIR}/package/*/info.mk ${TOPDIR}/package/Depends.mk .ADK_HAVE_DOT_CONFIG


endif # ! ifeq ($(strip $(ADK_HAVE_DOT_CONFIG)),y)

# build all targets and combinations
bulk:
	@while read target libc fs; do \
		mkdir -p $(TOPDIR)/bin/$${target}_$$libc; \
	    ( \
		echo === building $$target $$libc $$fs on $$(date); \
		$(GMAKE) prereq && \
			$(GMAKE) TARGET=$$target LIBC=$$libc FS=$$fs defconfig; \
			$(GMAKE) VERBOSE=1 all; \
		rm .config; \
	    ) 2>&1 | tee $(TOPDIR)/bin/$${target}_$$libc/$$target-$$libc-$$fs.log; \
	done <${TOPDIR}/target/bulkdef.lst

bulktoolchain:
	@while read target libc; do \
		mkdir -p $(TOPDIR)/bin/$${target}_$$libc; \
	    ( \
		echo === building $$target $$libc on $$(date); \
		$(GMAKE) prereq && \
			$(GMAKE) TARGET=$$target LIBC=$$libc defconfig; \
			$(GMAKE) VERBOSE=1 all; \
		rm .config; \
	    ) 2>&1 | tee $(TOPDIR)/bin/$${target}_$$libc/$$target-$$libc.log; \
	done <${TOPDIR}/target/bulktool.lst

bulkall:
	@while read target libc fs; do \
		mkdir -p $(TOPDIR)/bin/$${target}_$$libc; \
	    ( \
		echo === building $$target $$libc $$fs on $$(date); \
		$(GMAKE) prereq && \
			$(GMAKE) TARGET=$$target LIBC=$$libc FS=$$fs allconfig; \
			$(GMAKE) VERBOSE=1 all; \
		rm .config; \
	    ) 2>&1 | tee $(TOPDIR)/bin/$${target}_$$libc/$$target-$$libc-$$fs.log; \
	done <${TOPDIR}/target/bulk.lst

bulkallmod:
	@while read target libc fs; do \
		mkdir -p $(TOPDIR)/bin/$${target}_$$libc; \
	    ( \
		echo === building $$target $$libc $$fs on $$(date); \
		$(GMAKE) prereq && \
			$(GMAKE) TARGET=$$target LIBC=$$libc FS=$$fs allmodconfig; \
			$(GMAKE) VERBOSE=1 all; \
		rm .config; \
	    ) 2>&1 | tee $(TOPDIR)/bin/$${target}_$$libc/$$target-$$libc-$$fs.log; \
	done <${TOPDIR}/target/bulk.lst

${TOPDIR}/bin/tools/pkgmaker:
	@$(HOSTCC) -g -o $@ tools/adk/pkgmaker.c tools/adk/sortfile.c tools/adk/strmap.c

package/Config.in.auto menu .menu: $(wildcard ${TOPDIR}/package/*/Makefile) ${TOPDIR}/bin/tools/pkgmaker
	@echo "Generating menu structure ..."
	@mkdir -p $(TOPDIR)/bin/tools
	@$(TOPDIR)/bin/tools/pkgmaker
	@:>.menu

dep:
	@echo "Generating dependencies ..."
	$(TOPDIR)/bin/tools/depmaker > ${TOPDIR}/package/Depends.mk

.PHONY: menu dep

include $(TOPDIR)/toolchain/gcc/Makefile.inc

check:
	@-rm tests/adk.exp tests/master.exp
	@sed -e "s#@ADK_TARGET_IP@#$(ADK_TARGET_IP)#" tests/adk.exp.in > \
		tests/adk.exp
	@sed -e "s#@TOPDIR@#$(TOPDIR)#" tests/master.exp.in > \
		tests/master.exp
	env DEJAGNU=$(TOPDIR)/tests/master.exp \
	$(MAKE) -C $(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/$(PKG_NAME)-$(PKG_VERSION)-final/gcc check-gcc
