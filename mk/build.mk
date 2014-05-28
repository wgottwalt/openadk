# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

TOPDIR=$(shell pwd)
export TOPDIR

ifneq ($(shell umask 2>/dev/null | sed 's/0*022/OK/'),OK)
$(error your umask is not 022)
endif

CONFIG_CONFIG_IN = Config.in
CONFIG = adk/config
DEFCONFIG=		ADK_DEBUG=n \
			ADK_STATIC=n \
			ADK_DISABLE_KERNEL_PATCHES=n \
			ADK_DISABLE_TARGET_KERNEL_PATCHES=n \
			ADK_WGET_TIMEOUT=180 \
			ADK_MAKE_PARALLEL=y \
			ADK_MAKE_JOBS=4 \
			ADK_LEAVE_ETC_ALONE=n \
			ADK_SIMPLE_NETWORK_CONFIG=n \
			ADK_USE_CCACHE=n \
			ADK_RUNTIME_START_SERVICES=n \
			ADK_PACKAGE_BASE_FILES=y \
			ADK_PACKAGE_KEXECINIT=n \
			ADK_PACKAGE_LM_SENSORS_DETECT=n \
			ADK_PACKAGE_CLASSPATH=n \
			ADK_PACKAGE_U_BOOT=n \
			ADK_PACKAGE_CRYPTINIT=n \
			ADK_PACKAGE_VIRTINST=n \
			ADK_PACKAGE_URLGRABBER=n \
			ADK_PACKAGE_LIBSSP=n \
			ADK_PACKAGE_OPENAFS=n \
			ADK_KERNEL_ADDON_YAFFS2=n \
			ADK_KERNEL_ADDON_GRSEC=n \
			ADK_KERNEL_ADDON_MPTCP=n \
			ADK_PKG_XORG=n \
			ADK_PKG_CONSOLE=n \
			ADK_PKG_TEST=n \
			ADK_PKG_MPDBOX=n \
			ADK_PKG_DEVELOPMENT=n \
			ADK_TOOLCHAIN_WITH_SSP=n \
			ADK_TARGET_USE_SSP=n \
			ADK_TOOLCHAIN_WITH_LTO=n \
			ADK_TARGET_USE_LTO=n \
			ADK_TOOLCHAIN_WITH_GOLD=n \
			ADK_TARGET_USE_GOLD=n \
			ADK_TARGET_USE_GNU_HASHSTYLE=n \
			ADK_TARGET_USE_PIE=n \
			ADK_LINUX_ARM_WITH_THUMB=n \
			BUSYBOX_IFPLUGD=n \
			BUSYBOX_EXTRA_COMPAT=n \
			BUSYBOX_FEATURE_IFCONFIG_SLIP=n \
			BUSYBOX_BBCONFIG=n \
			BUSYBOX_SELINUX=n \
			BUSYBOX_INSTALL_NO_USR=n \
			BUSYBOX_MODPROBE_SMALL=n \
			BUSYBOX_EJECT=n \
			BUSYBOX_UBIDETACH=n \
			BUSYBOX_UBIATTACH=n \
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
			BUSYBOX_FEATURE_INETD_RPC=n \
			BUSYBOX_FEATURE_MOUNT_NFS=n \
			BUSYBOX_FEATURE_VI_REGEX_SEARCH=n \
			ADK_KERNEL_RT2X00_DEBUG=n \
			ADK_KERNEL_ATH5K_DEBUG=n \
			ADK_KERNEL_BUG=n \
			ADK_KERNEL_DEBUG_WITH_KGDB=n

noconfig_targets:=	menuconfig \
			_config \
			_mconfig \
			distclean \
			defconfig

