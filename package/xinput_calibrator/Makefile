# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xinput_calibrator
PKG_VERSION:=		0.7.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		20da0a2055a5a75962add8c6b44f60fa
PKG_DESCR:=		X11 input calibration utility
PKG_SECTION:=		x11/apps
PKG_URL:=		https://github.com/tias/xinput_calibrator
PKG_SITES:=		https://github.com/downloads/tias/xinput_calibrator/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XINPUT_CALIBRATOR,xinput_calibrator,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

xinput_calibrator-install:
	$(INSTALL_DIR) $(IDIR_XINPUT_CALIBRATOR)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/xinput_calibrator \
		$(IDIR_XINPUT_CALIBRATOR)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
