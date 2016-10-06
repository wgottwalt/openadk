# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		rt-tests
PKG_VERSION:=		bddffd32c9483318fe72d02183981bdcf006d9dc
PKG_RELEASE:=		1
PKG_GIT:=		hash
PKG_DESCR:=		realtime test apps
PKG_SECTION:=		base/tests
PKG_NEEDS:=		threads
PKG_SITES:=		https://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,RT_TESTS,rt-tests,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

XAKE_FLAGS+=		prefix=/usr NUMA=0
CONFIG_STYLE:=		manual

rt-tests-install:
	$(INSTALL_DIR) $(IDIR_RT_TESTS)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/cyclictest \
		$(IDIR_RT_TESTS)/usr/bin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
