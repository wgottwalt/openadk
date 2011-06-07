# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		alix-temperature
PKG_VERSION:=		1.0
PKG_RELEASE:=		1
PKG_DESCR:=		read alix boards i2c thermal sensor
PKG_SECTION:=		utils
PKG_DEPENDS:=		i2c-tools

PKG_CFLINE_ALIX_TEMPERATURE:=depends on (ADK_TARGET_SYSTEM_PCENGINES_ALIX2D2 || ADK_TARGET_SYSTEM_PCENGINES_ALIX2D13)
NO_DISTFILES:=		1

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,ALIX_TEMPERATURE,alix-temperature,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

alix-temperature-install:
	$(INSTALL_DIR) $(IDIR_ALIX_TEMPERATURE)/usr/sbin
	$(INSTALL_BIN) ./files/alix-temperature $(IDIR_ALIX_TEMPERATURE)/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
