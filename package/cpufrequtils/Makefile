# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		cpufrequtils
PKG_VERSION:=		008
PKG_RELEASE:=		1
PKG_HASH:=		4e9d9cd5eb573d5b4c82bcb28a8b36f9ca8e780436bc78b1f90c404888445a76
PKG_DESCR:=		utilities for cpufreq subsystem
PKG_SECTION:=		sys/hw
PKG_URL:=		http://www.kernel.org/pub/linux/utils/kernel/cpufreq/cpufrequtils.html
PKG_SITES:=		http://www.kernel.org/pub/linux/utils/kernel/cpufreq/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,CPUFREQUTILS,cpufrequtils,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

XAKE_FLAGS+=		NLS=no
CONFIG_STYLE:=		manual

cpufrequtils-install:
	$(INSTALL_DIR) $(IDIR_CPUFREQUTILS)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libcpufreq.so* \
		$(IDIR_CPUFREQUTILS)/usr/lib
	$(INSTALL_DIR) $(IDIR_CPUFREQUTILS)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/cpufreq-set \
		$(IDIR_CPUFREQUTILS)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/cpufreq-info \
		$(IDIR_CPUFREQUTILS)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