POSTCONFIG=		-@\
	if [ -f .adkinit ];then rm .adkinit;\
	else \
	if [ -f .config.old ];then \
		$(TOPDIR)/adk/tools/pkgrebuild;\
		rebuild=0; \
		if [ "$$(grep ^BUSYBOX .config|md5sum)" != "$$(grep ^BUSYBOX .config.old|md5sum)" ];then \
			touch .rebuild.busybox;\
			rebuild=1;\
		fi; \
		for i in ADK_RUNTIME_PASSWORD ADK_RUNTIME_TMPFS_SIZE ADK_RUNTIME_HOSTNAME ADK_TARGET_ROOTFS ADK_RUNTIME_CONSOLE ADK_RUNTIME_GETTY ADK_RUNTIME_SHELL;do \
			if [ "$$(grep ^$$i .config|md5sum)" != "$$(grep ^$$i .config.old|md5sum)" ];then \
				touch .rebuild.base-files;\
				rebuild=1;\
			fi; \
		done; \
		if [ "$$(grep ^ADK_RUNTIME_TIMEZONE .config|md5sum)" != "$$(grep ^ADK_RUNTIME_TIMEZONE .config.old|md5sum)" ];then \
			touch .rebuild.musl .rebuild.uclibc .rebuild.glibc;\
			rebuild=1;\
		fi; \
		if [ "$$(grep ^ADK_RUNTIME_SSH_PUBKEY .config|md5sum)" != "$$(grep ^ADK_RUNTIME_SSH_PUBKEY .config.old|md5sum)" ];then \
			touch .rebuild.dropbear .rebuild.openssh;\
			rebuild=1;\
		fi; \
		if [ "$$(grep ^ADK_RUNTIME_KBD_LAYOUT .config|md5sum)" != "$$(grep ^ADK_RUNTIME_KBD_LAYOUT .config.old|md5sum)" ];then \
			touch .rebuild.bkeymaps;\
			rebuild=1;\
		fi; \
		if [ "$$(grep ^ADK_KERNEL_ADDON .config|md5sum)" != "$$(grep ^ADK_KERNEL_ADDON .config.old|md5sum)" ];then \
			make cleankernel;\
		fi; \
		if [ $$rebuild -eq 1 ];then \
			cp .config .config.old;\
		fi; \
	fi; \
	fi

# Pull in the user's configuration file
ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
-include $(TOPDIR)/.config
endif

ifeq ($(strip $(ADK_HAVE_DOT_CONFIG)),y)
include $(TOPDIR)/rules.mk

all: world

