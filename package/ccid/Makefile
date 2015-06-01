# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		ccid
PKG_VERSION:=		1.4.17
PKG_RELEASE:=		1
PKG_HASH:=		ccdab8a9bc1ad288242d5f9ef399405e9cb96fb09caadb43e3649cbaba84c451
PKG_DESCR:=		generic usb ccid and iccd driver
PKG_SECTION:=		app/crypto
PKG_BUILDDEP:=		pcsc-lite
PKG_URL:=		http://pcsclite.alioth.debian.org/ccid.html
PKG_SITES:=		http://distfiles.openadk.org/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,CCID,ccid,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--enable-twinserial

ccid-install:
	$(INSTALL_DIR) $(IDIR_CCID)/etc/reader.conf.d
	$(INSTALL_DIR) $(IDIR_CCID)/usr/lib/pcsc/drivers
	$(INSTALL_DATA) ./files/gemalto.conf \
		$(IDIR_CCID)/etc/reader.conf.d
	$(CP) $(WRKINST)/usr/lib/pcsc/drivers/* \
		$(IDIR_CCID)/usr/lib/pcsc/drivers

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
