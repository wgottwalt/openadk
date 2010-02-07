# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		findutils
PKG_VERSION:=		4.4.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		351cc4adb07d54877fa15f75fb77d39f
PKG_DESCR:=		GNU utilities for finding files
PKG_SECTION:=		utils
PKG_DEPENDS:=		libpthread
PKG_URL:=		http://www.gnu.org/software/findutils/
PKG_SITES:=		http://ftp.gnu.org/pub/gnu/findutils/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,FINDUTILS,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		gl_cv_func_wcwidth_works=yes

post-install:
	$(INSTALL_DIR) $(IDIR_FINDUTILS)/usr/{s,}bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/{find,locate,oldfind,updatedb,xargs} \
		 $(IDIR_FINDUTILS)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/{bigram,code,frcode} \
		$(IDIR_FINDUTILS)/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
