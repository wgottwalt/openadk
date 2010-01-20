# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		rng-tools
PKG_VERSION:=		2
PKG_RELEASE:=		1
PKG_MD5SUM:=		63d503191eabed630324c104cc024475
PKG_DESCR:=		Daemon to use hardware random number generators.
PKG_SECTION:=		utils
PKG_DEPENDS:=
PKG_URL:=		http://gkernel.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=gkernel/}

# if downloaded package is not ending with .tar.gz use following
#DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,RNG_TOOLS,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
# use following to add ./configure options
#CONFIGURE_ARGS+=	--disable-foo
# overwrite any configure variables
#CONFIGURE_ENV+=	ac_cv_func_setpgrp_void=yes
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

# please install all files and directories to the package dir
post-install:
	$(INSTALL_DIR) $(IDIR_RNG_TOOLS)/usr/{s,}bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/rngtest $(IDIR_RNG_TOOLS)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/rngd $(IDIR_RNG_TOOLS)/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
