# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xinput_calibrator
PKG_VERSION:=		0.7.5
PKG_RELEASE:=		2
PKG_MD5SUM:=		20da0a2055a5a75962add8c6b44f60fa
PKG_DESCR:=		X11 input calibration utility
PKG_SECTION:=		x11/apps
PKG_DEPENDS:=		libstdcxx
PKG_URL:=		http://github.com/downloads/tias/xinput_calibrator/
PKG_SITES:=		http://openadk.org/distfiles/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XINPUT_CALIBRATOR,xinput-calibrator,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

xinput-calibrator-install:
	$(INSTALL_DIR) $(IDIR_XINPUT_CALIBRATOR)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/xinput_calibrator \
		$(IDIR_XINPUT_CALIBRATOR)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
