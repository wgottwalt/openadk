# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		i2400m-fw
PKG_VERSION:=		1.5.0
PKG_RELEASE:=		1
PKG_HASH:=		edcb7c5322c0185173a2dc79b3df4bc74964edfa741ebf9a09cd70a32d758c3d
PKG_DESCR:=		Intel (R) WiMAX 5150/5350/6250 Firmware
PKG_SECTION:=		net/misc
PKG_URL:=		http://www.linuxwimax.org
PKG_SITES:=		"http://www.linuxwimax.org/Download?action=AttachFile&do=get&target="
DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,I2400M_FW,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-install:
	$(INSTALL_DIR) $(IDIR_I2400M_FW)/lib/firmware
	$(INSTALL_DATA) $(WRKDIST)/*-fw-usb-*.sbcf \
		$(IDIR_I2400M_FW)/lib/firmware/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
