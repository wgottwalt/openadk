# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		wiringPi
PKG_VERSION:=		0a9fdeb29d31609ef834f050bdb8a7a65cd35e2b
PKG_RELEASE:=		1
PKG_DESCR:=		gpio access library for the raspberry pi
PKG_SECTION:=		libs/misc
PKG_HASH:=		ddc71b86f71e7e5104a89f88a68bea20122b6ea9f8c535219d180bf89502a69d
PKG_URL:=		http://wiringpi.com/
PKG_SITES:=		git://git.drogon.net/wiringPi

PKG_SYSTEM_DEPENDS:=    raspberry-pi raspberry-pi2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,WIRINGPI,wiringPi,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=         manual

TARGET_CPPFLAGS+=	-I../wiringPi
TARGET_CPPFLAGS+=	-D_GNU_SOURCE

do-build:
	(cd $(WRKBUILD); $(MAKE) -C wiringPi)
	(cd $(WRKBUILD); $(MAKE) -C devLib)

wiringPi-install:
	$(INSTALL_DIR) $(IDIR_WIRINGPI)/usr/lib
	$(CP) $(WRKBUILD)/wiringPi/libwiringPi.so* $(IDIR_WIRINGPI)/usr/lib
	$(CP) $(WRKBUILD)/devLib/libwiringPiDev.so* $(IDIR_WIRINGPI)/usr/lib
	(cd $(IDIR_WIRINGPI)/usr/lib; ln -sf libwiringPi.so.2.0 libwiringPi.so)
	(cd $(IDIR_WIRINGPI)/usr/lib; ln -sf libwiringPiDev.so.2.0 libwiringPiDev.so)
	$(CP) $(WRKBUILD)/wiringPi/*.h $(STAGING_TARGET_DIR)/usr/include

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
