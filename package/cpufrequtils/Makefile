# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		cpufrequtils
PKG_VERSION:=		007
PKG_RELEASE:=		1
PKG_MD5SUM:=		40271a1e1eadce31457e9891cdb071f1
PKG_DESCR:=		Userspace utilities for the Linux kernel cpufreq subsystem
PKG_SECTION:=		utils
PKG_URL:=		http://www.kernel.org/pub/linux/utils/kernel/cpufreq/cpufrequtils.html
PKG_SITES:=		http://www.kernel.org/pub/linux/utils/kernel/cpufreq/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,CPUFREQUTILS,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto
MAKE_FLAGS+=		CROSS=${TARGET_CROSS}

post-install:
	$(INSTALL_DIR) $(IDIR_CPUFREQUTILS)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libcpufreq.so* \
		$(IDIR_CPUFREQUTILS)/usr/lib
	$(INSTALL_DIR) $(IDIR_CPUFREQUTILS)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/cpufreq-set \
		$(IDIR_CPUFREQUTILS)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/cpufreq-info \
		$(IDIR_CPUFREQUTILS)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
