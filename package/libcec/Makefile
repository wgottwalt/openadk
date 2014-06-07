# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libcec
PKG_VERSION:=		2.1.4
PKG_RELEASE:=		5
PKG_MD5SUM:=		faa58944f87e9beda165f615d4b46766
PKG_DESCR:=		control your device with your tv remote control
PKG_SECTION:=		libs/video
PKG_DEPENDS:=		libudev
PKG_BUILDDEP:=		autotool eudev
PKG_URL:=		http://libcec.pulse-eight.com/
PKG_SITES:=		http://packages.pulse-eight.net/pulse/sources/libcec/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_DEPENDS_RASPBERRY_PI:=	bcm2835-vc
PKG_BUILDDEP_RASPBERRY_PI:=	bcm2835-vc
PKG_SYSTEM_DEPENDS:=    raspberry-pi ibm-x40
PKG_LIBC_DEPENDS:=      glibc musl

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBCEC,libcec,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

AUTOTOOL_STYLE:=	autoreconf
ifeq ($(ADK_TARGET_SYSTEM_RASPBERRY_PI),y)
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

include ${TOPDIR}/mk/pkg-bottom.mk
