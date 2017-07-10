# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libssh
PKG_VERSION:=		0.7.5
PKG_RELEASE:=		1
PKG_HASH:=		54e86dd5dc20e5367e58f3caab337ce37675f863f80df85b6b1614966a337095
PKG_DESCR:=		secure shell library
PKG_SECTION:=		libs/crypto
PKG_DEPENDS:=		zlib libressl
PKG_BUILDDEP:=		cmake-host zlib libressl
PKG_URL:=		http://www.libssh.org/
PKG_SITES:=		https://red.libssh.org/attachments/download/218/
PKG_OPTS:=		dev

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBSSH,libssh,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

WRKBUILD=               $(WRKDIR)/$(PKG_NAME)-obj
CONFIG_STYLE:=          cmake
CMAKE_FLAGS:=		-DOPENSSL_INCLUDE_DIRS='$(STAGING_TARGET_DIR)/usr/include' \
			-DOPENSSL_LIBRARIES='-lcrypto -lssl -lz' \
			-DZLIB_INCLUDE_DIR='$(STAGING_TARGET_DIR)/usr/include' \
			-DZLIB_LIBRARY='$(STAGING_TARGET_DIR)/usr/lib' \
			-DWITH_GSSAPI=off \
			-DWITH_EXAMPLES=off

libssh-install:
	$(INSTALL_DIR) $(IDIR_LIBSSH)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libssh*.so* \
		$(IDIR_LIBSSH)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
