# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		wiringPi
# actually git checkout from 05.12.2014
# 0a9fdeb29d31609ef834f050bdb8a7a65cd35e2b
PKG_VERSION:=		0.1
PKG_RELEASE:=		1
PKG_HASH:=		230a059d2106ba9402cb51a10167db9d7d817a4a1df3d55cd8d0ef220c0e8187
PKG_DESCR:=		GPIO access library for the BCM2835 used in the Raspberry Pi
PKG_SECTION:=		libs/misc
PKG_URL:=		http://wiringpi.com/
PKG_SITES:=		http://openadk.org/distfiles

PKG_SYSTEM_DEPENDS:=    raspberry-pi

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,WIRINGPI,wiringPi,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=         manual

TARGET_CPPFLAGS+=	-I../wiringPi

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
