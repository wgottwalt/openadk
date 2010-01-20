# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		cpufrequtils
PKG_VERSION:=		007
PKG_RELEASE:=		1
PKG_MD5SUM:=		40271a1e1eadce31457e9891cdb071f1
PKG_DESCR:=		Userspace utilities for the Linux kernel cpufreq subsystem
PKG_SECTION:=		utils
PKG_DEPENDS:=		@add dependendant package names@
PKG_URL:=		http://www.kernel.org/pub/linux/utils/kernel/cpufreq/cpufrequtils.html
PKG_SITES:=		http://www.kernel.org/pub/linux/utils/kernel/cpufreq/

# if downloaded package is not ending with .tar.gz use following
#DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,CPUFREQUTILS,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

# use following to add ./configure options
#CONFIGURE_ARGS+=	--disable-foo
# overwrite any configure variables
#CONFIGURE_ENV+=	ac_cv_func_setpgrp_void=yes
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto
MAKE_FLAGS+=		V=true CROSS=${TARGET_CROSS} LIBTOOL_OPT="--tag CC"

#FIXME: libtool does crap when installing stuff (appends i to the .la file and wonders afterwards why it doesn't exist)

# please install all files and directories to the package dir
post-install:
	$(INSTALL_DIR) $(IDIR_CPUFREQUTILS)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/cpufrequtils $(IDIR_CPUFREQUTILS)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
