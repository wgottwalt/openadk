# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		pcsc-lite
PKG_VERSION:=		1.6.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		fc3fd0e83090ecc81e5b32700fa246c2
PKG_DESCR:=		middleware for smartcards
PKG_SECTION:=		crypto
PKG_BUILDDEP+=		libusb libusb-compat
PKG_DEPENDS:=		libusb libusb-compat libpthread ccid
PKG_URL:=		http://pcsclite.alioth.debian.org/
PKG_SITES:=		https://alioth.debian.org/frs/download.php/3279/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,PCSC_LITE,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-libhal

post-install:
	$(INSTALL_DIR) $(IDIR_PCSC_LITE)/etc
	$(INSTALL_DIR) $(IDIR_PCSC_LITE)/usr/sbin
	$(INSTALL_DIR) $(IDIR_PCSC_LITE)/usr/lib
	$(INSTALL_DATA) ./files/reader.conf \
		$(IDIR_PCSC_LITE)/etc
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/pcscd \
		$(IDIR_PCSC_LITE)/usr/sbin
	$(CP) $(WRKINST)/usr/lib/libpcsclite.so* \
		$(IDIR_PCSC_LITE)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
