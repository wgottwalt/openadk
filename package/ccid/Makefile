# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		ccid
PKG_VERSION:=		1.4.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		79ef91103bcdd99a3b31cb5c5721a829
PKG_DESCR:=		generic usb ccid and iccd driver
PKG_SECTION:=		app/crypto
PKG_BUILDDEP:=		pcsc-lite
PKG_URL:=		http://pcsclite.alioth.debian.org/ccid.html
PKG_SITES:=		http://openadk.org/distfiles/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,CCID,ccid,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CFLAGS:=         $(filter-out -flto,$(TARGET_CFLAGS))
CONFIGURE_ARGS+=	--enable-twinserial

ccid-install:
	$(INSTALL_DIR) $(IDIR_CCID)/etc/reader.conf.d
	$(INSTALL_DIR) $(IDIR_CCID)/usr/lib/pcsc/drivers
	$(INSTALL_DATA) ./files/gemalto.conf \
		$(IDIR_CCID)/etc/reader.conf.d
	$(CP) $(WRKINST)/usr/lib/pcsc/drivers/* \
		$(IDIR_CCID)/usr/lib/pcsc/drivers

include ${TOPDIR}/mk/pkg-bottom.mk