${TOPDIR}/package/Depends.mk: ${TOPDIR}/.config $(wildcard ${TOPDIR}/package/*/Makefile) $(TOPDIR)/adk/tools/depmaker
	$(TOPDIR)/adk/tools/depmaker > ${TOPDIR}/package/Depends.mk

.NOTPARALLEL:
.PHONY: all world clean cleandir cleantoolchain distclean image_clean

world:
	mkdir -p $(DL_DIR) $(HOST_BUILD_DIR) $(BUILD_DIR) $(TARGET_DIR) $(FW_DIR) \
		$(STAGING_HOST_DIR) $(TOOLCHAIN_BUILD_DIR) $(STAGING_PKG_DIR)/stamps
	${BASH} ${TOPDIR}/scripts/scan-pkgs.sh
ifeq ($(ADK_TARGET_TOOLCHAIN),y)
ifeq ($(ADK_TOOLCHAIN_ONLY),y)
	$(MAKE) -f mk/build.mk package/hostcompile toolchain/fixup package/compile
else
	$(MAKE) -f mk/build.mk package/hostcompile toolchain/fixup package/compile root_clean package/install
endif
else
	$(MAKE) -f mk/build.mk package/hostcompile toolchain/fixup target/config-prepare target/compile package/compile root_clean package/install target/install package_index
endif

package_index:
ifeq ($(ADK_TARGET_PACKAGE_IPKG),y)
	-cd ${PACKAGE_DIR} && \
	    ${BASH} ${TOPDIR}/scripts/ipkg-make-index.sh . >Packages
endif

${STAGING_TARGET_DIR} ${STAGING_TARGET_DIR}/etc ${STAGING_HOST_DIR}:
	mkdir -p ${STAGING_TARGET_DIR}/{bin,etc,lib,usr/bin,usr/include,usr/lib/pkgconfig} \
		${STAGING_HOST_DIR}/{usr/bin,usr/lib,usr/include}
	for i in lib64 lib32 libx32;do \
		cd ${STAGING_TARGET_DIR}/; ln -sf lib $$i; \
		cd ${STAGING_TARGET_DIR}/usr; ln -sf lib $$i; \
	done

${STAGING_TARGET_DIR}/etc/ipkg.conf: ${STAGING_TARGET_DIR}/etc
ifeq ($(ADK_TARGET_PACKAGE_IPKG),y)
	echo "dest root /" >${STAGING_TARGET_DIR}/etc/ipkg.conf
	echo "option offline_root ${TARGET_DIR}" >>$(STAGING_TARGET_DIR)/etc/ipkg.conf
endif

package/%: ${STAGING_TARGET_DIR}/etc/ipkg.conf ${TOPDIR}/package/Depends.mk
	$(MAKE) -C package $(patsubst package/%,%,$@)

target/%:
	$(MAKE) -C target $(patsubst target/%,%,$@)

toolchain/%: ${STAGING_TARGET_DIR}
	$(MAKE) -C toolchain $(patsubst toolchain/%,%,$@)

image:
	$(MAKE) -C target image

targethelp:
	$(MAKE) -C target targethelp 

kernelconfig:
	${KERNEL_MAKE_ENV} ${MAKE} \
		ARCH=$(ADK_TARGET_ARCH) \
		${KERNEL_MAKE_OPTS} \
		-C $(BUILD_DIR)/linux menuconfig

# create a new package from package/.template
newpackage:
	@echo "Creating new package $(PKG)"
	$(CP) $(TOPDIR)/package/.template$(TYPE) $(TOPDIR)/package/$(PKG)
	pkg=$$(echo $(PKG)|tr '[:lower:]-' '[:upper:]_'); \
		$(SED) "s#@UPKG@#$$pkg#" $(TOPDIR)/package/$(PKG)/Makefile
	$(SED) 's#@PKG@#$(PKG)#' $(TOPDIR)/package/$(PKG)/Makefile
	$(SED) 's#@VER@#$(VER)#' $(TOPDIR)/package/$(PKG)/Makefile
	@echo "Edit package/$(PKG)/Makefile to complete"

root_clean:
	@$(TRACE) root_clean
	rm -rf $(TARGET_DIR)
	mkdir -p $(TARGET_DIR)
	touch $(TARGET_DIR)/.adk

# Do a per-package clean here, too. This way stale headers and
# libraries from target_*/ get wiped away, which keeps
# future package build's configure scripts from returning false
# dependencies information.

clean:
	@$(TRACE) clean
	$(MAKE) -C $(CONFIG) clean
	for f in $$(ls ${STAGING_PKG_DIR}/ 2>/dev/null |grep -v [A-Z]|grep -v stamps 2>/dev/null); do  \
		while read file ; do \
			rm ${STAGING_TARGET_DIR}/$$file 2>/dev/null;\
		done < ${STAGING_PKG_DIR}/$$f ; \
		rm ${STAGING_PKG_DIR}/$$f ; \
	done
	rm -rf $(BUILD_DIR) $(FW_DIR) $(TARGET_DIR) \
	    	${TOPDIR}/package/pkglist.d
	rm -f ${TOPDIR}/package/Depends.mk

cleankernel:
	@$(TRACE) cleankernel
	rm -rf $(TOOLCHAIN_BUILD_DIR)/w-linux* $(BUILD_DIR)/linux

cleandir:
	@$(TRACE) cleandir
	@$(MAKE) -C $(CONFIG) clean $(MAKE_TRACE) 
	rm -rf $(BUILD_DIR_PFX) $(FW_DIR_PFX) $(TARGET_DIR_PFX) \
	    ${TOPDIR}/package/pkglist.d ${TOPDIR}/package/pkgconfigs.d
	rm -rf $(TOOLCHAIN_DIR_PFX) $(STAGING_HOST_DIR_PFX)
	rm -rf $(STAGING_TARGET_DIR_PFX) $(STAGING_PKG_DIR_PFX)
	rm -f .menu .tmpconfig.h .rebuild* ${TOPDIR}/package/Depends.mk ${TOPDIR}/prereq.mk

distclean:
	@$(TRACE) distclean
	@$(MAKE) -C $(CONFIG) clean $(MAKE_TRACE)
	@rm -rf $(BUILD_DIR_PFX) $(FW_DIR_PFX) $(TARGET_DIR_PFX) $(DL_DIR) \
	    ${TOPDIR}/package/pkglist.d ${TOPDIR}/package/pkgconfigs.d
	@rm -rf $(TOOLCHAIN_DIR_PFX) $(STAGING_HOST_DIR_PFX)
	@rm -rf $(STAGING_TARGET_DIR_PFX) $(STAGING_PKG_DIR_PFX)
	@rm -f .adkinit .config* .defconfig .tmpconfig.h all.config ${TOPDIR}/prereq.mk \
	    .menu ${TOPDIR}/package/Depends.mk .ADK_HAVE_DOT_CONFIG .rebuild.*

else # ! ifeq ($(strip $(ADK_HAVE_DOT_CONFIG)),y)

ifeq ($(filter-out distclean,${MAKECMDGOALS}),)
include ${TOPDIR}/mk/vars.mk
else
include $(TOPDIR)/prereq.mk
export BASH MAKE LANGUAGE LC_ALL OStype PATH CC_FOR_BUILD QEMU SHELL
endif

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
	@echo 'source "target/config/Config.in.arch.default"' > target/config/Config.in.arch
	@echo 'source "target/config/Config.in.arch.choice"' >> target/config/Config.in.arch
	@echo 'source "target/config/Config.in.system.default"' > target/config/Config.in.system
	@echo 'source "target/config/Config.in.system.choice"' >> target/config/Config.in.system
	@if [ ! -z "$(ADK_TARGET_ARCH)" ];then \
		grep "^config" target/config/Config.in.arch.choice \
			|grep -i "$(ADK_TARGET_ARCH)"\$$ \
			|sed -e "s#^config \(.*\)#\1=y#" \
			 >> $(TOPDIR)/.defconfig; \
	fi
	@for symbol in ${DEFCONFIG}; do \
		echo $$symbol >> $(TOPDIR)/.defconfig; \
	done
	@if [ ! -z "$(ADK_TARGET_FS)" ];then \
		grep "^config" target/config/Config.in.target \
			|grep -i "$(ADK_TARGET_FS)" \
			|sed -e "s#^config \(.*\)#\1=y#" \
			>> $(TOPDIR)/.defconfig; \
	fi
	@if [ ! -z "$(ADK_TARGET_COLLECTION)" ];then \
		grep -h "^config" target/packages/pkg-available/* \
			|grep -i "$(ADK_TARGET_COLLECTION)" \
			|sed -e "s#^config \(.*\)#\1=y#" \
			>> $(TOPDIR)/.defconfig; \
	fi
	@if [ ! -z "$(ADK_TARGET_LIBC)" ];then \
		grep "^config" target/config/Config.in.libc.choice \
			|grep -i "$(ADK_TARGET_LIBC)" \
			|sed -e "s#^config \(.*\)#\1=y#" \
			>> $(TOPDIR)/.defconfig; \
	fi
	@if [ ! -z "$(ADK_TARGET_SYSTEM)" ];then \
		system=$$(echo "$(ADK_TARGET_SYSTEM)" |sed -e "s/-/_/g"); \
		grep -h "^config" target/*/Config.in.systems \
			|grep -i "$$system$$" \
			|sed -e "s#^config \(.*\)#\1=y#" \
			>> $(TOPDIR)/.defconfig; \
	fi
	@if [ ! -z "$(ADK_TARGET_SYSTEM)" ];then \
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
	@echo 'source "target/config/Config.in.arch.default"' > target/config/Config.in.arch
	@echo 'source "target/config/Config.in.arch.choice"' >> target/config/Config.in.arch
	@echo 'source "target/config/Config.in.system.default"' > target/config/Config.in.system
	@echo 'source "target/config/Config.in.system.choice"' >> target/config/Config.in.system
	@if [ ! -z "$(ADK_TARGET_ARCH)" ];then \
		grep "^config" target/config/Config.in.arch.choice \
			|grep -i "$(ADK_TARGET_ARCH)"\$$ \
			|sed -e "s#^config \(.*\)#\1=y#" \
			>> $(TOPDIR)/all.config; \
	fi
	@for symbol in ${DEFCONFIG}; do \
		echo $$symbol >> $(TOPDIR)/all.config; \
	done
	@if [ ! -z "$(ADK_TARGET_FS)" ];then \
		grep "^config" target/config/Config.in.target \
			|grep -i "$(ADK_TARGET_FS)" \
			|sed -e "s#^config \(.*\)#\1=y#" \
			>> $(TOPDIR)/all.config; \
	fi
	@if [ ! -z "$(ADK_TARGET_LIBC)" ];then \
		grep "^config" target/config/Config.in.libc.choice \
			|grep -i "$(ADK_TARGET_LIBC)" \
			|sed -e "s#^config \(.*\)#\1=y#" \
			>> $(TOPDIR)/all.config; \
	fi
	@if [ ! -z "$(ADK_TARGET_SYSTEM)" ];then \
		system=$$(echo "$(ADK_TARGET_SYSTEM)" |sed -e "s/-/_/g"); \
		grep -h "^config" target/*/Config.in.systems \
			|grep -i "$$system" \
			|sed -e "s#^config \(.*\)#\1=y#" \
			>> $(TOPDIR)/all.config; \
	fi

menuconfig: $(CONFIG)/mconf defconfig .menu package/Config.in.auto
	@if [ ! -f .config ];then \
		$(CONFIG)/conf -D .defconfig $(CONFIG_CONFIG_IN); \
	fi
	@$(CONFIG)/mconf $(CONFIG_CONFIG_IN)
	${POSTCONFIG}

_config: $(CONFIG)/conf .menu package/Config.in.auto
	-@touch .config
	@$(CONFIG)/conf ${W} $(CONFIG_CONFIG_IN)
	${POSTCONFIG}

.NOTPARALLEL: _mconfig
_mconfig: ${CONFIG}/conf _mconfig2 _config
_mconfig2: ${CONFIG}/conf modconfig .menu
	@${CONFIG}/conf -m ${RCONFIG} >/dev/null

distclean:
	@$(MAKE) -C $(CONFIG) clean
	@rm -rf $(BUILD_DIR_PFX) $(FW_DIR_PFX) $(TARGET_DIR_PFX) $(DL_DIR) \
	    ${TOPDIR}/package/pkglist.d ${TOPDIR}/package/pkgconfigs.d
	@rm -rf $(TOOLCHAIN_DIR_PFX) $(STAGING_TARGET_DIR_PFX)
	@rm -rf $(STAGING_HOST_DIR_PFX) $(STAGING_TARGET_DIR_PFX) $(STAGING_PKG_DIR_PFX)
	@rm -f .adkinit .config* .defconfig .tmpconfig.h all.config ${TOPDIR}/prereq.mk \
	    .menu .rebuild.* ${TOPDIR}/package/Depends.mk .ADK_HAVE_DOT_CONFIG


endif # ! ifeq ($(strip $(ADK_HAVE_DOT_CONFIG)),y)

buildall:
	@mkdir -p firmware
	@echo "=== building $(ADK_TARGET_SYSTEM) ($(ADK_TARGET_ARCH)) with $(ADK_TARGET_LIBC) ==="
	$(GMAKE) prereq
	$(GMAKE) ADK_TARGET_ARCH=$(ADK_TARGET_ARCH) ADK_TARGET_SYSTEM=$(ADK_TARGET_SYSTEM) ADK_TARGET_LIBC=$(ADK_TARGET_LIBC) allmodconfig
	$(GMAKE) VERBOSE=1 all 2>&1 | tee firmware/buildall.log

$(TOPDIR)/adk/tools/pkgmaker: $(TOPDIR)/adk/tools/pkgmaker.c $(TOPDIR)/adk/tools/sortfile.c $(TOPDIR)/adk/tools/strmap.c
	@$(CC_FOR_BUILD) -g -o $@ adk/tools/pkgmaker.c adk/tools/sortfile.c adk/tools/strmap.c

$(TOPDIR)/adk/tools/pkgrebuild: $(TOPDIR)/adk/tools/pkgrebuild.c $(TOPDIR)/adk/tools/strmap.c
	@$(CC_FOR_BUILD) -g -o $@ adk/tools/pkgrebuild.c adk/tools/strmap.c

package/Config.in.auto menu .menu: $(wildcard ${TOPDIR}/package/*/Makefile) $(TOPDIR)/adk/tools/pkgmaker $(TOPDIR)/adk/tools/pkgrebuild
	@echo "Generating menu structure ..."
	@$(TOPDIR)/adk/tools/pkgmaker
	@:>.menu

