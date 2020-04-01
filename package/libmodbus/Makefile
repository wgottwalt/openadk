# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libmodbus
PKG_VERSION:=		3.1.6
PKG_RELEASE:=		1
PKG_HASH:=		d7d9fa94a16edb094e5fdf5d87ae17a0dc3f3e3d687fead81835d9572cf87c16
PKG_DESCR:=		MODBUS protocol library
PKG_SECTION:=		libs/net
PKG_URL:=		http://libmodbus.org
PKG_SITES:=		https://libmodbus.org/releases/
DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBMODBUS,libmodbus,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIGURE_ARGS+=	--without-documentation --disable-tests

libmodbus-install:
	$(INSTALL_DIR) $(IDIR_LIBMODBUS)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libmodbus*.so* \
		$(IDIR_LIBMODBUS)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
