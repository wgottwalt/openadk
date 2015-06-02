# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		pcsc-lite
PKG_VERSION:=		1.8.13
PKG_RELEASE:=		1
PKG_HASH:=		f315047e808d63a3262c4a040f77548af2e04d1fd707e0c2759369b926fbbc3b
PKG_DESCR:=		middleware for smartcards
PKG_SECTION:=		app/crypto
PKG_DEPENDS:=		libusb libusb-compat libpthread
PKG_BUILDDEP:=		libusb libusb-compat
PKG_URL:=		http://pcsclite.alioth.debian.org/
PKG_SITES:=		https://alioth.debian.org/frs/download.php/file/4126/
PKG_OPTS:=		dev

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.bz2

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
