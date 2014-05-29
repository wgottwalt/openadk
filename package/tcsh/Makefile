# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		tcsh
PKG_VERSION:=		6.18.01
PKG_RELEASE:=		3
PKG_MD5SUM:=		6eed09dbd4223ab5b6955378450d228a
PKG_DESCR:=		alternative csh
PKG_SECTION:=		base/shells
PKG_DEPENDS:=		libncurses
PKG_BUILDDEP:=		ncurses
PKG_URL:=		http://www.tcsh.org/Welcome
PKG_SITES:=		ftp://ftp.astron.com/pub/tcsh/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,TCSH,tcsh,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_LDFLAGS+=	-ltinfo
CONFIGURE_ENV+=		ac_cv_func_setpgrp_void=yes

tcsh-install:
	$(INSTALL_DIR) $(IDIR_TCSH)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/tcsh $(IDIR_TCSH)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
