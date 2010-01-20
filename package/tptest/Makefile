# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		tptest
PKG_VERSION:=		3.1.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		46f941bdab738a2a11ecc2a5f757ec77
PKG_DESCR:=		Internet bandwidth tester
PKG_SECTION:=		utils
PKG_DEPENDS:=
PKG_URL:=		http://tptest.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=tptest/}

# if downloaded package is not ending with .tar.gz use following
#DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,TPTEST,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

# use following to add ./configure options
#CONFIGURE_ARGS+=	--disable-foo
# overwrite any configure variables
#CONFIGURE_ENV+=	ac_cv_func_setpgrp_void=yes
#BUILD_STYLE:=		auto
#INSTALL_STYLE:=	auto

do-build:
	(cd ${WRKSRC}/apps/unix/server && ${MAKE} && ${MAKE} install DESTDIR="${WRKINST}")
	(cd ${WRKSRC}/apps/unix/client && ${MAKE} && ${MAKE} install DESTDIR="${WRKINST}")

# please install all files and directories to the package dir
do-install:
	$(INSTALL_DIR) $(IDIR_TPTEST)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/tptest{client,server} $(IDIR_TPTEST)/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
