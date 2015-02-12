# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		wiringPi
PKG_VERSION:=		72b2af231be337d45a557ce6ca3ed1eeb6675ffd
PKG_RELEASE:=		2
PKG_DESCR:=		gpio access library for the raspberry pi
PKG_SECTION:=		libs/misc
PKG_HASH:=		ddc71b86f71e7e5104a89f88a68bea20122b6ea9f8c535219d180bf89502a69d
PKG_DEPENDS:=		libpthread
PKG_URL:=		http://wiringpi.com/
PKG_SITES:=		git://git.drogon.net/wiringPi
PKG_LIBNAME:=		wiringpi

PKG_SYSTEM_DEPENDS:=    raspberry-pi raspberry-pi2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,WIRINGPI,wiringpi,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=         manual

TARGET_CPPFLAGS+=	-I../wiringPi
TARGET_CPPFLAGS+=	-D_GNU_SOURCE

do-build:
	(cd $(WRKBUILD); $(MAKE) -C wiringPi)
	(cd $(WRKBUILD); $(MAKE) -C devLib)
	(cd $(WRKBUILD); $(MAKE) -C gpio)

wiringpi-install:
	$(INSTALL_DIR) $(IDIR_WIRINGPI)/usr/lib
	$(CP) $(WRKBUILD)/wiringPi/libwiringPi.so* $(IDIR_WIRINGPI)/usr/lib
	$(CP) $(WRKBUILD)/devLib/libwiringPiDev.so* $(IDIR_WIRINGPI)/usr/lib
	$(INSTALL_DIR) $(IDIR_WIRINGPI)/usr/bin
	$(INSTALL_BIN) $(WRKBUILD)/gpio/gpio $(IDIR_WIRINGPI)/usr/bin
	$(CP) $(WRKBUILD)/wiringPi/*.h $(STAGING_TARGET_DIR)/usr/include
	$(CP) $(WRKBUILD)/wiringPi/libwiringPi.so* $(STAGING_TARGET_DIR)/usr/lib
	$(CP) $(WRKBUILD)/devLib/libwiringPiDev.so* $(STAGING_TARGET_DIR)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
