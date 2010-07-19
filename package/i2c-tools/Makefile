# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		i2c-tools
PKG_VERSION:=		3.0.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		b546345ac19db56719dea6b8199f11e0
PKG_DESCR:=		I2C tools for Linux
PKG_SECTION:=		misc
PKG_URL:=		http://www.lm-sensors.org/wiki/I2CTools
PKG_SITES:=		http://dl.lm-sensors.org/i2c-tools/releases/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,I2C_TOOLS,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual

post-install:
	$(INSTALL_DIR) $(IDIR_I2C_TOOLS)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/i2c* \
		$(IDIR_I2C_TOOLS)/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
