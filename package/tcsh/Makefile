# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		tcsh
PKG_VERSION:=		6.17.00
PKG_RELEASE:=		1
PKG_MD5SUM:=		c47de903e3d52f6824c8dd0c91eeb477
PKG_DESCR:=		alternative csh
PKG_SECTION:=		shells
PKG_DEPENDS:=		libncurses
PKG_BUILDDEP:=		ncurses
PKG_URL:=		http://www.tcsh.org/Welcome
PKG_SITES:=		ftp://ftp.astron.com/pub/tcsh/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,TCSH,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		ac_cv_func_setpgrp_void=yes

post-install:
	$(INSTALL_DIR) $(IDIR_TCSH)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/tcsh $(IDIR_TCSH)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
