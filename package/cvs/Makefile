# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		cvs
PKG_VERSION:=		1.11.23
PKG_RELEASE:=		1
PKG_MD5SUM:=		bf185eb51b5918330a04671c3f3cccde
PKG_DESCR:=		concurrent version system
PKG_SECTION:=		scm
PKG_URL:=		http://www.nongnu.org/cvs/
PKG_SITES:=		http://ftp.gnu.org/non-gnu/cvs/source/stable/${PKG_VERSION}/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,CVS,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

#CONFIG_STYLE:=		manual
# use following to add ./configure options
#CONFIGURE_ARGS+=	--disable-foo
# overwrite any configure variables
#CONFIGURE_ENV+=	ac_cv_func_setpgrp_void=yes
#BUILD_STYLE:=		manual
#INSTALL_STYLE:=	manual

post-install:
	$(INSTALL_DIR) $(IDIR_CVS)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/cvs \
		$(IDIR_CVS)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
