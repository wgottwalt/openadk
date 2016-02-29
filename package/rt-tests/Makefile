# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		rt-tests
PKG_VERSION:=		3fed00ff8d2c0cdbc5ba078cbd60ce3cfcee615f
PKG_RELEASE:=		1
PKG_GIT:=		hash
PKG_DESCR:=		realtime test apps
PKG_NEEDS:=		threads rt
PKG_SECTION:=		base/tests
PKG_SITES:=		git://git.kernel.org/pub/scm/linux/kernel/git/clrkwllms/rt-tests

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,RT_TESTS,rt-tests,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

XAKE_FLAGS+=		prefix=/usr
CONFIG_STYLE:=		manual

rt-tests-install:
	$(INSTALL_DIR) $(IDIR_RT_TESTS)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/cyclictest \
		$(IDIR_RT_TESTS)/usr/bin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
