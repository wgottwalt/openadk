# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libc-test
PKG_VERSION:=		4a6c166000502bf741e8f878746dadfa3135a4df
PKG_RELEASE:=		1
PKG_DESCR:=		libc test suite
PKG_SECTION:=		base/libs
PKG_DEPENDS:=		make
PKG_URL:=		http://nsz.repo.hu/git/?p=libc-test
PKG_SITES:=		git://nsz.repo.hu:45100/repo/libc-test

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBC_TEST,libc-test,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

XAKE_FLAGS+=		GCC_HONOUR_COPTS=s RUN_TEST=:
CONFIG_STYLE:=		manual
INSTALL_STYLE:=		manual

libc-test-install:
	$(INSTALL_DIR) $(IDIR_LIBC_TEST)/opt/libc-test
	$(CP) $(WRKBUILD)/* $(IDIR_LIBC_TEST)/opt/libc-test

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
