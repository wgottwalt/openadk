# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		adk-test-tools
PKG_VERSION:=		0.1
PKG_RELEASE:=		4
PKG_DESCR:=		helper tools and scripts for adk-test-framework
PKG_SECTION:=		misc
PKG_URL:=		http://openadk.org/

NO_DISTFILES:=		1

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,ADK_TEST_TOOLS,adk-test-tools,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

adk-test-tools-install:
	$(INSTALL_DIR) $(IDIR_ADK_TEST_TOOLS)/usr/bin
	$(INSTALL_BIN) $(WRKBUILD)/{qmp,quit} \
		$(IDIR_ADK_TEST_TOOLS)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
