# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libcec
PKG_VERSION:=		2.2.0
PKG_RELEASE:=		2
PKG_HASH:=		da8a0c5acf2f9134e38d7993c08d960b7da2a9ea6b6b557a9d788361884b8396
PKG_DESCR:=		control your device with your tv remote control
PKG_SECTION:=		libs/video
PKG_DEPENDS:=		libudev
PKG_BUILDDEP:=		eudev
PKG_URL:=		http://libcec.pulse-eight.com/
PKG_SITES:=		http://openadk.org/distfiles/
PKG_OPTS:=		dev

PKG_DEPENDS_RASPBERRY_PI:=	bcm2835-vc
PKG_BUILDDEP_RASPBERRY_PI:=	bcm2835-vc
PKG_DEPENDS_RASPBERRY_PI2:=	bcm2835-vc
PKG_BUILDDEP_RASPBERRY_PI2:=	bcm2835-vc
PKG_SYSTEM_DEPENDS:=    raspberry-pi raspberry-pi2 solidrun-imx6

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBCEC,libcec,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

AUTOTOOL_STYLE:=	autoreconf
ifeq ($(ADK_TARGET_SYSTEM_SOLIDRUN_IMX6),y)
CONFIGURE_ARGS+=	--enable-imx6
endif
ifeq ($(ADK_TARGET_SYSTEM_RASPBERRY_PI),y)
CONFIGURE_ARGS+=	--enable-rpi \
			--with-rpi-include-path=$(STAGING_TARGET_DIR)/opt/vc/include \
			--with-rpi-lib-path=$(STAGING_TARGET_DIR)/opt/vc/lib
endif
ifeq ($(ADK_TARGET_SYSTEM_RASPBERRY_PI2),y)
CONFIGURE_ARGS+=	--enable-rpi \
			--with-rpi-include-path=$(STAGING_TARGET_DIR)/opt/vc/include \
			--with-rpi-lib-path=$(STAGING_TARGET_DIR)/opt/vc/lib
endif

libcec-install:
	$(INSTALL_DIR) $(IDIR_LIBCEC)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libcec*.so* \
		$(IDIR_LIBCEC)/usr/lib
	$(INSTALL_DIR) $(IDIR_LIBCEC)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/cec-client \
		$(IDIR_LIBCEC)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