$(TOPDIR)/adk/tools/depmaker: $(TOPDIR)/adk/tools/depmaker.c
	$(CC_FOR_BUILD) -g -o $@ $(TOPDIR)/adk/tools/depmaker.c

dep: $(TOPDIR)/adk/tools/depmaker
	@echo "Generating dependencies ..."
	@$(TOPDIR)/adk/tools/depmaker > ${TOPDIR}/package/Depends.mk

.PHONY: menu dep

include $(TOPDIR)/toolchain/gcc/Makefile.inc

check-dejagnu:
	@-rm adk/tests/adk.exp adk/tests/master.exp >/dev/null 2>&1
	@sed -e "s#@ADK_TARGET_IP@#$(ADK_TARGET_IP)#" \
		-e "s#@ADK_TARGET_PORT@#$(ADK_TARGET_PORT)#" \
		adk/tests/adk.exp.in > adk/tests/adk.exp
	@sed -e "s#@TOPDIR@#$(TOPDIR)#" adk/tests/master.exp.in > \
		adk/tests/master.exp

check-gcc: check-dejagnu
	env DEJAGNU=$(TOPDIR)/adk/tests/master.exp \
	$(MAKE) -C $(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/$(PKG_NAME)-$(PKG_VERSION)-final/gcc check-gcc

check-g++: check-dejagnu
	env DEJAGNU=$(TOPDIR)/adk/tests/master.exp \
	$(MAKE) -C $(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/$(PKG_NAME)-$(PKG_VERSION)-final/gcc check-g++

check: check-gcc check-g++
