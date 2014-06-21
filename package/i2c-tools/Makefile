# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		i2c-tools
PKG_VERSION:=		3.1.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		0fdbff53ebd0b8d9249256d6c56480b1
PKG_DESCR:=		i2c tools
PKG_SECTION:=		sys/misc
PKG_URL:=		http://www.lm-sensors.org/wiki/I2CTools
PKG_SITES:=		http://dl.lm-sensors.org/i2c-tools/releases/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,I2C_TOOLS,i2c-tools,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual

i2c-tools-install:
	$(INSTALL_DIR) $(IDIR_I2C_TOOLS)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/i2c* \
		$(IDIR_I2C_TOOLS)/usr/sbin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
