# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		ccid
PKG_VERSION:=		1.3.12
PKG_RELEASE:=		1
PKG_MD5SUM:=		7fcdbacacd955659286f988fa9b6e0be
PKG_DESCR:=		a generic USB CCID and ICCD driver
PKG_SECTION:=		security
PKG_URL:=		http://pcsclite.alioth.debian.org/ccid.html
PKG_SITES:=		https://alioth.debian.org/frs/download.php/3281/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,CCID,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--enable-twinserial

post-install:
	$(INSTALL_DIR) $(IDIR_CCID)/usr/pcsc/drivers/serial
	$(CP) $(WRKINST)/usr/pcsc/drivers/serial/libccidtwin.so* \
		$(IDIR_CCID)/usr/pcsc/drivers/serial

include ${TOPDIR}/mk/pkg-bottom.mk
