# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		tcsh
PKG_VERSION:=		6.18.01
PKG_RELEASE:=		3
PKG_HASH:=		d81ca27851f3e8545666399b4bcf25433e602a195113b3f7c73886fef84c9fa8
PKG_DESCR:=		alternative csh
PKG_SECTION:=		base/shells
PKG_DEPENDS:=		libncurses
PKG_BUILDDEP:=		ncurses
PKG_URL:=		http://www.tcsh.org/Welcome
PKG_SITES:=		ftp://ftp.astron.com/pub/tcsh/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,TCSH,tcsh,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_LDFLAGS+=	-ltinfo
CONFIGURE_ENV+=		ac_cv_func_setpgrp_void=yes

tcsh-install:
	$(INSTALL_DIR) $(IDIR_TCSH)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/tcsh $(IDIR_TCSH)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
