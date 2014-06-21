# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		pcsc-lite
PKG_VERSION:=		1.7.4
PKG_RELEASE:=		2
PKG_MD5SUM:=		1caf0b8ca2ecbf82fe3b035b3fff22dd
PKG_DESCR:=		middleware for smartcards
PKG_SECTION:=		app/crypto
PKG_DEPENDS:=		libusb libusb-compat libpthread
PKG_BUILDDEP:=		libusb libusb-compat
PKG_URL:=		http://pcsclite.alioth.debian.org/
PKG_SITES:=		http://openadk.org/distfiles/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,PCSC_LITE,pcsc-lite,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-libudev

pcsc-lite-install:
	$(INSTALL_DIR) $(IDIR_PCSC_LITE)/etc/reader.conf.d
	$(INSTALL_DIR) $(IDIR_PCSC_LITE)/usr/sbin
	$(INSTALL_DIR) $(IDIR_PCSC_LITE)/usr/lib
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/pcscd \
		$(IDIR_PCSC_LITE)/usr/sbin
	$(CP) $(WRKINST)/usr/lib/libpcsclite.so* \
		$(IDIR_PCSC_LITE)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
