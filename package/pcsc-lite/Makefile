# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		pcsc-lite
PKG_VERSION:=		1.6.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		f80d3ecd9569b71d557f283f16295c74
PKG_DESCR:=		middleware for smartcards
PKG_SECTION:=		crypto
PKG_DEPENDS:=		libusb libusb-compat libpthread
PKG_BUILDDEP:=		libusb libusb-compat
PKG_URL:=		http://pcsclite.alioth.debian.org/
PKG_SITES:=		http://alioth.debian.org/frs/download.php/3479/

PKG_SUBPKGS:=		PCSC_LITE PCSC_LITE_DEV
PKGSD_PCSC_LITE_DEV:=	header files for pcsc-lite
PKGSC_PCSC_LITE_DEV:=	devel

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,PCSC_LITE,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PCSC_LITE_DEV,$(PKG_NAME)-dev,$(PKG_VERSION)-${PKG_RELEASE},,${PKGSD_PCSC_LITE_DEV},${PKGSC_PCSC_LITE_DEV}))

CONFIGURE_ARGS+=	--disable-libhal

post-install:
	$(INSTALL_DIR) $(IDIR_PCSC_LITE)/etc/reader.conf.d
	$(INSTALL_DIR) $(IDIR_PCSC_LITE)/usr/sbin
	$(INSTALL_DIR) $(IDIR_PCSC_LITE)/usr/lib
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/pcscd \
		$(IDIR_PCSC_LITE)/usr/sbin
	$(CP) $(WRKINST)/usr/lib/libpcsclite.so* \
		$(IDIR_PCSC_LITE)/usr/lib

pcsc-lite-dev-install:
	${INSTALL_DIR} ${IDIR_PCSC_LITE_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_PCSC_LITE_DEV}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
